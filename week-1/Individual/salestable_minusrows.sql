--Päring: Read kus summa on väiksem või võrde 0
--Autor: Egely Kink
--Kuupäev: 10.11.2026
--Eesmärk: Leida tellimused mille kogusumma on null või väiksem nullist.

--required columns
select
  sale_id, 
  customer_id, 
  total_price
  
-- source table
from sales

-- conditions
where
  total_price <=0
;