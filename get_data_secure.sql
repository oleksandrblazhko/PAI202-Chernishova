CREATE OR REPLACE FUNCTION get_book_secure1(b_name VARCHAR)
RETURNS TABLE
(book_id INTEGER, book_name VARCHAR, publisher VARCHAR)
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT book_id, book_name, publisher from books where book_name = $1';
	RETURN QUERY EXECUTE str USING book_name;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION get_books_by_name2(book_name  text)
RETURNS SETOF books AS $$
SELECT * from books where book_name  = $1;
$$ LANGUAGE SQL;



