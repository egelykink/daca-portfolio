--Päring: Oluliste väljade NULL väärtused
--Autor: Egely Kink
--Kuupäev: 17.11.2026
--Eesmärk: Leida sales, customers & products tabelite oluliste väljade NULL väärtused

SELECT 'sales-customer_id' AS tabel,
  COUNT(*) AS null_väärtus
FROM sales
WHERE customer_id IS NULL
UNION ALL
SELECT 'customers-email',
  COUNT(*)
FROM customers
WHERE email IS NULL
UNION ALL
SELECT 'products-eco_certified',
  COUNT(*)
FROM products
WHERE eco_certified IS NULL;