# MySQL_Level2
Homeworks - GeekBrains

Урок 1. Проектирование реляционной базы данных

ДЗ к уроку 1.
Спроектировать базу данных «Страны и города мира» с помощью MySQL Workbench. Творческая работа, проектировать на собственное усмотрение. Схема будет такой: страна ➝ область ➝ район (если есть) ➝ город (поселок, деревня). Сдаем в формате .zip: упаковываем готовый скрипт, который сгенерировал Workbench, и схему Workbench.

Урок 2. Урок 2. SQL – команды DDL

ДЗ к уроку 2.
Привести имеющуюся схему в нормальный вид. Таблицы должны выглядеть так, так указано в ДЗ методички.
Самый простой способ — написать команды ALTER TABLE в отдельном файле с расширением .sql и импортировать его через
mysql -u[username] -p[password] [database name] < file.sql

На изменение схемы может уйти очень много времени (до 1 часа), так что не пугайтесь, если команда заставит вас подождать.
Для проверки результатов работы могут быть полезны следующие команды:
SHOW CREATE TABLE<yourtable>;
SHOW COLUMNS FROM<yourtable>;
  
Урок 3. SQL – команды DML

ДЗ к уроку 3.
1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице).
2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1).
4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней).

Урок 4. Объединение запросов, хранимые процедуры, триггеры, функции

ДЗ к уроку 4.
1. Создать VIEW на основе SELECT-запроса, который вы писали в ДЗ к уроку 3.
2. Создать функцию, которая найдет пользователя по имени и фамилии.
3. Создать триггер, который при обновлении / при добавлении профиля пользователя будет проверять его дату рождения. Если дата из будущего, то подменить ее на сегодняшнее число.

Урок 5. Транзакции и оптимизация запросов

ДЗ к уроку 5.
1. Проверить работу блокировки таблиц на примере 2 любых таблиц (команда LOCK TABLE, см. методичку).
2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.
3. Проанализировать несколько запросов с помощью EXPLAIN.

Урок 6. Масштабирование MySQL и NoSQL

ДЗ к уроку 6.
1. Установить MongoDB и повторить запросы из методички.
2. Настроить и запустить master-slave репликацию. (По желанию)

Урок 7. Обзор движков MySQL, управление и обслуживание. Подготовка к собеседованию.

ДЗ к уроку 7.
1. Создать нового пользователя и задать ему права доступа на определенную базу данных (выбрать самостоятельно).
2. Сделать резервную копию базы, удалить базу и пересоздать из бекапа.

------ Дополнительно (запросы к БД vk) ------

3. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

Урок 8. Альтернативные СуБД и функциональные надстройки

ДЗ к уроку 8.
1. Установить сервер PostgreSQL
2. Установить клиент pgAdmin
3. Повторить запросы из методички
4. Написать скрипт, добавляющий в БД vk на PostgreSQL, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
Решения ДЗ присылать, как обычно, в виде *.sql файлов с соответствующими скриптами.
