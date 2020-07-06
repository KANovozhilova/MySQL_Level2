/*
������ 1.
������� VIEW �� ������ SELECT-�������, ������� �� ������ � �� � ����� 3.
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
������ 2.
������� �������, ������� ������ ������������ �� ����� � �������.
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
������ 3.
������� �������, ������� ��� ���������� ������� ������������ ����� ��������� ��� ���� ��������.
���� ���� �� ��������, �� ��������� � �� ����������� �����.
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
