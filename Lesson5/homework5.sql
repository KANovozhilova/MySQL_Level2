/*
������ 1.
��������� ������ ���������� ������ �� ������� 2 ����� ������ (������� LOCK TABLE, ��. ���������).

��������� ��� ���������, � ����� ��������� ������� �� ������ / �� ������, ���������,
����� �� ������ ��������� ������� �� ����������� �� ������������� ������� � ������ ���������.
1 ��������
*/

mysql> use vk
Database changed
mysql> lock tables likes write, media write, users write;

/*
2 ��������
*/

mysql> insert into likes values(1001, 1, 1, now());

/*
2 �������� ������� �� ���������
� 1 ��������� ������� ������ ����������, ������������ �������.
��� ������������� ������ 2 �������� ��������� ������� ��� ������ � �������.
*/

mysql> show processlist;
+----+-----------------+-----------------+------+---------+------+---------------------------------+---------------------------------------------+
| Id | User            | Host            | db   | Command | Time | State                           | Info                                        |
+----+-----------------+-----------------+------+---------+------+---------------------------------+---------------------------------------------+
| 14 | root            | localhost:58645 | vk   | Query   |    0 | starting                        | show processlist                            |
| 15 | root            | localhost:58651 | vk   | Query   |   82 | Waiting for table metadata lock | insert into likes values(1001, 1, 1, now()) |
+----+-----------------+-----------------+------+---------+------+---------------------------------+---------------------------------------------+
mysql> unlock tables;

/*
������ 2.
��������, ����� �������� �������� ���������������,
� �������� ��������� �������� � ��������������� ���������.

��������, �� ������ ������� ����������� ����������� vkpay, ������� ������� � user_id � balance,
�������� ����������� ���������� ������ �� ������ ������������ �������.
*/

insert into `vk`.`vkpay` (user_id, balance) values ('1', '100');
insert into `vk`.`vkpay` (user_id, balance) values ('2', '200');

select * from `vk`.`vkpay`;

start transaction;
	update `vk`.`vkpay` set balance = balance - 100 where user_id = 1;
    update `vk`.`vkpay` set balance = balance + 100 where user_id = 2;
commit;


/*
������ 3.
���������������� ��������� �������� � ������� EXPLAIN.
*/

use vk;

explain select * from users where id < 5;

explain select * from users where lastname like 'K�%'

explain
select
	media.filename,
	media_types.name,
	count(*) as total_likes,
	concat(firstname, ' ', lastname) as owner,
	hometown
from media
	join media_types on media.media_type_id = media_types.id
	join likes on media.id = likes.media_id
	join users on users.id = media.users_id
	join profiles on users.id = profiles.user_id
where users.id = 5
group by media.id;
