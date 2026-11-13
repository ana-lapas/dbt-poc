with order_details as (
    select
        o.order_id,
        o.order_date,
        i.quantity,
        i.price,
        (i.quantity * i.price) as line_total
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_order_items') }} i on o.order_id = i.order_id
    where o.status = 'completed' -- E-commerce logic: exclude returned orders
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