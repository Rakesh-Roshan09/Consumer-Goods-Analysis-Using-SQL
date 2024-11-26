select fm.date,fm.product_code,dm.product,dm.variant,fm.sold_quantity,gp.gross_price,round(gp.gross_price*fm.sold_quantity,2) as gross_price_total from fact_sales_monthly as fm
join dim_product as dm
on fm.product_code = dm.product_code

join fact_gross_price as gp
on fm.product_code = gp.product_code and
 gp.fiscal_year=get_fiscal_year(fm.date)

where customer_code = 90002002 and 
get_fiscal_year(date)=2021
order by date;