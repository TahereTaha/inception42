CREATE OR REPLACE DATABASE mariadb_db ;

CREATE OR REPLACE USER taha@'%' IDENTIFIED BY '123';
CREATE OR REPLACE USER taha@'localhost' IDENTIFIED BY '123';

GRANT ALL ON mariadb_db.* TO taha@'%';
GRANT ALL ON mariadb_db.* TO taha@'localhost';

FLUSH PRIVILEGES;

