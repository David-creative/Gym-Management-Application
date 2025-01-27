DROP ROLE IF EXISTS admin_role, read_role, write_role;

CREATE ROLE IF NOT EXISTS 'admin_role';
CREATE ROLE IF NOT EXISTS 'read_role';
CREATE ROLE IF NOT EXISTS 'modify_role';


-- Grant all privileges to admin_role with the option to grant to others
GRANT ALL PRIVILEGES ON *.* TO 'admin_role' WITH GRANT OPTION;
GRANT 'admin_role' TO 'admin_user'@'localhost';
SET DEFAULT ROLE 'admin_role' TO 'admin_user'@'localhost';


-- Read-only role
GRANT SELECT, SHOW VIEW ON *.* TO 'read_role';
GRANT 'read_role' TO 'read_only'@'localhost';
SET DEFAULT ROLE 'read_role' TO 'read_only'@'localhost';

-- Grants read_role procedures and functions that only views
GRANT EXECUTE ON PROCEDURE Gym.getAllClients TO 'read_role';
GRANT EXECUTE ON PROCEDURE Gym.getClientsWorkouts TO 'read_role';


-- Modify privileges role
GRANT INSERT, UPDATE, DELETE ON *.* TO 'modify_role';
GRANT 'modify_role' TO 'modify_user'@'localhost';
SET DEFAULT ROLE 'modify_role' TO 'modify_user'@'localhost';
-- Grants modify_role procedures and functions that only modify
GRANT EXECUTE ON FUNCTION Gym.addClient TO 'modify_role';
GRANT EXECUTE ON PROCEDURE Gym.addClientEntry TO 'modify_role';

