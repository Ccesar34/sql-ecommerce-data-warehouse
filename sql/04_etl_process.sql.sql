INSERT INTO dw.dim_customer (
    customer_id,
    name,
    email,
    city,
    state,
    signup_date
)
SELECT
    customer_id,
    name,
    email,
    city,
    state,
    signup_date
FROM staging.customers;

INSERT INTO dw.dim_product (
    product_id,
    product_name,
    category,
    price
)
SELECT
    product_id,
    product_name,
    category,
    price
FROM staging.products;

INSERT INTO dw.dim_date (
    date_key,
    full_date,
    year,
    month,
    month_name,
    quarter
)
SELECT DISTINCT
    CONVERT(INT, FORMAT(order_date, 'yyyyMMdd')) AS date_key,
    order_date,
    YEAR(order_date),
    MONTH(order_date),
    DATENAME(MONTH, order_date),
    DATEPART(QUARTER, order_date)
FROM staging.orders;

INSERT INTO dw.fact_sales (
    order_id,
    customer_key,
    product_key,
    date_key,
    quantity,
    unit_price,
    total_value
)
SELECT
    o.order_id,
    dc.customer_key,
    dp.product_key,
    CONVERT(INT, FORMAT(o.order_date, 'yyyyMMdd')) AS date_key,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS total_value
FROM staging.orders o
JOIN staging.order_items oi
    ON o.order_id = oi.order_id
JOIN dw.dim_customer dc
    ON o.customer_id = dc.customer_id
JOIN dw.dim_product dp
    ON oi.product_id = dp.product_id;

-- VALIDAÇÃO DA CARGA
SELECT COUNT(*) FROM dw.dim_customer;
SELECT COUNT(*) FROM dw.dim_product;
SELECT COUNT(*) FROM dw.dim_date;
SELECT COUNT(*) FROM dw.fact_sales;

-- TESTE SE O DW ESTA FUNCIONANDO
SELECT
    SUM(total_value) AS total_revenue
FROM dw.fact_sales;

SELECT TOP 5 * FROM DW.fact_sales;