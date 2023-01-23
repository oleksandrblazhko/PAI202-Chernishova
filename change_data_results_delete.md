## 2.2.4 Створити виклики функції з SQL-ін'єкціями з порушень цілісності даних , приклади яких представлені в теоретичних відомостях. 
## Створити знімки екранів з результатами виконання викликів функції та розмітити їх у файлі change_data_results.md у GitHub-репозиторії.

#### DELETE: Порушення цілісності через SQL-ін'єкції


Створення та заповнення таблиці, яку буде вдалено: 

CREATE TABLE students <br>
  (id INTEGER PRIMARY KEY, <br>
   name TEXT, <br>
   grade INTEGER, <br>
   average_score FLOAT, <br>
   exam INTEGER); <br>


INSERT INTO students (id, name, grade, average_score, exam) <br>
  VALUES (1, 'Morris', 10, 3.7, 4); <br>


SELECT * FROM students; <br>

![8_10](https://user-images.githubusercontent.com/120367818/213996853-8d57f3ca-1a98-441f-9116-b9507ad046f4.png)


#### Проведення SQL-ін'єкції порушення цілісності (DELETE) 

SELECT * FROM students where name like '%Ь'; drop table students;-- %';

SELECT * FROM students;

![8_11](https://user-images.githubusercontent.com/120367818/213997317-3cc9833b-191c-4e25-adfa-d93dd8a76b6e.png)


Результат: таблицю було вдалено, як і прогнозувалось. 

