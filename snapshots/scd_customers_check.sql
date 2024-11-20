{% snapshot scd_check_customers %}

{{
    config(
      target_schema='dbt_jkenney_snapshot',
      strategy='check',
      unique_key='id',
      check_cols=['first_name']
    )
}}

SELECT * FROM {{ source('jaffle_shop', 'customers') }}

{% endsnapshot %}