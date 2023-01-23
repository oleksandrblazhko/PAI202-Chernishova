ALTER TABLE books ALTER COLUMN publisher TYPE text;
CREATE OR REPLACE FUNCTION publisher_change_secure (book_name varchar, publisher text)
returns text
AS $$
declare 
	strmd5 text; 
	str text;
begin
	strmd5 := md5(publisher);
	str := 'update public.books set publisher = $1 where book_name= $2';
	raise notice 'Query =%', str;
	execute str;
	return strmd5;
end; 
$$ LANGUAGE plpgsql;
