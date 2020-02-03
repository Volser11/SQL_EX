SELECT model, sum(w*x) FROM(
SELECT w,model, LEN(REPLACE(model,w,'ww')) - LEN(model) as x FROM Product a
 CROSS JOIN (select w from (select 1 as w
union all
select 2 as w
union all
select 3 as w
union all
select 4 as w
union all
select 5 as w
union all
select 6 as w
union all
select 7 as w
union all
select 8 as w
union all
select 9 as w) a) y) a
 GROUP BY model
