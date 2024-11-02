with orders as (
    select *
    from {{ ref('stg_jaffle_shop__orders') }}
),
payment as (
    select *
    from {{ ref('stg_stripe__payments') }}
)

select order_id, customer_id, order_date, amount
from orders left join payment using (order_id)
where orders.status = 'success'