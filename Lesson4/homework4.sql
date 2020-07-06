/*
Задача 1.
Создать VIEW на основе SELECT-запроса, который вы писали в ДЗ к уроку 3.
*/

USE vk;

CREATE OR REPLACE VIEW view_get_user_names
AS
	select distinct firstname
	from users
	order by firstname;
SELECT *
FROM view_get_user_names;

/*
Задача 2.
Создать функцию, которая найдет пользователя по имени и фамилии.
*/

USE vk;

DROP FUNCTION IF EXISTS function_find_user;

DELIMITER //
CREATE FUNCTION function_find_user(user_firstname VARCHAR(50), user_lastname VARCHAR(50))
RETURNS BIGINT READS SQL DATA
BEGIN
	DECLARE user_id BIGINT;

	SELECT id
	INTO user_id
	FROM users
	WHERE firstname = user_firstname AND lastname = user_lastname;

RETURN user_id;
END//

DELIMITER ;

/*
Задача 3.
Создать триггер, который при обновлении / при добавлении профиля пользователя будет проверять его дату рождения.
Если дата из будущего, то подменить ее на сегодняшнее число.
*/

USE vk;

DELIMITER //

CREATE TRIGGER check_user_birthday
BEFORE INSERT ON profiles
FOR EACH ROW
BEGIN
	IF NEW.birthday >= CURRENT_DATE() THEN
		SET NEW.birthday = CURRENT_DATE();
	END IF;
END//

DELIMITER ;
