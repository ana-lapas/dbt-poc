{{ config(
    materialized='incremental',
    unique_key='order_date'
) }}

with order_details as (
    select * from {{ ref('int_order_items_enriched') }}
    where status = 'completed'
),
daily_metrics as (
    select
        order_date,
        sum(line_total) as gmv,
        count(distinct order_id) as total_orders,
        sum(line_total) / nullif(count(distinct order_id), 0) as aov
    from order_details
    group by 1
)

select * from daily_metrics

{% if is_incremental() %}
  where order_date > (select max(order_date) from {{ this }})
{% endif %}