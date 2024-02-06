select *,
        round(cast(quantity as FLOAT64)*cast(purchase_price as FLOAT64),2) as Purchase_cost,
        round(cast(revenue as FLOAT64)-(cast(quantity as FLOAT64)*cast(purchase_price as FLOAT64)) , 2) as margin
FROM  {{ ref('stg_raw__sales')}}
LEFT JOIN  {{ ref('stg_raw__product')}}
using(products_id)