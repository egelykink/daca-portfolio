-- ============================================================
-- DACA | NÄDAL 3 | ISESEISEVTÖÖ |
-- Teema: INNER JOIN + mitme tabeli JOIN
-- Andmebaas: UrbanStyle
-- ============================================================

-- ============================================================
-- KALLIMAD OSTETUD TOOTED
-- Millised kliendid ostavad kõige kallimaid tooteid?
-- 
-- ============================================================

select
  cust.first_name ||' '|| cust.last_name as nimi,
  prod.product_id,
  prod.product_name,
  sale.invoice_id,
  sale.quantity,
  prod.retail_price,
  sale.unit_price
from sales as sale
inner join customers as cust on sale.customer_id = cust.customer_id
inner join products as prod on sale.product_id = prod.product_id
order by sale.unit_price desc
limit 20;