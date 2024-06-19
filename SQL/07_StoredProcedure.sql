-- -- USE para selecionar la base de datos con la que queramos trabaja
USE nelflix;


-- Stored Procedure : sp_ordena_usuarios 'Con 2 parametros de entrada, columna y orden, ordena la tabla' 
-- DROP PROCEDURE IF EXISTS sp_ordena_usuarios;
DELIMITER $$

CREATE PROCEDURE sp_ordena_usuarios (
    IN p_columna VARCHAR(20),
    IN p_tipoOrden VARCHAR(4)
)
BEGIN
    DECLARE v_consulta VARCHAR(1000);

    -- Validando parametros de entrada
    IF NOT (p_columna IN ('id_usuario', 'nombre_completo', 'email', 'suscripcion', 'f_insercion_us')) THEN
        SELECT 'Error: Columna especificada no es válida' AS mensaje;
    END IF;

    IF NOT (p_tipoOrden IN ('ASC', 'DESC')) THEN
        SELECT 'Error: Tipo de orden especificado no es válido' AS mensaje;
    END IF;

    -- Consulta dinamica utilizando parametros vinculados
    SET @v_consulta = CONCAT('SELECT * FROM usuarios ORDER BY ', p_columna, ' ', p_tipoOrden);

    -- Ejecución de la consulta
    PREPARE stmt FROM @v_consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

-- call sp_ordena_usuarios('', '');


-- Stored Procedure : sp_busca_info_peliculas 'Con 1 parametro de entrada, siendo este el nombre de la pelicula, busca toda su informacion'
-- DROP PROCEDURE IF EXISTS sp_busca_info_peliculas;
DELIMITER $$

CREATE PROCEDURE sp_busca_info_peliculas (IN p_nombre VARCHAR(255))
BEGIN

    DECLARE v_num_rows INT;

    -- Busca la informacion de la película
    SELECT COUNT(*) INTO v_num_rows
    FROM contenidos
    WHERE titulo = p_nombre;

    -- Si se encuentra alguna pelicula, muestra la informacion
    IF v_num_rows > 0 THEN
        SELECT id_contenido, duracion_min, titulo, descripcion_cont, lanzamiento
        FROM contenidos
        WHERE titulo = p_nombre;
    ELSE
        SELECT 'No se encontró ninguna película con el nombre especificado' AS mensaje;
    END IF;
END$$

DELIMITER ;

-- call sp_busca_info_peliculas('');