select
    order_date,
    gmv
from {{ ref('fct_daily_gmv') }}
where gmv < 0 or gmv is null