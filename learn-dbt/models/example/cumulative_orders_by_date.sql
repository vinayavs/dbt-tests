{{ config(materialized='table') }}

select order_date
      ,total_price
      ,sum(total_price) over (order by order_date rows between unbounded preceding and current row) as cumulative_sales
from (select o_orderdate as order_date
            ,sum(o_totalprice) as total_price
      from snowflake_sample_data.tpch_sf1.orders
      group by 1
      )
order by 1