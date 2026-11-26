-- ============================================================
-- DACA | NÄDAL 3 | ISESEISEVTÖÖ |
-- Teema: INNER JOIN + mitme tabeli JOIN
-- Andmebaas: UrbanStyle
-- ============================================================

-- ============================================================
-- LINNADE ja KATEGOORATE ÜLEVAADE
-- Eesmärk: selgitada välja, millised kategooriad on populaarsed erilinnades
-- 
-- ============================================================

select
  cust.city,
  prod.category,
  count(sale_id) as müüke_kokku,
  sum(sale.quantity) as müüdud_kogus,
  sum(sale.total_price) as kogusumma
from sales as sale
inner join customers as cust on sale.customer_id = cust.customer_id
inner join products as prod on sale.product_id = prod.product_id
group by
  prod.category,
  cust.city
order by 
  cust.city asc,
  kogusumma desc;