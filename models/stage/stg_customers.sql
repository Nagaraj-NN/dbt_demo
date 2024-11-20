-- customers stage table
{{ config(
    post_hook=["insert into dbt_demo.{{target.schema}}.MODEL_AUDIT_TAB values ('{{this}}' ,'post-model-run', current_timestamp() )",
                "create or replace table customer_table as (select * from {{this}})",
                "delete from customer_table where customer_id = 100",
                "alter table customer_table add column country varchar(10)",
                "update customer_table set country = 'USA'"
    ]  
) }}


WITH customers AS(
SELECT 
    id as customer_id,
    first_name,
    last_name
FROM {{ source('jaffle_shop', 'customers') }}
)

SELECT *
FROM customers