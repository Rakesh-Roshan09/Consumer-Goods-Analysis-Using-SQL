select 
dm.customer,
sum(net_sales)/1000000 as ns
from net_sales as n
join dim_customer as dm
on n.customer_code  = dm.customer_code
where dm.market="india" and
fiscal_year = 2021
group by dm.customer
order by ns desc
limit 5;