-- View de resumo de vendas
CREATE VIEW analytics.vw_sales_summary AS
SELECT
    d.year,
    d.month,
    p.category,
    SUM(f.total_value) AS total_revenue,
    SUM(f.quantity) AS total_quantity
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_key = p.product_key
JOIN dw.dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.year,
    d.month,
    p.category;
GO

-- View de receita mensal
CREATE VIEW analytics.vw_monthly_revenue AS
SELECT
    d.year,
    d.month,
    SUM(f.total_value) AS revenue
FROM dw.fact_sales f
JOIN dw.dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.year,
    d.month;
GO

-- View de top produtos
CREATE VIEW analytics.vw_top_products AS
SELECT
    p.product_name,
    p.category,
    SUM(f.quantity) AS total_units_sold,
    SUM(f.total_value) AS total_revenue
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_key = p.product_key
GROUP BY
    p.product_name,
    p.category;
GO

-- View de valor do cliente
CREATE VIEW analytics.vw_customer_value AS
SELECT
    c.customer_id,
    c.name,
    c.city,
    c.state,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.total_value) AS total_spent
FROM dw.fact_sales f
JOIN dw.dim_customer c
    ON f.customer_key = c.customer_key
GROUP BY
    c.customer_id,
    c.name,
    c.city,
    c.state;
GO

-- Testando as views
SELECT * FROM analytics.vw_sales_summary;
SELECT * FROM analytics.vw_monthly_revenue;
SELECT TOP 10 * FROM analytics.vw_top_products;
SELECT TOP 10 * FROM analytics.vw_customer_value;