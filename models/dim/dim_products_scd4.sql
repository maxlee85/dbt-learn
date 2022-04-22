/*
Type 4 = rapidly changing dimensions. Create a table containing all possible
combinations of the dimension. For example, if the color of the products changed
every day than color would be added to a "mini dimension" table.

So fct_orders would contain a fk to dim_products and dim_product_colors.
*/
WITH products AS (
    SELECT DISTINCT
      product_id,
      product_name,
      size
    FROM
        {{ ref('products') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id) AS product_key,
    product_id,
    product_name,
    size
FROM
    products

UNION ALL

SELECT
    key,
    null,
    key_value,
    key_value
FROM
    {{ ref('dimensions') }}
