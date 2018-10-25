# create

## create database 建数据库

### 建库语法格式

```mysql
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
    [create_specification] ...

create_specification:
    [DEFAULT] CHARACTER SET [=] charset_name
  | [DEFAULT] COLLATE [=] collation_name
```
  
### 建库示例

CREATE DATABASE IF NOT EXISTS test DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

## create user

### 创建用户语法格式

```mysql
CREATE USER [IF NOT EXISTS]
    user [auth_option] [, user [auth_option]] ...
    DEFAULT ROLE role [, role ] ...
    [REQUIRE {NONE | tls_option [[AND] tls_option] ...}]
    [WITH resource_option [resource_option] ...]
    [password_option | lock_option] ...

auth_option: {
    IDENTIFIED BY 'auth_string'
  | IDENTIFIED WITH auth_plugin
  | IDENTIFIED WITH auth_plugin BY 'auth_string'
  | IDENTIFIED WITH auth_plugin AS 'hash_string'
}

tls_option: {
   SSL
 | X509
 | CIPHER 'cipher'
 | ISSUER 'issuer'
 | SUBJECT 'subject'
}

resource_option: {
    MAX_QUERIES_PER_HOUR count
  | MAX_UPDATES_PER_HOUR count
  | MAX_CONNECTIONS_PER_HOUR count
  | MAX_USER_CONNECTIONS count
}

password_option: {
    PASSWORD EXPIRE [DEFAULT | NEVER | INTERVAL N DAY]
  | PASSWORD HISTORY {DEFAULT | N}
  | PASSWORD REUSE INTERVAL {DEFAULT | N DAY}
  | PASSWORD REQUIRE CURRENT [DEFAULT | OPTIONAL]
}

lock_option: {
    ACCOUNT LOCK
  | ACCOUNT UNLOCK
}
```

### 创建用户示例

#### 示例一

```mysql
CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'password';
```

#### 示例二

> 创建使用默认身份验证插件和给定密码的帐户。标记密码已过期，以便用户必须在与服务的第一次连接时选择一个新密码

```mysql
CREATE USER 'jeffrey'@'localhost'
  IDENTIFIED BY 'new_password' PASSWORD EXPIRE;
```

#### 示例三

> 创建一个使用sha256_password身份验证插件和给定密码的帐户。要求每180天选择一个新密码

```mysql
CREATE USER 'jeffrey'@'localhost'
  IDENTIFIED WITH sha256_password BY 'new_password'
  PASSWORD EXPIRE INTERVAL 180 DAY;
```

#### 示例四

> 此语句创建两个帐户，指定一些每帐户属性和一些全局属性
> 每个auth_option值（在这种情况下为IDENTIFIED WITH ... BY）仅适用于紧接在其之前命名的帐户，
> 因此每个帐户使用紧随其后的身份验证插件和密码。其余属性全局应用于语句中指定的所有帐户，因此对于两个帐户：

- 必须使用有效的X.509证书进行连接
- 每小时最多允许60个查询
- 密码更改无法重用五个最新密码中的任何一个
- 该帐户最初是锁定的，因此它实际上是占位符，在管理员解锁之前无法使用

```mysql

CREATE USER
  'jeffrey'@'localhost' IDENTIFIED WITH mysql_native_password
                                   BY 'new_password1',
  'jeanne'@'localhost' IDENTIFIED WITH sha256_password
                                  BY 'new_password2'
  REQUIRE X509 WITH MAX_QUERIES_PER_HOUR 60
  PASSWORD HISTORY 5
  ACCOUNT LOCK;
```

#### 示例五

> 此语句创建两个帐户，指定一些每帐户属性和一些全局属性
> 每个auth_option值（在这种情况下为IDENTIFIED WITH ... BY）仅适用于紧接在其之前命名的帐户，
> 因此每个帐户使用紧随其后的身份验证插件和密码。其余属性全局应用于语句中指定的所有帐户，因此对于两个帐户：

- 必须使用有效的X.509证书进行连接
- 每小时最多允许60个查询
- 密码更改无法重用五个最新密码中的任何一个
- 该帐户最初是锁定的，因此它实际上是占位符，在管理员解锁之前无法使用

