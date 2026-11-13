with order_items as (
    select * from {{ ref('stg_order_items') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
)
select
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.price,
    (oi.quantity * oi.price) as line_total,
    o.order_date,
    o.status
from order_items oi
left join orders o on oi.order_id = o.order_id