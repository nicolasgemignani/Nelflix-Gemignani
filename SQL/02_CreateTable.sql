-- USE para selecionar la base de datos con la que queramos trabajar
USE nelflix;


-- Creacion de la tabla: usuarios 'Guarda los registros de todos los usuarios'
-- DROP TABLE IF EXISTS usuarios;
CREATE TABLE IF NOT EXISTS usuarios (
	id_usuario INT AUTO_INCREMENT,
    nombre_completo VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    suscripcion BOOLEAN DEFAULT FALSE NOT NULL,
	f_insercion_us DATE NOT NULL,
    CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario)
);


-- Creacion de la tabla: dispositivos 'Guarda los tipo de dispositivos que maneja cada usuario'
-- DROP TABLE IF EXISTS dispositivos;
CREATE TABLE IF NOT EXISTS dispositivos (
	id_dispositivo INT AUTO_INCREMENT,
    id_usuario_disp INT NOT NULL,
    dispositivo ENUM('Tablet', 'Celular', 'Computadora', 'Television') NOT NULL,
    sist_operativo VARCHAR (20),
    f_insercion_disp DATE NOT NULL,
    CONSTRAINT pk_dispositivos PRIMARY KEY (id_dispositivo),
    CONSTRAINT fk_dispositivos_usuarios FOREIGN KEY (id_usuario_disp) REFERENCES usuarios (id_usuario)
);


-- Creacion de la tabla: generos 'Guarda los generos existenes en esta base de datos'
-- DROP TABLE IF EXISTS generos;
CREATE TABLE IF NOT EXISTS generos(
	id_genero INT AUTO_INCREMENT,
    genero VARCHAR(50) NOT NULL,
    f_insercion_gen DATE NOT NULL,
    CONSTRAINT pk_generos PRIMARY KEY (id_genero),
    UNIQUE (genero)
);


-- Creacion de la tabla: clasificaciones 'Guarda las clasificaciones de los contenidos'
-- DROP TABLE IF EXISTS clasificaciones;
CREATE TABLE IF NOT EXISTS clasificaciones(
	id_clasificacion INT AUTO_INCREMENT,
    clasificacion ENUM('G', 'PG', 'PG13', 'R', 'NC17') NOT NULL,
    descripcion_clas TEXT,
    f_insercion_clas DATE NOT NULL,
    CONSTRAINT pk_clasificaciones PRIMARY KEY (id_clasificacion),
    UNIQUE (clasificacion)
);


-- Creacion de la tabla : contenidos 'Guarda todos los contenidos en la base de datos'
-- DROP TABLE IF EXISTS contenidos;
CREATE TABLE IF NOT EXISTS contenidos (
	id_contenido INT AUTO_INCREMENT,
    id_genero_cont INT NOT NULL,
    id_clasific_cont INT NOT NULL,
    duracion_min INT CHECK (duracion_min > 0) NOT NULL,
    titulo VARCHAR(250) NOT NULL,
    director VARCHAR(250) NOT NULL,
    descripcion_cont TEXT,
    lanzamiento DATE,
    f_insercion_cont DATE NOT NULL,
    CONSTRAINT pk_contenidos PRIMARY KEY (id_contenido),
    CONSTRAINT fk_contenidos_generos FOREIGN KEY (id_genero_cont) REFERENCES generos (id_genero),
    CONSTRAINT fk_contenidos_clasificaciones FOREIGN KEY (id_clasific_cont) REFERENCES clasificaciones (id_clasificacion)
);


-- Creacion de la tabla : calificaciones 'Guarda las calificaciones hechas por los usuarios'
-- DROP TABLE IF EXISTS calificaciones;
CREATE TABLE IF NOT EXISTS calificaciones(
	id_calificacion INT AUTO_INCREMENT,
    id_usuario_calif INT NOT NULL,
    id_contenido_calif INT NOT NULL,
    calificacion INT CHECK (calificacion > 0 AND calificacion <= 10) NOT NULL,
    descripcion_calif TEXT,
    f_insercion_calif DATE NOT NULL,
    CONSTRAINT pk_calificaciones PRIMARY KEY (id_calificacion),
    CONSTRAINT fk_califiaciones_usuarios FOREIGN KEY (id_usuario_calif) REFERENCES usuarios (id_usuario),
    CONSTRAINT fk_calificaciones_contenidos FOREIGN KEY (id_contenido_calif) REFERENCES contenidos (id_contenido)
);


-- Creacion de la tabla : idiomas 'Guarda los idiomas con los que trabaja la base de datos'
-- DROP TABLE IF EXISTS idiomas;
CREATE TABLE IF NOT EXISTS idiomas(
	id_idioma INT AUTO_INCREMENT,
    idioma VARCHAR(50) NOT NULL,
    f_insercion_idio DATE NOT NULL,
    CONSTRAINT pk_idiomas PRIMARY KEY (id_idioma),
    UNIQUE (idioma)
);


-- Creacion de la tabla : cont_idiomas_asociacion 'Guarda la informacion de que idioma tiene cada contenido' 
-- DROP TABLE IF EXISTS cont_idiom_asoc;
CREATE TABLE IF NOT EXISTS cont_idiom_asoc(
    id_contenido_as INT,
    id_idioma_as INT,
    f_insercion_as DATE NOT NULL,
    CONSTRAINT pk_asociacion PRIMARY KEY (id_contenido_as, id_idioma_as),
    CONSTRAINT fk_asociacion_contenidos FOREIGN KEY (id_contenido_as) REFERENCES contenidos (id_contenido),
    CONSTRAINT fk_asociacion_idiomas FOREIGN KEY (id_idioma_as) REFERENCES idiomas (id_idioma)
);


-- Creacion de la tabla : cont_subtitulos_asociacion 'Guarda la informacion de que subtitulo tiene cada contenido'
-- DROP TABLE IF EXISTS cont_subt_asoc;
CREATE TABLE IF NOT EXISTS cont_subt_asoc(
    id_contenido_subt INT,
    id_idioma_subt INT,
    f_insercion_subt DATE NOT NULL,
    CONSTRAINT pk_subtitulos PRIMARY KEY (id_contenido_subt, id_idioma_subt),
    CONSTRAINT fk_subtitulos_contenidos FOREIGN KEY (id_contenido_subt) REFERENCES contenidos (id_contenido),
    CONSTRAINT fk_subtitulos_idiomas FOREIGN KEY (id_idioma_subt) REFERENCES idiomas (id_idioma)
);


-- Creacion de la tabla : us_auditoria 'Audita la tabla usuarios se completa con un trigger'
-- DROP TABLE IF EXISTS us_auditoria;
CREATE TABLE IF NOT EXISTS us_auditoria (
	id_auditoria INT AUTO_INCREMENT,
    usuario_sistema VARCHAR(255) NOT NULL,
    tip_accion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    descrip_accion TEXT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT pk_usuarios_auditoria PRIMARY KEY (id_auditoria),
    INDEX idx_tip_accion (tip_accion)
);


-- Creacion de la tabla : disp_auditoria 'Audita la tabla dispositivos se completa con un trigger'
-- DROP TABLE IF EXISTS disp_auditoria;
CREATE TABLE IF NOT EXISTS disp_auditoria (
	id_auditoria INT AUTO_INCREMENT,
    usuario_sistema VARCHAR(255) NOT NULL,
    tip_accion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    descrip_accion TEXT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT pk_dispositivos_auditoria PRIMARY KEY (id_auditoria),
    INDEX idx_tip_accion (tip_accion)
);