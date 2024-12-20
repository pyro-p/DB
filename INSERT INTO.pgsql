-- Clients
INSERT INTO Client (name, surname, phone, address) VALUES
('Ирина', 'Смирнова', 89001231111, 'ул. Солнечная, д. 15'),
('Алексей', 'Кузнецов', 89001232222, 'пр. Победы, д. 22'),
('Елена', 'Васильева', 89001233333, 'ул. Мира, д. 30'),
('Дмитрий', 'Попов', 89001234444, 'ул. Лесная, д. 4'),
('Ольга', 'Соколова', 89001235555, 'пер. Цветочный, д. 1'),
('Анна', 'Петрова', 89001236666, 'ул. Садовая, д. 12'),
('Михаил', 'Иванов', 89001237777, 'пр. Центральный, д. 8'),
('София', 'Сидорова', 89001238888, 'ул. Парковая, д. 18'),
('Иван', 'Морозов', 89001239999, 'пер. Тихий, д. 3'),
('Мария', 'Новикова', 89001230000, 'ул. Южная, д. 7');

INSERT INTO Product (name, price) VALUES
('Торт "Медовик"', 1200.00),
('Торт "Прага"', 1500.00),
('Пирожное "Эклер"', 150.00),
('Печенье "Овсяное"', 300.00),
('Кекс "Шоколадный"', 250.00),
('Маффин "С черникой"', 180.00),
('Рулет "Бисквитный"', 450.00),
('Пирожное "Картошка"', 100.00),
('Круассан с шоколадом', 120.00),
('Зефир ванильный', 80.00),
('Мармелад фруктовый', 90.00),
('Печенье "Юбилейное"', 280.00);

INSERT INTO ClientOrder (productid, productcount, clientid, completed, date) VALUES
(1, 1, 1, TRUE, '2024-10-26 14:00:00'),
(2, 1, 2, TRUE, '2024-10-26 15:30:00'),
(3, 6, 3, FALSE, '2024-10-27 11:00:00'),
(4, 1, 1, TRUE, '2024-10-27 16:00:00'),
(5, 2, 4, TRUE, '2024-10-28 09:00:00'),
(6, 3, 5, FALSE, '2024-10-28 10:30:00'),
(7, 1, 2, TRUE, '2024-10-28 14:00:00'),
(8, 5, 6, TRUE, '2024-10-29 12:00:00'),
(9, 3, 7, FALSE, '2024-10-29 14:30:00'),
(10, 10, 8, TRUE, '2024-10-29 16:00:00'),
(11, 8, 9, TRUE, '2024-10-30 10:00:00'),
(12, 2, 10, FALSE, '2024-10-30 11:30:00'),
(1, 2, 1, FALSE, '2024-10-30 13:00:00'),
(3, 4, 2, TRUE, '2024-10-30 15:00:00'),
(5, 1, 3, FALSE, '2024-10-30 17:00:00'),
(7, 3, 4, TRUE, '2024-10-31 09:00:00'),
(2, 1, 5, TRUE, '2024-10-31 12:00:00'),
(4, 6, 6, FALSE, '2024-10-31 14:00:00'),
(6, 2, 7, TRUE, '2024-10-31 16:00:00');

INSERT INTO Component (name, price, weight) VALUES
('Мука', 40.00, 1.0),
('Сахар', 60.00, 0.5),
('Яйца', 80.00, 0.3),
('Масло сливочное', 150.00, 0.25),
('Мед', 200.00, 0.2),
('Какао', 120.00, 0.15),
('Черника', 100.00, 0.1),
('Шоколад', 250.00, 0.2),
('Сливки', 180.00, 0.3),
('Ванилин', 50.00, 0.05),
('Разрыхлитель', 30.00, 0.05),
('Сода', 20.00, 0.05),
('Молоко', 70.00, 0.5),
('Сгущенное молоко', 100.00, 0.3);

INSERT INTO ComponentProduct (componentid, productid, weight) VALUES
(1, 1, 0.5),
(2, 1, 0.3),
(3, 1, 0.2),
(4, 1, 0.25),
(5, 1, 0.2),
(1, 2, 0.4),
(2, 2, 0.4),
(3, 2, 0.25),
(4, 2, 0.3),
(6, 2, 0.15),
(1, 3, 0.1),
(2, 3, 0.1),
(3, 3, 0.05),
(4, 3, 0.05),
(9, 3, 0.1),
(1, 4, 0.6),
(2, 4, 0.2),
(4, 4, 0.1),
(1, 5, 0.3),
(2, 5, 0.25),
(3, 5, 0.15),
(4, 5, 0.2),
(6, 5, 0.1),
(1, 6, 0.2),
(2, 6, 0.15),
(3, 6, 0.1),
(4, 6, 0.15),
(7, 6, 0.1),
(1, 7, 0.3),
(2, 7, 0.2),
(3, 7, 0.15),
(4, 7, 0.1),
(9, 7, 0.25),
(1, 8, 0.1),
(3, 8, 0.05),
(4, 8, 0.05),
(6, 8, 0.05),
(8, 9, 0.1),
(9, 9, 0.1),
(13, 10, 0.05),
(14, 10, 0.05),
(1, 11, 0.2),
(2, 11, 0.1),
(13, 11, 0.05),
(1, 12, 0.4),
(2, 12, 0.1),
(4, 12, 0.05),
(8, 12, 0.05),
(10, 1, 0.05),
(10, 2, 0.05),
(14, 7, 0.2);

INSERT INTO Supplier (name, phone, address) VALUES
('ООО "Мука и сахар"', 79004445577, 'ул. Хлебная, д. 10'),
('ИП "Молочные продукты"', 79007778800, 'ул. Молочная, д. 15'),
('Фермерское хозяйство "Яйцо"', 79001112255, 'ул. Фермерская, д. 1'),
('Компания "Сладкие ингредиенты"', 79003336600, 'ул. Кондитерская, д. 20'),
('Ягодная ферма "Черника"', 79005556677, 'ул. Ягодная, д. 5'),
('ООО "Всё для выпечки"', 79008889900, 'ул. Пекарей, д. 8'),
('Торговый дом "Ингредиент"', 79002224400, 'пр. Торговый, д. 25'),
('Бакалея "У дома"', 79001234567, 'ул. Соседская, д. 3');

INSERT INTO Supply (supplierid, componentid, weight, date) VALUES
(1, 1, 50, '2024-10-24 09:00:00'),
(1, 2, 30, '2024-10-24 10:00:00'),
(2, 4, 20, '2024-10-24 11:00:00'),
(3, 3, 15, '2024-10-24 12:00:00'),
(4, 5, 10, '2024-10-24 13:00:00'),
(4, 6, 8, '2024-10-24 14:00:00'),
(5, 7, 5, '2024-10-24 15:00:00'),
(4, 8, 12, '2024-10-25 09:00:00'),
(2, 9, 15, '2024-10-25 10:00:00'),
(6, 10, 5, '2024-10-25 12:00:00'),
(6, 11, 4, '2024-10-25 13:00:00'),
(6, 12, 6, '2024-10-25 14:00:00'),
(7, 13, 10, '2024-10-25 15:00:00'),
(7, 14, 8, '2024-10-26 09:00:00'),
(8, 1, 60, '2024-10-26 10:00:00'),
(8, 2, 40, '2024-10-26 11:00:00'),
(8, 4, 30, '2024-10-26 12:00:00');