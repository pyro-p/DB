CREATE TABLE Client (
    id serial PRIMARY KEY,
    name varchar(255),
    surname varchar(255),
    phone numeric(11, 0) UNIQUE,
    address varchar(255)
);
CREATE TABLE Product (
    id serial PRIMARY KEY,
    name varchar(255),
    price numeric(15, 2)
);

CREATE TABLE ClientOrder (
    id serial PRIMARY KEY,
    productid int NOT NULL,
    productcount int,
    clientid int NOT NULL,
    completed boolean,
    date timestamp,

    CONSTRAINT ClientOrder_productFK
    FOREIGN KEY (productid)
    REFERENCES Product (id)
    ON DELETE CASCADE,

    CONSTRAINT ClientOrder_clientFK
    FOREIGN KEY (clientid)
    REFERENCES Client (id)
    ON DELETE CASCADE
);

CREATE TABLE Component (
    id serial PRIMARY KEY,
    name varchar(255),
    price numeric(15, 2),
    weight real
);

CREATE TABLE ComponentProduct (
    componentid int NOT NULL,
    productid int NOT NULL,
    weight real,

    CONSTRAINT componentProductPK
    PRIMARY KEY (componentid, productid),

    CONSTRAINT ComponentProduct_componentFK
    FOREIGN KEY (componentid)
    REFERENCES Component (id)
    ON DELETE CASCADE,

    CONSTRAINT ComponentProduct_productFK
    FOREIGN KEY (productid)
    REFERENCES product (id)
    ON DELETE CASCADE
    );

    CREATE TABLE Supplier (
    id serial PRIMARY KEY,
    name varchar(255),
    phone numeric(11, 0) UNIQUE,
    address varchar(255)
);

CREATE TABLE Supply (
    id serial PRIMARY KEY,
    supplierid int NOT NULL,
    componentid int NOT NULL,
    weight real,
    date timestamp,

    CONSTRAINT Supply_supplierFK
    FOREIGN KEY (supplierid)
    REFERENCES Supplier (id)
    ON DELETE CASCADE,

    CONSTRAINT Supply_componentFK
    FOREIGN KEY (componentid)
    REFERENCES Component (id)
    ON DELETE CASCADE
);
