/*
Type 3 = add additional columns to show most recent data and 1 entry prior
*/
WITH products AS (
    SELECT
      product_id,
      product_name,
      color,
      LEAD(color) OVER (PARTITION BY product_id ORDER BY created_date DESC) AS previous_color,
      size,
      LEAD(size) OVER (PARTITION BY product_id ORDER BY created_date DESC) AS previous_size,
      created_date AS date_start,
      ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY created_date DESC) AS ranking
    FROM
        {{ ref('products') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id) AS product_key,
    product_id,
    product_name,
    color,
    previous_color,
    size,
    previous_size
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
    key_value,
    key_value,
    key_value
FROM
    {{ ref('dimensions') }}
