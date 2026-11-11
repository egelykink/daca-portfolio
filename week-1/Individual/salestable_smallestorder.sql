--Päring: Väikseimad müügid
--Autor: Egely Kink
--Kuupäev: 10.11.2026
--Eesmärk: Leida 10 väiksemat tellimust.

--required columns
select
  sale_id, 
  customer_id, 
  total_price

-- source table
from sales

-- conditions
order by
  total_price asc
limit 10
;