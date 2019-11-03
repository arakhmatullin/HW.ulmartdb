DROP TABLE categories;
CREATE TABLE categories
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT NOT NULL,
    parent_id INTEGER
);


DROP TABLE products;
CREATE TABLE products
(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    category_id INTEGER NOT NULL
);

DROP TABLE store;
CREATE TABLE store
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER,
    price      INTEGER CHECK ( price >= 0 ),
    quantity   INTEGER CHECK ( quantity >= 0 ),
    status     INTEGER --; 0 - Unavailable , 1 - Available

);

DROP TABLE users;
CREATE TABLE users
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName      TEXT NOT NULL, --; for unregistered users LastName FirstName MiddleName
    middleName     TEXT DEFAULT "",
    lastName       TEXT DEFAULT "",
    phone          TEXT NOT NULL CHECK ( phone > "" ),
    deliveryAdders TEXT DEFAULT ""

);

DROP TABLE orders;
CREATE TABLE orders
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id        INTEGER,
    orderDate      INTEGER CHECK ( orderDate > 0 ),
    deliveryAdders TEXT NOT NULL,
    status         INTEGER --; 0  Finished, 1 Paid, 2 Unpaid, 3 Canceled

);

DROP TABLE orderProducts;
CREATE TABLE orderProducts
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    quantity INTEGER CHECK ( quantity > 0 )
);


INSERT INTO categories (name, parent_id)
VALUES ("Автотовары и автозапчасти", 0);
INSERT INTO categories (name, parent_id)
VALUES ("Автомобильный звук и видео", 1);
INSERT INTO categories (name, parent_id)
VALUES ("Автомагнитолы", 2);
INSERT INTO categories (name, parent_id)
VALUES ("Автомагнитолы Pioneer", 3);
INSERT INTO categories (name, parent_id)
VALUES ("Автомагнитолы ACV", 3);

INSERT INTO products (name, category_id)
VALUES ("Автомагнитола Pioneer FH-X730BT", 4);
INSERT INTO products (name, category_id)
VALUES ("Автомагнитола Pioneer DEH-S110UB", 4);
INSERT INTO products (name, category_id)
VALUES ("Автомагнитола ACV AVS-1711GD", 5);

INSERT INTO store (product_id, price, quantity, status)
VALUES (1, 7000, 10, 0);
INSERT INTO store (product_id, price, quantity, status)
VALUES (1, 9499, 10, 1);
INSERT INTO store (product_id, price, quantity, status)
VALUES (2, 4150, 10, 1);
INSERT INTO store (product_id, price, quantity, status)
VALUES (3, 1199, 10, 1);

UPDATE store;
SET quantity =0
WHERE product_id == 1
  and price == 7000;

INSERT INTO users (firstName, middleName, lastName, phone, deliveryAdders)
VALUES ("Unregistered User Batkevich", "", "", "+79170000000", "");

INSERT INTO users (firstName, middleName, lastName, phone, deliveryAdders)
VALUES ("Uregistered User Batkevich", "", "", "+79170000000", "Bobruisk");

INSERT INTO users (firstName, middleName, lastName, phone, deliveryAdders)
VALUES ("Medvedev", "Dmitry", "Anatolevich", "+70000000002", "Moscow,Kremlin");

UPDATE users
SET deliveryAdders=""
WHERE id == 2;

DELETE
FROM users
WHERE id == 1;

INSERT INTO orders (user_id, orderDate, deliveryAdders, status)
VALUES (2, 1572734758, "Bobruisk", 0);
INSERT INTO orders (user_id, orderDate, deliveryAdders, status)
VALUES (3, 1572720758, "Moscow,Kremlin", 0);

INSERT INTO orderProducts (order_id, store_id, quantity)
VALUES (1, 3, 1);
INSERT INTO orderProducts (order_id, store_id, quantity)
VALUES (1, 4, 1);
INSERT INTO orderProducts (order_id, store_id, quantity)
VALUES (2, 2, 5);

