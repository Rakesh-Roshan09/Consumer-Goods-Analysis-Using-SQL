set @out_badge = '0';
call gdb0041.get_market_badge('india', 2022, @out_badge);
select @out_badge;
