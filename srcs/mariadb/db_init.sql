SET @db_name = 'db_inception';
SET @db_user = 'emimenza';
SET @db_pwd = 'emimenza';

CREATE DATABASE IF NOT EXISTS @db_name;
CREATE USER IF NOT EXISTS @db_user@'%' IDENTIFIED BY @db_pwd;
GRANT ALL PRIVILEGES ON @db_name.* TO @db_user@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';
FLUSH PRIVILEGES;
