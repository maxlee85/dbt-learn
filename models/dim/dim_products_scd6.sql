/*
Type 6 = combination of 1, 2 and 3. Keep the number of rows but add in effective dates,
current indicators, the current and past values.
*/
WITH products AS (
    SELECT
        product_id,
        product_name,
        color,
        size,
        created_date AS date_effective,
        COALESCE(LEAD(created_date) OVER (PARTITION BY product_id ORDER BY created_date), '2099-01-01') AS date_expire,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY created_date DESC) AS ranking
    FROM
        {{ ref('products') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY p1.product_id) AS product_key,
    p2.product_id,
    p2.product_name,
    p2.color,
    p1.color AS historical_color,
    p1.size AS historical_size,
    p1.date_effective,
    p1.date_expire,
    CASE WHEN p1.date_expire = '2099-01-01' THEN TRUE ELSE FALSE END is_active
FROM
    products p1
    JOIN products p2
        ON p1.product_id = p2.product_id
        AND p2.ranking = 1

UNION ALL

SELECT
    key,
    null,
    key_value,
    key_value,
    key_value,
    key_value,
    null,
    null,
    null
FROM
    {{ ref('dimensions') }}
