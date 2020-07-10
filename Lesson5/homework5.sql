/*
«адача 1.
ѕроверить работу блокировки таблиц на примере 2 любых таблиц (команда LOCK TABLE, см. методичку).

ќткрываем два терминала, в одном блокируем таблицу на чтение / на запись, провер€ем,
чтобы во втором терминале команда не выполн€лась до разблокировки таблицы в первом терминале.
1 терминал
*/

mysql> use vk
Database changed
mysql> lock tables likes write, media write, users write;

/*
2 терминал
*/

mysql> insert into likes values(1001, 1, 1, now());

/*
2 терминал команду не выполн€ет
¬ 1 терминале смотрим статус выполнени€, разблокируем таблицы.
ѕри разблокировке таблиц 2 терминал выполн€ет команду или падает с ошибкой.
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
«адача 2.
ѕодумать, какие операции €вл€ютс€ транзакционными,
и написать несколько примеров с транзакционными запросами.

ƒопустим, мы решили сделать максимально примитивный vkpay, создали таблицу с user_id и balance,
добавили возможность отправл€ть деньги от одного пользовател€ другому.
*/

insert into `vk`.`vkpay` (user_id, balance) values ('1', '100');
insert into `vk`.`vkpay` (user_id, balance) values ('2', '200');

select * from `vk`.`vkpay`;

start transaction;
	update `vk`.`vkpay` set balance = balance - 100 where user_id = 1;
    update `vk`.`vkpay` set balance = balance + 100 where user_id = 2;
commit;


/*
«адача 3.
ѕроанализировать несколько запросов с помощью EXPLAIN.
*/

use vk;

explain select * from users where id < 5;

explain select * from users where lastname like 'KТ%'

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
