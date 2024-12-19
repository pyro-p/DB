-- a.
SELECT p.name AS product_name, c.name AS component_name, cp.weight
FROM Product p
INNER JOIN ComponentProduct cp ON p.id = cp.productid
INNER JOIN Component c ON cp.componentid = c.id;

-- a.
SELECT p.name AS product_name, c.name AS component_name, cp.weight
FROM Product p
LEFT JOIN ComponentProduct cp ON p.id = cp.productid
LEFT JOIN Component c ON cp.componentid = c.id;

-- a.
SELECT p.name AS product_name, c.name AS component_name, cp.weight
FROM Component c
LEFT JOIN ComponentProduct cp ON c.id = cp.componentid
LEFT JOIN Product p ON cp.productid = p.id;

-- a.
SELECT p.name AS product_name, c.name AS component_name, cp.weight
FROM Product p
LEFT JOIN ComponentProduct cp ON p.id = cp.productid
LEFT JOIN Component c ON cp.componentid = c.id
UNION
SELECT p.name AS product_name, c.name AS component_name, cp.weight
FROM Component c
LEFT JOIN ComponentProduct cp ON c.id = cp.componentid
LEFT JOIN Product p ON cp.productid = p.id;

-- b. Запрос из трех и более таблиц с помощью оператора соединения:
SELECT c.name || ' ' || c.surname AS client_name,
       p.name AS product_name,
       co.productcount,
       p.price * co.productcount AS total_order_price
FROM Client c
INNER JOIN ClientOrder co ON c.id = co.clientid
INNER JOIN Product p ON co.productid = p.id;

-- c. Группировка данных из нескольких таблиц:
SELECT c.name || ' ' || c.surname AS client_name,
       COUNT(*) AS order_count,
       SUM(p.price * co.productcount) AS total_spent
FROM Client c
INNER JOIN ClientOrder co ON c.id = co.clientid
INNER JOIN Product p ON co.productid = p.id
GROUP BY client_name
ORDER BY total_spent DESC;

-- d. Вложенные запросы (два и более уровня вложенности):
SELECT c.name || ' ' || c.surname AS client_name
FROM Client c
WHERE c.id IN (
    SELECT co.clientid
    FROM ClientOrder co
    WHERE co.productid IN (
        SELECT cp.productid
        FROM ComponentProduct cp
        WHERE cp.componentid IN (
            SELECT s.componentid
            FROM Supply s
            WHERE s.supplierid = (SELECT id FROM Supplier WHERE name = 'ООО "Мука и сахар"')
        )
    )
);