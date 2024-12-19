CREATE OR REPLACE VIEW ClientOrderSummary AS
SELECT
    c.id AS ClientID,
    c.name AS ClientName,
    c.surname AS ClientSurname,
    SUM(co.productcount * p.price) AS TotalOrderValue
FROM ClientOrder co
JOIN Client c ON co.clientid = c.id
JOIN Product p ON co.productid = p.id
WHERE co.date BETWEEN '2023-01-01' AND '2024-01-01' -- Замените на нужный период
GROUP BY c.id, c.name, c.surname
ORDER BY TotalOrderValue DESC;

SELECT * FROM ClientOrderSummary;