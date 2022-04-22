### This is my practice repo for dbt.

#### I followed the instructions [here](https://docs.getdbt.com/tutorial/setting-up) using BigQuery.

#### The schemas present are:
- dbt_max: contains fct and dim tables
- dbt_max_seeds: dummy data used to build my models

#### How to use:
If using fct_orders_type2, join product_key to dim_products_scd2.  
If using fct_orders_type4, join product_key to dim_products_scd4 and product_color_key to dim_product_colors.

#### Table definitions
| Table | Use Case |
| - | - |
| dim_customers | Customer dimension table (Type 1) |
| dim_products_scd1 | Product dimension table (Type 1) - Overwrite |
| dim_products_scd2 | Product dimension table (Type 2) - Add new rows |
| dim_products_scd3 | Product dimension table (Type 3) - Add new columns |
| dim_products_scd4 | Product dimension table (Type 4) - Rapidly changing/mini dimension |
| dim_products_scd6 | Product dimension table (Type 6) - Combination of 1,2 and 3 |
| fct_orders_per_customer | DO NOT USE |
| fct_orders_type2 | Orders fact table using type 2 product dimension |

#### dbt Commands
Run single model
- dbt run --select dim_products_scd4 (filename)
- dbt seed --select orders (filename)
