CREATE OR REPLACE DATABASE 'mariadb_db' ;

CREATE OR REPLACE USER 'mariadb_user'@'%' IDENTIFIED BY 'mariadb_password';

GRANT ALL ON 'mariadb_db'.* TO 'mariadb_user'@'%';

FLUSH PRIVILEGES;

