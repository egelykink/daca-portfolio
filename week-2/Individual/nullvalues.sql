--Päring: NULL väärtused
--Autor: Egely Kink
--Kuupäev: 18.11.2026
--Eesmärk: Kontrollida tähtsaid veerge NULL väärtuste suhtes.


-- 1. KLIENTIDE TABEL (customers)
SELECT 
    'customers' AS tabeli_nimi,
    '1.customer_id,2.first_name,3.email,4.city' AS tähtsad_veerud,
    COUNT(*) filter(where customer_id is NULL) AS veerg_1,
    COUNT(*) filter(where first_name is NULL) AS veerg_2,
    COUNT(*) filter(where email is NULL) AS veerg_3,
    COUNT(*) filter(where city is NULL) AS veerg_4
FROM customers

UNION ALL

-- 2. MÜÜGITABEL (sales)
SELECT 
    'sales',
    '1.invoice_id,2.sales_date,3.customer_id,4.total_price',
    COUNT(*) filter(where invoice_id is NULL),
    COUNT(*) filter(where sale_date is NULL),
    COUNT(*) filter(where customer_id is NULL),
    COUNT(*) filter(where total_price is NULL)
FROM sales

UNION ALL

-- 3. TOODETE TABEL (products)
SELECT 
    'products',
    '1.product_name,2.category,3.cost_price,4.retail_price',
    COUNT(*) filter(where product_name is NULL),
    COUNT(*) filter(where category is NULL),
    COUNT(*) filter(where cost_price is NULL),
    COUNT(*) filter(where retail_price is NULL)
FROM products;