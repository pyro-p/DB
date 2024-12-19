CREATE OR REPLACE PROCEDURE upsert_client(
    client_name varchar(255),
    client_surname varchar(255),
    client_phone numeric(11, 0),
    client_address varchar(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM Client WHERE phone = client_phone
    ) THEN
        UPDATE Client
        SET address = client_address
        WHERE phone = client_phone;
    ELSE
        INSERT INTO Client (name, surname, phone, address)
        VALUES (client_name, client_surname, client_phone, client_address);
    END IF;
END;
$$;

CALL upsert_client('Дмитрий', 'Сидоров', 89001239090, 'ул. Ленина, д. 13');
SELECT * FROM Client WHERE phone = 89001239090;

CALL upsert_client('Дмитрий', 'Сидоров', 89001239090, 'пр. Московский, д. 20');
SELECT * FROM Client WHERE phone = 89001239090;



CREATE OR REPLACE FUNCTION get_client_total_orders(client_phone NUMERIC(11, 0))
RETURNS NUMERIC(15, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total NUMERIC(15, 2);
BEGIN
    SELECT COALESCE(SUM(p.price * o.productcount), 0)
    INTO total
    FROM ClientOrder o
    JOIN Client c ON o.clientid = c.id
    JOIN Product p ON o.productid = p.id
    WHERE c.phone = client_phone;

    RETURN total;
END;
$$;

SELECT get_client_total_orders(89001233333);
