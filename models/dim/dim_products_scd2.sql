/*
Type 2 = add new rows with effective dates and active indicator
*/
WITH products AS (
    SELECT
      product_id,
      product_name,
      color,
      size,
      created_date AS date_effective,
      COALESCE(LEAD(created_date) OVER (PARTITION BY product_id ORDER BY created_date), '2099-01-01') AS date_expire
    FROM
        {{ ref('products') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id, date_effective) AS product_key,
    product_id,
    product_name,
    color,
    size,
    date_effective,
    date_expire,
    CASE WHEN date_expire = '2099-01-01' THEN TRUE ELSE FALSE END is_active
FROM
    products

UNION ALL

SELECT
    key,
    null,
    key_value,
    key_value,
    key_value,
    null,
    null,
    null
FROM
    {{ ref('dimensions') }}
