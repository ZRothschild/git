<?php
/**
 * Created by IntelliJ IDEA.
 * User: 87390
 * Date: 2019/1/6
 * Time: 4:29
 */
//try {
//    $dbh = new PDO('mysql:host=database;dbname=mysql', 'root', 'nm123');
//    foreach($dbh->query('SELECT user from user') as $row) {
//        var_dump($row);
//        echo "<br>";
//    }
//    $dbh = null;
//} catch (PDOException $e) {
//    print "Error!: " . $e->getMessage() . "<br/>";
//    die();
//}
#去php服务中执行 docker-php-ext-install pdo_mysql
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'nm123';
echo phpinfo();