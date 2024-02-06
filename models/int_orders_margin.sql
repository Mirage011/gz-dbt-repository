select 
orders_id,
date_date,
round(sum(revenue), 2) as total_revenue,
count(quantity) as total_qty,
round(sum(Purchase_cost),2) as total_cost,
sum(margin) as total_margin
FROM  {{ ref('int_sales_margin') }}
group by orders_id , date_date