```mysql

CREATE USER
  'jeffrey'@'localhost' IDENTIFIED WITH mysql_native_password
                                   BY 'new_password1',
  'jeanne'@'localhost' IDENTIFIED WITH sha256_password
                                  BY 'new_password2'
  REQUIRE X509 WITH MAX_QUERIES_PER_HOUR 60
  PASSWORD HISTORY 5
  ACCOUNT LOCK;
```

### 重命名用户

#### 重命名用户格式

```mysql
RENAME USER old_user TO new_user
    [, old_user TO new_user] ...
```

#### 重命名用户示例

> 帐户名的主机名部分（如果省略）默认为'％'

```mysql
RENAME USER 'jeffrey'@'localhost' TO 'jeff'@'127.0.0.1';
```

### 更改用户

#### 更改用户格式

```mysql
ALTER USER [IF EXISTS]
    user [auth_option] [, user [auth_option]] ...
    [REQUIRE {NONE | tls_option [[AND] tls_option] ...}]
    [WITH resource_option [resource_option] ...]
    [password_option | lock_option] ...

ALTER USER [IF EXISTS]
    USER() IDENTIFIED BY 'auth_string' [REPLACE 'current_auth_string']

ALTER USER [IF EXISTS]
    user DEFAULT ROLE
    {NONE | ALL | role [, role ] ...}


auth_option: {
    IDENTIFIED BY 'auth_string' [REPLACE 'current_auth_string']
  | IDENTIFIED WITH auth_plugin
  | IDENTIFIED WITH auth_plugin BY 'auth_string' [REPLACE 'current_auth_string']
  | IDENTIFIED WITH auth_plugin AS 'hash_string'
}

tls_option: {
   SSL
 | X509
 | CIPHER 'cipher'
 | ISSUER 'issuer'
 | SUBJECT 'subject'
}

resource_option: {
    MAX_QUERIES_PER_HOUR count
  | MAX_UPDATES_PER_HOUR count
  | MAX_CONNECTIONS_PER_HOUR count
  | MAX_USER_CONNECTIONS count
}

password_option: {
    PASSWORD EXPIRE [DEFAULT | NEVER | INTERVAL N DAY]
  | PASSWORD HISTORY {DEFAULT | N}
  | PASSWORD REUSE INTERVAL {DEFAULT | N DAY}
  | PASSWORD REQUIRE CURRENT [DEFAULT | OPTIONAL]
}

lock_option: {
    ACCOUNT LOCK
  | ACCOUNT UNLOCK
}
```

#### 更改用户示例一

> 此语法可以更改您自己的密码，而无需按字面指定您的帐户

```mysql
ALTER USER USER() IDENTIFIED BY 'auth_string';
```

#### 更改用户示例二

> 更改帐户的密码并使其过期。因此，用户必须使用指定的密码进行连接，并在下次连接时选择一个新密码

```mysql
ALTER USER 'jeffrey'@'localhost' IDENTIFIED BY 'new_password' PASSWORD EXPIRE;
```

#### 更改用户示例三

> 修改帐户以使用sha256_password身份验证插件和给定密码。要求每180天选择一个新密码

```mysql
ALTER USER 'jeffrey'@'localhost'
  IDENTIFIED WITH sha256_password BY 'new_password'
  PASSWORD EXPIRE INTERVAL 180 DAY;
```

#### 更改用户示例四

> 锁定或解锁帐户

```mysql
ALTER USER 'jeffrey'@'localhost' ACCOUNT LOCK;
ALTER USER 'jeffrey'@'localhost' ACCOUNT UNLOCK;
```

#### 更改用户示例五

> 要求帐户使用SSL进行连接，并建立每小时20个连接的限制

```mysql
ALTER USER 'jeffrey'@'localhost'
  REQUIRE SSL WITH MAX_CONNECTIONS_PER_HOUR 20;
```

#### 更改用户示例六

> 此语句更改了两个帐户，指定了一些每帐户属性和一些全局属性

```mysql
ALTER USER
  'jeffrey'@'localhost' IDENTIFIED BY 'new_password',
  'jeanne'@'localhost'
  REQUIRE SSL WITH MAX_USER_CONNECTIONS 2
  PASSWORD HISTORY 5;
```

#### 更改用户示例七

> 将密码指定为明文;使用默认插件

```mysql
ALTER USER 'jeffrey'@'localhost' IDENTIFIED BY 'password';
```