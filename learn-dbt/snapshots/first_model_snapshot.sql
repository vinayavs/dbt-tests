{% snapshot first_model_snapshot %}

{{
    config(
      target_database='test_db',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ ref('my_first_dbt_model' ) }}

{% endsnapshot %}