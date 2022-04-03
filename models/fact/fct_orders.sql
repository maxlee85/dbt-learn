/*
These functions are used to generate random dates.

CREATE TEMP FUNCTION rand_range(min_value INT64, max_value INT64) AS (
  CAST(ROUND(min_value + rand() * (max_value - min_value)) AS INT64)
);

CREATE TEMP FUNCTION rand_date(min_date DATE, max_date DATE) AS (
  TIMESTAMP_SECONDS(
    rand_range(UNIX_SECONDS(CAST(min_date AS TIMESTAMP)), UNIX_SECONDS(CAST(max_date AS TIMESTAMP)))
  )
);
*/

WITH orders AS (
    SELECT
        id AS order_id,
        user_id AS customer_id,
        CAST(RAND_DATE('2021-01-01', '2022-03-01') AS DATE) AS date_created
    FROM
        `dbt-tutorial`.jaffle_shop.orders
)
SELECT
    a.order_id,
    a.date_created,
    CASE
        WHEN CAST(TRUNC(RAND()*10,0) AS INT) = 0 THEN 1
        ELSE CAST(TRUNC(RAND()*10,0) AS INT)
    END AS product_id
FROM
    cte a
    CROSS JOIN `dbt-tutorial`.jaffle_shop.orders b
WHERE
    a.order_id BETWEEN b.id-MOD(a.order_id, 3) AND b.id+MOD(a.order_id, 3)
;
