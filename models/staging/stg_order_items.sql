select
    order_id,
    product_id,
    cast(quantity as int) as quantity,
    cast(price as numeric) as price
from {{ ref('raw_order_items') }}