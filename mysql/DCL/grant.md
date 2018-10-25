# GRANT

### Global Privileges

1. GRANT ALL ON `*.*` TO 'someuser'@'somehost';
2. GRANT SELECT, INSERT ON `*.*` TO 'someuser'@'somehost';

### Table Privileges

1. GRANT ALL ON mydb.mytbl TO 'someuser'@'somehost';
2. GRANT SELECT, INSERT ON mydb.mytbl TO 'someuser'@'somehost';

### Column Privileges

1. GRANT SELECT (col1), INSERT (col1, col2) ON mydb.mytbl TO 'someuser'@'somehost';

### Stored Routine Privileges

1. GRANT CREATE ROUTINE ON mydb.* TO 'someuser'@'somehost';
2. GRANT EXECUTE ON PROCEDURE mydb.myproc TO 'someuser'@'somehost';

### Proxy User Privileges

1. GRANT PROXY ON 'localuser'@'localhost' TO 'externaluser'@'somehost';

### Granting Roles

1. GRANT 'role1', 'role2' TO 'user1'@'localhost', 'user2'@'localhost';

```mysql
CREATE USER 'u1', 'u2';
CREATE ROLE 'r1', 'r2';

GRANT 'u1' TO 'u1';   -- simple loop: u1 => u1
GRANT 'r1' TO 'r1';   -- simple loop: r1 => r1

GRANT 'r2' TO 'u2';
GRANT 'u2' TO 'r2';   -- mixed user/role loop: u2 => r2 => u2
```

### Other Account Characteristics

1. GRANT USAGE ON `*.*` TO 'someUser'@'someHost' WITH GRANT OPTION;
`WITH GRANT OPTION`的作用是someUser可以把他拥有的权限赋予其他用户