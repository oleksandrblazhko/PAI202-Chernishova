/*Функція*/
DROP FUNCTION publisher_change;
CREATE OR REPLACE FUNCTION publisher_change (book_name varchar, publisher text)
returns text
AS $$
declare 
	strmd5 text; 
	str text;
begin
	strmd5 := md5(publisher);
	str := 'update public.books set publisher = ''' || strmd5 || ''' where book_name= ''' ||book_name|| '''';
	raise notice 'Query =%', str;
	execute str;
	return strmd5;
end; 
$$ LANGUAGE plpgsql;


/*Запит*/
select * from publisher_change
('1'' OR book_name= ''Buratino'' -- ','Penguin');
