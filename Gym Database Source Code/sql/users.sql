DROP USER IF EXISTS admin_user, read_only, modify_user;
-- Username & Password
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin1234';
CREATE USER 'read_only'@'localhost' IDENTIFIED BY 'read1234';
CREATE USER 'modify_user'@'localhost' IDENTIFIED BY 'modify1234';

