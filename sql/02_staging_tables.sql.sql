CREATE SCHEMA staging;
GO

CREATE TABLE staging.customers (
    customer_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(10),
    signup_date DATE
);

CREATE TABLE staging.products (
    product_id INT,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE staging.orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50)
);

CREATE TABLE staging.order_items (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

BULK INSERT staging.customers
FROM 'G:\Meu Drive\Analista de Dados\Portfólio\vendas_e-commerce\customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT staging.order_items
FROM 'G:\Meu Drive\Analista de Dados\Portfólio\vendas_e-commerce\order_items.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT staging.orders
FROM 'G:\Meu Drive\Analista de Dados\Portfólio\vendas_e-commerce\orders.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT staging.products
FROM 'G:\Meu Drive\Analista de Dados\Portfólio\vendas_e-commerce\products.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

-- VERIFICAÇÃO DE INCLUSÃO DE DADOS 

SELECT TOP 5 * FROM staging.customers;
SELECT TOP 5 * FROM staging.order_items;
SELECT TOP 5 * FROM staging.orders;
SELECT TOP 5 * FROM staging.products;