--Päring: NULL väärtused
--Autor: Egely Kink
--Kuupäev: 10.11.2026
--Eesmärk: Kirjutada päring mis leiab mitel real puudub customer_id

select
  count (*) AS ridade_arv,
  count(customer_id) AS klientidega,
  count (*) - count (customer_id) AS puudub_klient
  from sales
  ;