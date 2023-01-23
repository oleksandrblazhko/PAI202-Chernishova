## 2.2.7 Перевірити роботу створених безпечних функцій. Створити знімки екранів з результатами виконання викликів функції та розмітити їх у файлі secure_results.md у GitHub-репозиторії

Найефективнішим способом захисту від SQL-ін'єкції є використання параметричного створення динамічних запитів. Безпека коду забезпечується за рахунок таких особливостей:
− рядок із пропозицією оновити таблиці включає посилання на параметри без явних значень параметрів; 
− посилання на параметри - це зв'язані змінні, імена яких носять умовний номер змінної після символу $;
− перед виконанням запиту в команді execute відбувається «зв'язування» змінних із запиту зі значеннями, зазначеними після опції using.

## SELECT

### Приклад 1: 

CREATE OR REPLACE FUNCTION get_book_secure1(b_name VARCHAR) <br>
RETURNS TABLE <br>
(book_id INTEGER, book_name VARCHAR, publisher VARCHAR) <br>
AS $$ <br>
DECLARE <br>
	str VARCHAR; <br>
BEGIN <br>
	str := 'SELECT book_id, book_name, publisher from books where book_name = $1'; <br>
	RETURN QUERY EXECUTE str USING book_name; <br>
END; <br>
$$ LANGUAGE plpgsql; <br>



![8_15](https://user-images.githubusercontent.com/120367818/214000175-9f29d029-b15d-49e3-9ac9-d086a250d970.png)


SELECT * FROM get_book_secure1('1'' OR 1=1 -- ');

Нова функція не вплинула на логіку.

![8_15a](https://user-images.githubusercontent.com/120367818/214000440-a625a19a-1311-4803-ad0e-7ddada987abf.png)

### Приклад 2: Сворену у першому завданні функцію теж можна вважати безпечною

![8_4](https://user-images.githubusercontent.com/120367818/214001602-b72991c0-e505-4afd-899b-23c4f7d00f4e.png)

Результати використування: Нова функція не вплинула на логіку.

![8_16a](https://user-images.githubusercontent.com/120367818/214003647-0ce917b7-5974-4123-a925-0263df840be0.png)


## UPDATE 

ALTER TABLE books ALTER COLUMN publisher TYPE text; <br>
CREATE OR REPLACE FUNCTION publisher_change_secure (book_name varchar, publisher text) <br>
returns text <br>
AS $$ <br>
declare <br>
	strmd5 text; <br>
	str text; <br>
begin <br>
	strmd5 := md5(publisher); <br>
	str := 'update public.books set publisher = $1 where book_name= $2'; <br>
	raise notice 'Query =%', str; <br>
	execute str; <br>
	return strmd5; <br>
end; <br> 
$$ LANGUAGE plpgsql; <br>

![8_17](https://user-images.githubusercontent.com/120367818/214005781-0e89b792-dbd6-40f0-9740-61ffae03bc11.png)

Результати: зміна не відбулася

![8_18](https://user-images.githubusercontent.com/120367818/214006613-c06d07a1-7607-4101-b0e5-ad913e62b068.png)
