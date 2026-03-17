-- Receita total da empresa
SELECT
    SUM(total_value) AS total_revenue
FROM dw.fact_sales;

-- Receita por categoria de produto
SELECT
    p.category,
    SUM(f.total_value) AS total_revenue
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_key = p.product_key
GROUP BY
    p.category
ORDER BY
    total_revenue DESC;

-- Vendas por mês
SELECT
    d.year,
    d.month,
    SUM(f.total_value) AS monthly_revenue
FROM dw.fact_sales f
JOIN dw.dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.year,
    d.month
ORDER BY
    d.year,
    d.month;

-- Top 10 produtos mais vendidos
SELECT TOP 10
    p.product_name,
    SUM(f.total_value) AS total_revenue
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_key = p.product_key
GROUP BY
    p.product_name
ORDER BY
    total_revenue DESC;

-- Ticket médio
SELECT
    AVG(order_total) AS average_ticket
FROM
(
    SELECT
        order_id,
        SUM(total_value) AS order_total
    FROM dw.fact_sales
    GROUP BY order_id
) t;

-- Top 10 clientes que mais compram
SELECT TOP 10
    c.name,
    SUM(f.total_value) AS total_spent
FROM dw.fact_sales f
JOIN dw.dim_customer c
    ON f.customer_key = c.customer_key
GROUP BY
    c.name
ORDER BY
    total_spent DESC;

-- Ranking de produtos por categoria (Window Function)
SELECT
    p.category,
    p.product_name,
    SUM(f.total_value) AS revenue,
    RANK() OVER(
        PARTITION BY p.category
        ORDER BY SUM(f.total_value) DESC
    ) AS ranking_in_category
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_key = p.product_key
GROUP BY
    p.category,
    p.product_name;

-- Receita acumulada ao longo do tempo
SELECT
    d.full_date,
    SUM(f.total_value) AS daily_revenue,
    SUM(SUM(f.total_value)) OVER (
        ORDER BY d.full_date
    ) AS cumulative_revenue
FROM dw.fact_sales f
JOIN dw.dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.full_date
ORDER BY
    d.full_date;