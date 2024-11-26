with cte2 as
(select c.customer,c.region,
round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales as s
join dim_customer c
on c.customer_code=s.customer_code
where s.fiscal_year=2021
group by c.customer,c.region
order by net_sales_mln desc)


select *,
net_sales_mln*100/sum(net_sales_mln) over(partition by region) as pct_region_share 
from cte2
group by customer,region;