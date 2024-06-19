-- USE para selecionar la base de datos con la que queramos trabaja
USE nelflix;


-- Vista : vw_usuarios
-- DROP VIEW IF EXISTS usuario_final.vw_usuarios;
CREATE OR REPLACE VIEW usuario_final.vw_usuarios AS
SELECT id_usuario, nombre_completo, email, suscripcion, f_insercion_us
FROM usuarios
;
-- SELECT * FROM usuario_final.vw_usuarios;


-- Vista : vw_contenido_popular
-- DROP VIEW IF EXISTS usuario_final.vw_contenido_popular;
CREATE OR REPLACE VIEW usuario_final.vw_contenido_popular AS
SELECT titulo, calificacion, descripcion_calif
FROM contenidos 
JOIN calificaciones ON id_contenido = id_contenido_calif
ORDER BY calificacion DESC
;
-- SELECT * FROM usuario_final.vw_contenido_popular;


-- Vista : vw_dispositivos_usuarios
-- DROP VIEW IF EXISTS usuario_final.vw_dispositivos_usuarios;
CREATE OR REPLACE VIEW usuario_final.vw_dispositivos_usuarios AS
SELECT nombre_completo, d.*
FROM usuarios u
JOIN dispositivos d ON u.id_usuario = d.id_usuario_disp
;
-- SELECT * FROM usuario_final.vw_dispositivos_usuarios;


-- Vista : vw_usuarios_disp_celulares
-- DROP VIEW IF EXISTS usuario_final.vw_usuarios_disp_celulares;
CREATE OR REPLACE VIEW usuario_final.vw_usuarios_disp_celulares AS
SELECT id_usuario, nombre_completo, email
FROM usuarios
WHERE id_usuario IN (SELECT id_usuario_disp
					  FROM dispositivos
					  WHERE dispositivo = 'celular')
;
-- SELECT * FROM usuario_final.vw_usuarios_disp_celulares;


-- Vista : vw_cant_disp_por_usuario
-- DROP VIEW IF EXISTS usuario_final.vw_cant_disp_por_usuario;
CREATE OR REPLACE VIEW usuario_final.vw_cant_disp_por_usuario AS
SELECT id_usuario, nombre_completo, COUNT(id_dispositivo) AS cantidad_dispositivos
FROM usuarios
LEFT JOIN dispositivos
ON id_usuario = id_usuario_disp
GROUP BY id_usuario, nombre_completo
;
-- SELECT * FROM usuario_final.vw_cant_disp_por_usuario;