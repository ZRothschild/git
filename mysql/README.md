# mysql

## mysql语句区分

### `DDL`（Data Definition Language）数据库定义语言 statements are used to define the database structure or schema.

`DDL`是`SQL`语言的四大功能之一。用于定义数据库的三级结构，包括外模式、概念模式、内模式及其相互之间的映像，定义数据的完整性、安全控制等约束`DDL`不需要`commit`.

命令有：`CREATE DATABASE`创建新数据库，`CREATE TABLE`创建新表，`CREATE INDEX`创建索引（搜索键），`ALTER DATABASE`修改数据库，
`ALTER TABLE`变更（改变）数据库表，`DROP TABLE`删除表，`DROP INDEX`删除索引 ，`TRUNCATE`，`COMMENT`，`RENAME` 。

### `DML`（Data Manipulation Language）数据操纵语言statements are used for managing data within schema objects.
      
由`DBMS`提供，用于让用户或程序员使用，实现对数据库中数据的操作。`DML`分成交互型`DML`和嵌入型`DML`两类。依据语言的级别，
`DML`又可分成过程性`DML`和非过程性`DML`两种。需要commit.

命令有：`SELECT`，`INSERT`，`UPDATE`，`DELETE`，`MERGE`，`CALL`，`EXPLAIN PLAN`，`LOCK TABLE`。

### `DCL`（Data Control Language）数据库控制语言  授权，角色控制等

命令有：`GRANT`授权，`REVOKE`取消授权。

### `TCL`（Transaction Control Language）事务控制语言

命令有：`SAVEPOINT`设置保存点，`ROLLBACK`回滚，`SET TRANSACTION`。

### SQL主要分成四部分：
- 数据定义。（SQL DDL）用于定义SQL模式、基本表、视图和索引的创建和撤消操作。
- 数据操纵。（SQL DML）数据操纵分成数据查询和数据更新两类。数据更新又分成插入、删除、和修改三种操作。
- 数据控制。包括对基本表和视图的授权，完整性规则的描述，事务控制等内容。
- 嵌入式SQL的使用规定。涉及到SQL语句嵌入在宿主语言程序中使用的规则。