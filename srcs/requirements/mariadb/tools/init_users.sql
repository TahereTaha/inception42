CREATE OR REPLACE USER 'mariadb_user'@'%' IDENTIFIED BY 'mariadb_password';

GRANT ALL ON *.* TO 'mariadb_user'@'%';

FLUSH PRIVILEGES;

