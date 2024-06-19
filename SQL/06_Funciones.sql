-- USE para selecionar la base de datos con la que queramos trabaja
USE nelflix;


-- Funcion : fn_get_contenido 'Busca los titulos en base al id deseado'
-- DROP FUNCTION IF EXISTS fn_get_contenido;
DELIMITER $$

CREATE FUNCTION fn_get_contenido (p_id INT) 
RETURNS varchar(100)
DETERMINISTIC
BEGIN

	-- Declaramos las variables
	DECLARE v_resultado VARCHAR(100);
    
    -- Manejo de error en casos en que no se encuentre el ID
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_resultado = 'No encontrado';
    
    -- Selecciona el titulo en la variable resultado
	SELECT titulo
	INTO v_resultado 
	FROM contenidos
	WHERE id_contenido = p_id
    ;
    
	RETURN v_resultado;
END$$

DELIMITER ;

 -- SELECT fn_get_contenido() AS Titulo;


-- Funcion : fn_tiene_suscripcion_activa 'En base a su id, se obtiene si la suscripcion esta activa o inactiva'
-- DROP FUNCTION IF EXISTS fn_tiene_suscri_act;
DELIMITER $$

CREATE FUNCTION fn_tiene_suscri_act (p_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    -- Declaracion de variable
    DECLARE v_activa VARCHAR(20);
    
    -- Manejo de error en casos de que no encuentre el id
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_activa = 'No encontrado';
    
    -- Consulta interna
    SELECT IF(suscripcion, 'Activa', 'Inactiva')
    INTO v_activa 
    FROM usuarios
    WHERE id_usuario = p_id
    ;

    RETURN v_activa;
END$$

DELIMITER ;

-- SELECT fn_tiene_suscri_act() AS Suscripcion;


-- Funcion : fn_disp_usuario 'En base a su id, se obtiene la cantidad de dispositivos que tiene vinculado este usuario'
-- DROP FUNCTION IF EXISTS fn_disp_usuario;
DELIMITER $$

CREATE FUNCTION fn_disp_usuario (p_id_usuario INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_cantidad INT;
    
    -- Manejamos el error
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET v_cantidad = -1;
	
    -- Consulta
    SELECT COUNT(*) INTO v_cantidad
    FROM dispositivos
    WHERE id_usuario_disp = p_id_usuario;
    
    -- Verificamos si encontro el usuario
    IF v_cantidad = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario insertado no existe';
	END IF;
    
    RETURN v_cantidad;
END$$

DELIMITER ;

-- SELECT fn_disp_usuario() AS Cantidad_dispositivos;