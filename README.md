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

#### Common data modeling techniques
- Retail (transactional fact table)
<img width="655" alt="image" src="https://user-images.githubusercontent.com/77996369/198893291-7a495d06-50d7-4209-b2cd-e02093c19977.png">
- Survey schema (responses fact)
<img width="657" alt="image" src="https://user-images.githubusercontent.com/12355768/219972788-3e23945f-da16-4e8a-b683-8748f9d25a30.png">
- Mini dimensions (type4 scd, create bands for dimensions and group like dimensions together ie, age + income)
<img width="642" alt="image" src="https://user-images.githubusercontent.com/12355768/219973229-a43c90b5-bcda-4c83-accb-5cd0aceda683.png">
-


- Bridge tables
  - Traverse a hierarchy using a bridge table 
  <img width="660" alt="image" src="https://user-images.githubusercontent.com/12355768/219972444-8604ea1e-cb73-4482-932e-8096af01ab68.png">
  
  - Group multi value attributes into a single row

