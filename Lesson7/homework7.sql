/* Урок 7.
Задача 1.
Создать нового пользователя и задать ему права доступа
на определенную базу данных (выбрать самостоятельно).
*/

mysql> create user sakila_admin@localhost IDENTIFIED BY '123123';
mysql> grant all privileges on sakila.* TO sakila_admin@localhost;
mysql> flush privileges;
mysql> show grants for sakila_admin@localhost;
+------------------------------------------------------------------+
| Grants for sakila_admin@localhost                                |
+------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `sakila_admin`@`localhost`                 |
| GRANT ALL PRIVILEGES ON `sakila`.* TO `sakila_admin`@`localhost` |
+------------------------------------------------------------------+
mysql> drop user sakila_admin@localhost;
Query OK, 0 rows affected (0.01 sec)


/* Задача 2.
Сделать резервную копию базы, удалить базу и пересоздать из бекапа.
(БД не удаляла, создала две копии, их и развернула).
*/

> mysqldump -u root -p --no-data world > D:\mysql_dumps\world.sql

> mysqldump -u root -p world > D:\mysql_dumps\world2.sql

> mysqladmin -u root -p create world_copy
> mysql -u root -p world_copy < D:\mysql_dumps\world.sql

> mysqladmin -u root -p create world_copy2
> mysql -u root -p world_copy2 < D:\mysql_dumps\world2.sql

> mysqlshow -u root -p
+--------------------+
|     Databases      |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| vk                 |
| world              |
| world_copy         |
| world_copy2        |
+--------------------+

mysqlshow -u root -p world_copy2
Database: world_copy2
+-----------------+
|     Tables      |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+

/* Задача 3.
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

select count(*)
from likes
join media on likes.media_id = media.id
join profiles on profiles.user_id = media.user_id
where  YEAR(CURDATE()) - YEAR(birthday) < 10;


/* Задача 4.
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

select  gender, count(*)
from likes
join profiles on likes.user_id = profiles.user_id 
group by gender;