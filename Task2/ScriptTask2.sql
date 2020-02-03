;with cte(num) as
(select 0
 union all
 select num+1
 from cte
 where num < 31),
 datess(ym) as (select distinct  dateadd(day,1-day(date),date) from Battles)
 select
cast(YEAR(ym) as varchar)+'-'+case when Month(ym)<10 then '0'+cast(Month(ym) as varchar) else cast(Month(ym) as varchar) end as m,
--c.dates
count(case when DATEPART(dw,c.dates) = 2 then 1 else null end) as Mon,
count(case when DATEPART(dw,c.dates) = 3 then 1 else null end) as Tue,
count(case when DATEPART(dw,c.dates) = 4 then 1 else null end) as Wed,
count(case when DATEPART(dw,c.dates) = 5 then 1 else null end) as Thu,
count(case when DATEPART(dw,c.dates) = 6 then 1 else null end) as Fri,
count(case when DATEPART(dw,c.dates) = 7 then 1 else null end) as Sat,
count(case when DATEPART(dw,c.dates) = 1 then 1 else null end) as Sun
from datess
outer apply(
select 
	dateadd(dd, num, dateadd(day,1-day(ym),ym)) as dates
from cte
where num <= datepart(dd,EOMONTH(ym))-1	
) c
group by cast(YEAR(ym) as varchar)+'-'+case when Month(ym)<10 then '0'+cast(Month(ym) as varchar) else cast(Month(ym) as varchar) end
