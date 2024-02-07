select 
orders_id,
date_date,
round(sum(revenue), 2) as revenue,
sum(quantity) as quantity,
round(sum(Purchase_cost),2) as purchase_cost,
round(sum(margin),2) as margin
FROM  {{ ref('int_sales_margin') }}
group by orders_id , date_date