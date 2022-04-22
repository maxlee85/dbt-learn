/*
Type 1 = overwrite, use just the latest data
*/
WITH products AS (
    SELECT
        product_id,
        product_name,
        color,
        size,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY created_date DESC) AS ranking
    FROM
        {{ ref('products') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id) AS product_key,
    product_id,
    product_name,
    color,
    size
FROM
    products
WHERE
    ranking = 1

UNION ALL

SELECT
    key,
    null,
    key_value,
    key_value,
    key_value
FROM
    {{ ref('dimensions') }}
