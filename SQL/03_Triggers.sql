-- USE para selecionar la base de datos con la que queramos trabajar
USE nelflix;

-- SQL_SAFE_UPDATES = 0 para descactivare el modo seguro y poder ejecutar UPDATE y DELETE
SET SQL_SAFE_UPDATES = 0;


-- Trigger : before_insert_cont_idiom_asoc 'Plasma el dia que se inserto, sin necesidad de estara codeando'

-- DROP TRIGGER tr_cont_idiom_asoc_insert;
DELIMITER $$

CREATE TRIGGER tr_cont_idiom_asoc_insert
BEFORE INSERT ON cont_idiom_asoc
FOR EACH ROW
BEGIN
    SET NEW.f_insercion_as = CURDATE();
END$$

DELIMITER ;


--  ------------------------------------ Triggers us_auditoria

-- Creacion del trigger : tr_usuario_insert 'Creado para auditar todo lo que se inserte en usuarios'
-- DROP TRIGGER tr_usuario_insert;
DELIMITER $$

CREATE TRIGGER tr_usuario_insert
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO us_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'INSERT', CONCAT('Usuario creado: ', NEW.nombre_completo), CURDATE(), CURTIME());
END$$

DELIMITER ;

-- Creacion del trigger : tr_usuario_update 'Creado para auditar todo lo que updatee en usuarios'
-- DROP TRIGGER tr_usuario_update;
DELIMITER $$

CREATE TRIGGER tr_usuario_update
AFTER UPDATE ON usuarios
FOR EACH ROW
BEGIN
	DECLARE descrip_accion_text TEXT;
    SET descrip_accion_text = 'Usuario actualizdo: ';
    
    IF OLD.nombre_completo <> NEW.nombre_completo THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'nombre_completo de ''',OLD.nombre_completo, ''' a ''', NEW.nombre_completo, '''; ');
	END IF;
    
    IF OLD.email <> NEW.email THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'email de ''',OLD.email, ''' a ''', NEW.email, '''; ');
    END IF;
    
    IF OLD.contrasena <> NEW.contrasena THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'contrasena cambiada: ');
    END IF;
    
    IF OLD.suscripcion <> NEW.suscripcion THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'suscripcion de ''',OLD.suscripcion, ''' a ''', NEW.suscripcion, '''; ');
    END IF;
    
    IF OLD.f_insercion_us <> NEW.f_insercion_us THEN
    SET descrip_accion_text = CONCAT(descrip_accion_text, 'f_insercion_us de ''',OLD.f_insercion_us, ''' a ''', NEW.f_insercion_us, '''; ');
    END IF;
    
    INSERT INTO us_auditoria
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(),'UPDATE', descrip_accion_text, CURDATE(), CURTIME());
END$$

DELIMITER ;

-- Creacion del trigger : tr_usuario_delete 'Creado para auditar todo lo que se borre de la tabla usuarios'
-- DROP TRIGGER tr_usuario_delete;
DELIMITER $$

CREATE TRIGGER tr_usuario_delete
AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO us_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'DELETE', CONCAT('Usuario eliminado: ', OLD.nombre_completo), CURDATE(), CURTIME());
END$$

DELIMITER ;


-- ---------------------------------- Triggers dis_auditoria
                        

-- Creacion del trigger : tr_dispositivo_insert 'Creado para auditar todos los inserts de la tabla dispositivos a la tabla 'dispositivos_auditoria' '
-- DROP TRIGGER tr_dispositivo_insert;
DELIMITER $$

CREATE TRIGGER tr_dispositivo_insert
BEFORE INSERT ON dispositivos
FOR EACH ROW
BEGIN
    INSERT INTO disp_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'INSERT', CONCAT('Dato insertado: ', NEW.id_dispositivo), CURDATE(), CURTIME());
END$$

DELIMITER ;


-- Creacion del trigger : tr_dispositivo_update 'Creado para auditar todo lo que updatee en dispositivos'
-- DROP TRIGGER tr_dispositivo_update;
DELIMITER $$

CREATE TRIGGER tr_dispositivo_update
AFTER UPDATE ON dispositivos
FOR EACH ROW
BEGIN
	DECLARE descrip_accion_text TEXT;
    SET descrip_accion_text = 'Dato actualizado: ';
    
    IF OLD.id_usuario_disp <> NEW.id_usuario_disp THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'id_usuario_disp de ''',OLD.id_usuario_disp, ''' a ''', NEW.id_usuario_disp, '''; ');
	END IF;
    
    IF OLD.dispositivo <> NEW.dispositivo THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'dispositivo de ''',OLD.dispositivo, ''' a ''', NEW.dispositivo, '''; ');
	END IF;
    
    IF OLD.sist_operativo <> NEW.sist_operativo THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'sist_operativo de ''',OLD.sist_operativo, ''' a ''', NEW.sist_operativo, '''; ');
    END IF;
    
    IF OLD.f_insercion_disp <> NEW.f_insercion_disp THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'f_insercion_disp de ''',OLD.f_insercion_disp, ''' a ''', NEW.f_insercion_disp, '''; ');
    END IF;
    
    INSERT INTO disp_auditoria
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(),'UPDATE', descrip_accion_text, CURDATE(), CURTIME());
END$$

DELIMITER ;


-- Creacion del trigger : tr_dispositivo_delete 'Creado para plasmar en la tabla 'dispositivos_auditoria todo lo que se borre''
-- DROP TRIGGER tr_dispositivo_delete;
DELIMITER $$

CREATE TRIGGER tr_dispositivo_delete
BEFORE DELETE ON dispositivos
FOR EACH ROW
BEGIN
    INSERT INTO disp_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'DELETE', CONCAT('Dato borrado: ', OLD.id_dispositivo), CURDATE(), CURTIME());
END$$

DELIMITER ;