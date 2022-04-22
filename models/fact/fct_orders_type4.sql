WITH product_history AS (
    SELECT
        product_id,
        color,
        size,
        created_date AS date_effective,
        COALESCE(LEAD(created_date) OVER (PARTITION BY product_id ORDER BY created_date), '2099-01-01') AS date_expire
    FROM
        {{ ref('products') }}
)
SELECT
    o.order_id,
    o.date_created,
    o.product_id,
    COALESCE(p.product_key, -1) AS product_key,
    COALESCE(pc.product_color_key, -1) AS product_color_key,
    COALESCE(c.customer_key, -1) AS customer_key
FROM
    {{ ref('orders') }} o
    LEFT JOIN product_history ph
        ON o.product_id = ph.product_id
        AND o.date_created >= ph.date_effective
        AND o.date_created < ph.date_expire
    LEFT JOIN {{ ref('dim_products_scd4') }} p
        ON o.product_id = p.product_id
        AND ph.size = p.size
    LEFT JOIN {{ ref('dim_product_colors') }} pc ON ph.color = pc.color
    LEFT JOIN {{ ref('dim_customers') }} c ON o.customer_id = c.customer_id
