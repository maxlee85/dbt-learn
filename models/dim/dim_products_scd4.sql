/*
Type 4 = rapidly changing dimensions. Create a table containing all possible
combinations of the dimension. For example, if the color of the products changed
every day than color would be added to a "mini dimension" table.

So fct_orders would contain a fk to dim_products and dim_product_colors.
*/
SELECT 1 AS product_color_key, 'grey' AS color UNION ALL
SELECT 1 AS product_color_key, 'black' AS color UNION ALL
SELECT 1 AS product_color_key, 'green' AS color UNION ALL
SELECT 1 AS product_color_key, 'blue' AS color UNION ALL
SELECT 1 AS product_color_key, 'yellow' AS color UNION ALL
SELECT 1 AS product_color_key, 'white' AS color UNION ALL
SELECT 1 AS product_color_key, 'red' AS color UNION ALL
SELECT 1 AS product_color_key, 'purple' AS color UNION ALL
SELECT 1 AS product_color_key, 'brown' AS color
