with cte1 as (
select
c.market,
c.region,
round(sum(gross_price_total)/1000000,2) as gross_sales_mln
from gross_sales as s
join dim_customer as c
on c.customer_code = s.customer_code
where fiscal_year = 2021
group by market,region
order by gross_sales_mln desc
),

cte2 as(
select *,
dense_rank() over(partition by region order by gross_sales_mln desc) as rnk
from cte1)

select *from cte2 where rnk <=2;
