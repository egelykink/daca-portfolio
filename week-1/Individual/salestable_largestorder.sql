--Päring: Suurimad müügid
--Autor: Egely Kink
--Kuupäev: 10.11.2026
--Eesmärk: Leida 10 suurimat tellimust.

--required columns
select 
  sale_id, 
  customer_id, 
  total_price

-- source table
from sales

-- conditions
where 
  total_price > 500
order by 
  total_price desc
limit 10
;