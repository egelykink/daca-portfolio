--Küsimus:Tabelites olevad andmed kokku, mis puudu, millel puudub väärtus.
--Mida see Toomasele ütleb: Tabel näitab milliseid andmeid on vaja puhastada ja millele tähelepanu pöörata. 
select
  'sales' as tabel,
  'read kokku' as selgitus,
  COUNT(*) kogus
from sales
union all
select
  'sales',
  'duplikaat',
  COUNT(*) - count(distinct sale_id)
from sales
union all
select
  'sales',
  'unikaalsed read',
  COUNT(distinct sale_id)
from sales
union all
select
  'sales',
  'vigased kuupäevad',
  COUNT(*)
from sales
where sale_date > DATE '2025-02-28'
UNION ALL
select
  'sales',
  'külalisostud',
  COUNT(*)
from sales
where customer_id is NULL
union all
select
  'customers',
  'read kokku',
  count (*)
from customers
union all
select
  'customers',
  'duplikaat email',
  count (*)-count(distinct email) 
from customers
where email is not NULL
union all
select
  'customers',
  'NULL email',
  count (*)
from customers
where email is NULL
UNION ALL
select
  'customers',
  'linnad kokku',
  count(distinct city)
from customers
UNION ALL
select
  'customers',
  'linnu pärast ühtlustamist',
  count(distinct INITCAP(TRIM(city)))
from customers
UNION ALL
select
  'products',
  'read kokku',
  count(*)
from products
UNION ALL
select
  'products',
  'duplikaat tootenimed',
  count(*)-count(distinct product_name)
from products;