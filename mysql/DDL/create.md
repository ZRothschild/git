# create

## create database 建数据库

### 建库语法格式

CREATE {DATABASE | SCHEMA} `[IF NOT EXISTS]` db_name
    `[create_specification]` ...

create_specification:
    `[DEFAULT]` CHARACTER SET `[=]` charset_name
  | `[DEFAULT]` COLLATE `[=]` collation_name
  
### 建库示例

CREATE DATABASE IF NOT EXISTS test DEFAULT CHARSET utf8 COLLATE utf8_general_ci;




