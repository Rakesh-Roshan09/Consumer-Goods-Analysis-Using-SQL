select variant,
round(sum(net_sales),2) as n
from net_sales
where fiscal_year = 2021
group by variant 
order by n desc
limit 5;