WITH products AS (
    SELECT
      product_id,
      product_name,
      color,
      size,
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
    size,
    date_start
FROM
    products
WHERE
    ranking = 1
