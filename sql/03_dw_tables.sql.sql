CREATE SCHEMA dw;
GO

CREATE TABLE dw.dim_customer (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(10),
    signup_date DATE
);

CREATE TABLE dw.dim_product (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE dw.dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT
);

CREATE TABLE dw.fact_sales (
    sale_key INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    customer_key INT,
    product_key INT,
    date_key INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_value DECIMAL(12,2)
);