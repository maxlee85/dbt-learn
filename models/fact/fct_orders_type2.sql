SELECT
    o.order_id,
    o.date_created,
    o.product_id,
    COALESCE(p.product_key, -1) AS product_key,
    COALESCE(c.customer_key, -1) AS customer_key
FROM
    {{ ref('orders') }} o
    LEFT JOIN {{ ref('dim_products_scd2') }} p
        ON o.product_id = p.product_id
        AND o.date_created >= p.date_effective
        AND o.date_created < p.date_expire
    LEFT JOIN {{ ref('dim_customers') }} c
        ON o.customer_id = c.customer_id
