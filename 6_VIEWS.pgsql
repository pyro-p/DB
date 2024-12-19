-- a. сложный синтаксис;
CREATE OR REPLACE VIEW ClientOrderSummary AS
SELECT
    c.id AS client_id,
    c.name AS client_name,
    c.surname AS client_surname,
    SUM(co.productcount * p.price) AS total_order_value
FROM ClientOrder co
JOIN Client c ON co.clientid = c.id
JOIN Product p ON co.productid = p.id
WHERE co.date BETWEEN '2024-10-27' AND '2024-10-30'
GROUP BY c.id, c.name, c.surname
ORDER BY total_order_value DESC;

SELECT * FROM ClientOrderSummary;

CREATE OR REPLACE VIEW ComponentUsage AS
SELECT 
    c.name AS component_name,
    ROUND(CAST(SUM(cp.weight * o.productcount) AS NUMERIC), 2) AS total_weight,
    ROUND(CAST(SUM(cp.weight * o.productcount * c.price / c.weight) AS NUMERIC), 2) AS total_cost
FROM ClientOrder o
JOIN ComponentProduct cp ON o.productid = cp.productid
JOIN Component c ON cp.componentid = c.id
WHERE o.date >= NOW() - INTERVAL '3 months'
GROUP BY c.name
ORDER BY total_cost DESC;

SELECT * FROM ComponentUsage;

-- b. скрытие столбцов и строк.
CREATE OR REPLACE VIEW DetailedSupplyInfo AS
SELECT
    s.name AS supplier_name,
    c.name AS component_name,
    c.price AS component_price,
    sup.weight AS supply_weight
FROM Supply sup
JOIN Supplier s ON sup.supplierid = s.id
JOIN Component c ON sup.componentid = c.id
WHERE sup.date > '2023-05-01' AND sup.weight > 10
ORDER BY supplier_name, component_name;

SELECT * FROM DetailedSupplyInfo;

CREATE VIEW SuccessfulOrders AS
SELECT 
    o.id AS order_id,
    o.date AS order_date,
    p.name AS product_name,
    o.productcount AS quantity,
    (p.price * o.productcount) AS total_amount
FROM ClientOrder o
JOIN Product p ON o.productid = p.id
WHERE o.completed = TRUE -- Только выполненные заказы
ORDER BY o.date DESC;

SELECT * FROM SuccessfulOrders;