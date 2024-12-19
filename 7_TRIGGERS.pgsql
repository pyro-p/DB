CREATE OR REPLACE FUNCTION check_phone_format()
RETURNS TRIGGER AS $$
BEGIN
    IF LENGTH(NEW.phone::TEXT) != 11 THEN
        RAISE EXCEPTION 'Телефонный номер должен состоять из 11 чисел';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_client
BEFORE INSERT ON Client
FOR EACH ROW
EXECUTE FUNCTION check_phone_format();

INSERT INTO Client (name, surname, phone, address) 
VALUES('Наталья', 'Смирнова', 231111, 'ул. Зелёная, д. 25');



CREATE OR REPLACE FUNCTION log_price_change()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price <> OLD.price THEN
        INSERT INTO PriceLog (product_id, old_price, new_price, changed_at)
        VALUES (OLD.id, OLD.price, NEW.price, NOW());
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_update_product
AFTER UPDATE ON Product
FOR EACH ROW
EXECUTE FUNCTION log_price_change();

UPDATE Product
SET price = 1100
WHERE id = 1;

SELECT * FROM PriceLog;