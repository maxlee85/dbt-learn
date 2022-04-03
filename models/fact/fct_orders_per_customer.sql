WITH customer_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date,
        COUNT(order_id) AS number_of_orders
    FROM
        {{ ref('fct_orders_type2') }}
    GROUP BY
        customer_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    co.first_order_date,
    co.most_recent_order_date,
    COALESCE(co.number_of_orders, 0) AS number_of_orders
FROM
    customer_orders co
    LEFT JOIN {{ ref('dim_customers') }} c ON c.customer_id = co.customer_id
