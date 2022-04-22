SELECT
    ROW_NUMBER() OVER (ORDER BY id) AS customer_key,
    id AS customer_id,
    first_name,
    last_name
FROM
    `dbt-tutorial`.jaffle_shop.customers

UNION ALL

SELECT
    key,
    null,
    key_value,
    key_value
FROM
    {{ ref('dimensions') }}
