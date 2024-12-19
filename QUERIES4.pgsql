-- a. заказы, которые еще не выполнены
SELECT *
FROM ClientOrder
WHERE completed = false;

-- a. заказы, сумма которых больше определенного числа
SELECT co.*
FROM ClientOrder co
JOIN Product p ON co.productid = p.id
WHERE p.price * CAST(co.productcount AS numeric) > 1000;



-- b. заказы, отсортированные по дате по возрастанию
SELECT * 
FROM ClientOrder
ORDER BY date ASC;

-- b. заказы, отсортированные по количеству продукта по убыванию
SELECT *
FROM ClientOrder
ORDER BY CAST(productcount AS numeric) DESC;



-- c. общее количество каждого продукта, заказанного клиентами
SELECT p.name, SUM(CAST(co.productcount AS numeric)) AS total_count
FROM ClientOrder co
JOIN Product p ON co.productid = p.id
GROUP BY p.name;

-- c. количество заказов для каждого клиента
SELECT clientid, COUNT(*) AS order_count
FROM ClientOrder
GROUP BY clientid
ORDER BY order_count DESC;

-- c. сумма всех заказов для каждого продукта
SELECT p.name, SUM(co.productcount * p.price) AS total_amount
FROM ClientOrder co
JOIN Product p ON co.productid = p.id
GROUP BY p.name
ORDER BY total_amount DESC;



-- d. клиенты, чьи имена начинаются с 'А'
SELECT *
FROM Client
WHERE name LIKE 'A%';

-- d. названия продуктов, содержащих подстроку 'Шоколад'
SELECT name
FROM Product
WHERE name LIKE '%Шоколад%';

-- d. преобравание имён клиентов к нижнему регистру
SELECT lower(name) AS client_name
FROM Client;

-- d. извлекаем подстроку из названия компонента 
SELECT SUBSTRING(name, 1, 5) AS component_substring
FROM Component;

-- d. заменяем пробелы в названиях продуктов на подчеркивания
SELECT REPLACE(name, ' ', '_') AS product_name_replaced
FROM Product;

-- d. объединяем имя и фамилию клиента в одно поле
SELECT CONCAT(name, ' ', surname) AS full_client_name
FROM Client;

-- d. определяем длину названия компонента
SELECT name, LENGTH(name) AS name_length
FROM Component;



-- e. заказы, сделанные в текущем месяце
SELECT *
FROM ClientOrder
WHERE date_trunc('month', date) = date_trunc('month', CURRENT_DATE);

-- e. поставки, сделанные за последние 7 дней от текущей даты
SELECT *
FROM Supply
WHERE date >= NOW() - INTERVAL '7 days';

-- e. заказы с указанием дня недели, когда они были сделаны
SELECT *, extract(dow from date) as day_of_week
FROM ClientOrder;

-- e. количество заказов, выполненных в каждом месяце
SELECT date_trunc('month', date) AS month, COUNT(*) AS order_count
FROM ClientOrder
WHERE completed = TRUE
GROUP BY month
ORDER BY month;

-- e. форматируем дату заказа
SELECT date, TO_CHAR(date, 'DD Mon YYYY HH24:MI:SS') AS formatted_date
FROM ClientOrder;

-- e. количество дней с момента заказа до текущей даты
SELECT date, CURRENT_TIMESTAMP - date AS days_since_order
FROM ClientOrder
WHERE completed = TRUE;