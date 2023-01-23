/*2.2.1 Створити функцію get_data по отриманню рядків таблиці на основі SQL-запиту з використанням атрибуту строкового типу, наприклад:
SELECT * FROM ТАБЛИЦЯ WHERE АТРИБУТ = 'ЗНАЧЕННЯ'*/


/*Приклад 1*/

CREATE OR REPLACE FUNCTION get_books_by_name1(b_name VARCHAR)
RETURNS TABLE
(book_id INTEGER, book_name VARCHAR, publisher VARCHAR)
AS $$
DECLARE str VARCHAR;
BEGIN 	str := 'SELECT *
from books 
where book_name = ''' ||b_name|| '''';
RAISE NOTICE 'Query=%',str;
RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;




/*Приклад 2*/
CREATE FUNCTION get_books_by_name2(book_name  text)
RETURNS SETOF books AS $$
SELECT * from books where book_name  = $1;
$$ LANGUAGE SQL;


