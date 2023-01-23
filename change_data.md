## 2.2.3 Створити функцію change_data по зміні значень одного з атрибутів таблиці на основі запиту:
UPDATE ТАБЛИЦЯ SET АТРІБУТ2 = ЗНАЧЕННЯ WHERE АТРИБУТ1 = 'ЗНАЧЕННЯ'
Вхідними параметрами функції є атрибут1 і атрібут2.
Розмістити функцію у файлі change_data.sql у GitHub-репозиторії.

#### Ідея: переписати атрибут publischer, використовуючи функцію MD5(). Функція PostgreSQL MD5() обчислює хеш MD5 рядка та повертає результат у шістнадцятковому вигляді.
##### Спочатку перетворюємо тип атрибуту publisher на text. 

ALTER TABLE books ALTER COLUMN publisher TYPE text; <br>

DROP FUNCTION publisher_change; <br>
CREATE OR REPLACE FUNCTION publisher_change (book_name varchar, publisher text) <br>
returns text <br>
AS $$ <br>
declare <br> 
	strmd5 text; <br> 
	str text; <br>
begin <br>
	strmd5 := md5(publisher); <br>
	str := 'update public.books set publisher = ''' || strmd5 || ''' where book_name= ''' ||book_name|| ''''; <br>
	raise notice 'Query =%', str; <br>
	execute str; <br>
	return strmd5; <br>
end; <br>
$$ LANGUAGE plpgsql; <br>


#### Створення запиту: 

select * from publisher_change ('1'' OR book_name= ''Buratino'' -- ','Penguin');

![8_9](https://user-images.githubusercontent.com/120367818/213993136-a8f67bdf-d720-4b0f-ab61-a77ac8b478eb.png)
