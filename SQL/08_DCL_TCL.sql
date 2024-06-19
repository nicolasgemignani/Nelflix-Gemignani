-- USE para selecionar la base de datos con la que queramos trabajar
USE mysql;

-- Estado de autocommit
SELECT @@autocommit;

-- Descativar el auto commit
SET autocommit = 0;

START TRANSACTION;

-- Creacion de usuarios
CREATE USER 'analistaJR'@'localhost' IDENTIFIED BY '123abc';
CREATE USER 'analistaSSR'@'localhost' IDENTIFIED BY '123abc';
CREATE USER 'analistaSR'@'localhost' IDENTIFIED BY '123abc';

COMMIT;

-- Concediendo Permisos

START TRANSACTION;

-- JR
GRANT SELECT, SHOW VIEW ON usuario_final.* TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.calificaciones TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.clasificaciones TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.cont_idiom_asoc TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.cont_subt_asoc TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.contenidos TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.disp_auditoria TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.dispositivos TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.generos TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.idiomas TO 'analistaJR'@'localhost';
GRANT SELECT, SHOW VIEW ON nelflix.us_auditoria TO 'analistaJR'@'localhost';
FLUSH PRIVILEGES;

SAVEPOINT JR;

-- SSR
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE, CREATE VIEW, CREATE TEMPORARY TABLES,
CREATE ROUTINE, ALTER ROUTINE, EXECUTE, INDEX ON usuario_final.* TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.calificaciones TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.clasificaciones TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.cont_idiom_asoc TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.cont_subt_asoc TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.contenidos TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.disp_auditoria TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.dispositivos TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.generos TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.idiomas TO 'analistaSSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.us_auditoria TO 'analistaSSR'@'localhost';
FLUSH PRIVILEGES;

SAVEPOINT SSR;

-- SR
GRANT ALL ON usuario_final.* TO 'analistaSR'@'localhost';
GRANT CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON nelflix.* TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.calificaciones TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.clasificaciones TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.cont_idiom_asoc TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.cont_subt_asoc TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.contenidos TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.disp_auditoria TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.dispositivos TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.generos TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.idiomas TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.us_auditoria TO 'analistaSR'@'localhost';
GRANT SHOW DATABASES ON *.* TO 'analistaSR'@'localhost';
FLUSH PRIVILEGES;

-- Rollback al savepoint SRR
ROLLBACK TO SSR;

-- Liberar punto de guardado JR
RELEASE SAVEPOINT JR;

-- SR
GRANT ALL ON usuario_final.* TO 'analistaSR'@'localhost';
GRANT CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON nelflix.* TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.calificaciones TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.clasificaciones TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.cont_idiom_asoc TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.cont_subt_asoc TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.contenidos TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.disp_auditoria TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.dispositivos TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.generos TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.idiomas TO 'analistaSR'@'localhost';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE ON nelflix.us_auditoria TO 'analistaSR'@'localhost';
GRANT SHOW DATABASES ON *.* TO 'analistaSR'@'localhost';
FLUSH PRIVILEGES;

-- Liberar punto de guardado SSR
RELEASE SAVEPOINT SRR;

COMMIT;

-- Verificamos
-- SHOW GRANTS FOR 'analistaJR'@'localhost';
-- SHOW GRANTS FOR 'analistaSSR'@'localhost';
-- SHOW GRANTS FOR 'analistaSR'@'localhost';

-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'analistaJR'@'localhost';
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'analistaSSR'@'localhost';
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'analistaSR'@'localhost';