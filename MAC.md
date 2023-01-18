## 1. Створіть у БД структури даних, необхідні для роботи повноважного керування доступом.

### Крок 1: Створення таблиці Employees:

![3_1_1k](https://user-images.githubusercontent.com/120367818/213044169-217dccdb-4f66-4bca-aafa-abf01fd4a25b.png)


### та її заповнення. Додатково створюємо та заповнюємо стовпчик SPOT_CONF = 1 для опису міток конфіденційності записів


![3_3_3](https://user-images.githubusercontent.com/120367818/213048479-327b60b6-c838-4417-87bf-086e7a6a00bd.png)


### Крок 2. Створити загальний довідник рівнів доступу (таблиця Access_Levels за допомогою команди, приклад якої представлений нижче.


![2_4_2cc](https://user-images.githubusercontent.com/120367818/213038813-c8996beb-1803-4b3c-a5bd-b75d6b57d80c.png)

![2_4_2b](https://user-images.githubusercontent.com/120367818/213038266-b3fb9030-7e29-4901-9420-d119e54de9f1.png)

### Крок 3. Створити таблицю Groups_Level_Access, що містить матрицю рівнів доступу для груп користувачів, приклад якої представлений нижче.

![2_4_3](https://user-images.githubusercontent.com/120367818/212746000-3aa02450-ed16-4c3e-89c3-008f33d84cc6.png)

### 2. Визначте для кожного рядка таблиці мітки конфіденційності (для кожного рядка свою мітку).

![3_3_4](https://user-images.githubusercontent.com/120367818/213051556-404694b2-8096-4560-b312-ba7046af0210.png)

![3_3_5](https://user-images.githubusercontent.com/120367818/213051965-a91f4eef-9688-4e7e-aea6-909f0f74cbd1.png)

## 3. Визначте для користувача його рівень доступу

### Крок 1: Перевірка користувачів:

![3_1_1a](https://user-images.githubusercontent.com/120367818/212753780-9e77d1b0-3b05-4651-afde-9981b5f8bdbb.png)

### Крок 2: Визначення для користувача users рівня доступу = 2, тобто заповнення користувача у таблицю Groups_Level_Access з міткою конфіденційності записів = 2. 

![2_4_4a](https://user-images.githubusercontent.com/120367818/212754174-f584af4a-b2f2-4370-a0a3-d0b51bb0e28a.png)

## Крок 3. Перевірка користувача у таблиці Groups_Level_Access.

![3_1_1f](https://user-images.githubusercontent.com/120367818/212758089-45b5bd94-b2c8-4f93-b671-8efd3dd48a49.png)

## 4. Створіть нову схему даних.

![3_1_1d](https://user-images.githubusercontent.com/120367818/212755587-88a7b08c-88ea-4276-be98-43e19d1d3773.png)

Якщо схему даних створено лише для конкретного користувача, тоді для зручності керування рекомендується цю схему називати також, як і користувача.
Підключення користувача до схеми: 

![3_1_1e](https://user-images.githubusercontent.com/120367818/212756174-9014aca9-a9e0-467a-b4c2-147683a800cc.png)

## 5. Створіть віртуальну таблицю, назва якої співпадає з назвою реальної таблиці та яка забезпечує SELECT-правила повноважного керування доступом для користувача.

### Крок 1: Створення та перевірка віртуальної таблиці:


![6_6_7](https://user-images.githubusercontent.com/120367818/213053572-a0e31691-5f61-4ae0-baf9-94dddc9dcc0a.png)

![6_6_6](https://user-images.githubusercontent.com/120367818/213053593-5a93aa71-5300-4a2f-aed9-fdb9eb390f9d.png)


Тому що для користувача users було встановлено рівень доступу = 2, було видано 2 робітника (employees), які мають мітку spot_conf <= 2. 

### Крок 2: Розмежувати права на таблицю employees:

![3_1_1h](https://user-images.githubusercontent.com/120367818/212760964-c0ced864-ef64-4939-9dbd-336ad8c95c7c.png)

## 6. Створіть INSERT/UPDATE/DELETE-правила повноважного керування доступом для користувача.

## INSERT

### Крок 1: Створення правила для введення даних (Insert):

![6_1_1](https://user-images.githubusercontent.com/120367818/213029234-877829a0-8c93-4955-8b76-e16fe59a5a10.png)

### Крок 2: Надання прав користування: 

![6_1_2](https://user-images.githubusercontent.com/120367818/213010811-a2ab388e-cfd0-4e47-818a-821cebc5d429.png)

### Крок 3: Перевірка: 

![6_6_11](https://user-images.githubusercontent.com/120367818/213059903-6f7bb6b3-ae7d-4b8a-8eb9-70eb24eec869.png)

## UPDATE

### Крок 1: Створення правила для модифікації даних (Update):

![6_1_13](https://user-images.githubusercontent.com/120367818/213031567-649dcbde-4b00-4b6b-b13c-7f8047934c52.png)

### Крок 2: Надання прав користування: 

![6_1_5](https://user-images.githubusercontent.com/120367818/213015618-e470ee9f-f8e1-49d3-8707-60b520a2f374.png)

### Крок 3: Перевірка: 

![6_6_9](https://user-images.githubusercontent.com/120367818/213055320-58228bd9-fee2-4d1f-beca-20bb6edb211a.png)

## DELETE

### Крок 1: Створення правила для модифікації даних (Delete):

![6_1_15](https://user-images.githubusercontent.com/120367818/213034420-dec556ec-3c5e-49e7-a676-d40b1c188b76.png)

### Крок 2: Надання прав користування: 

![6_1_10](https://user-images.githubusercontent.com/120367818/213022062-9932f701-b947-4e4e-a6ec-8fa0ab32924f.png)

### Крок 3: Перевірка: 

![6_6_10](https://user-images.githubusercontent.com/120367818/213059385-49ea5b23-8d58-4321-86c1-abde4b7fb01b.png)

## 8. Перевірте роботу механізму повноважного керування, виконавши операції SELECT, INSERT, UPDATE, DELETE

### Повна таблиця public.employees з різними рівнями доступу, користувач postgres: 

![6_6_12](https://user-images.githubusercontent.com/120367818/213062942-2dddc89d-575b-444d-8417-e84de1e30649.png)

### Модифікація view users.employees з різними рівнями доступу, користувач users:

![6_6_13](https://user-images.githubusercontent.com/120367818/213064502-ae50de34-ac9f-4222-9ada-a8d9625cac01.png)
