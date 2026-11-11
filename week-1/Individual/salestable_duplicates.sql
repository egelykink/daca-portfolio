--Päring: Täpne duplikaatide arv
--Autor: Egely Kink
--Kuupäev: 10.11.2026
--Eesmärk: Leida mitu duplikaati on müügi tabelis kokku.

select
  count (*) AS kokku,
  count (distinct sale_id) AS unikaalsed_müügid,
  count (*) - count (distinct sale_id) AS duplikaadid
from sales
;