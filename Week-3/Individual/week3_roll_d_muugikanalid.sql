-- ============================================================
-- DACA | NÄDAL 3 | GRUPITÖÖ | ROLL D
-- Müügikanalid + Kliendid
-- Teema: INNER JOIN + mitme tabeli JOIN
-- Andmebaas: UrbanStyle
-- ============================================================

-- ============================================================
-- 1. MÜÜGIKANALITE ÜLEVAADE
-- Eesmärk: selgitada välja, millised müügikanalid on andmetes olemas.
-- Kanaliteks on online ja pood.
-- ============================================================
select
  channel
from sales
group by channel
order by channel;

-- ============================================================
-- 2. MÜÜGIKANALITE PÕHIÜLEVAADE
-- Eesmärk: võrrelda kanaleid klientide arvu, ostude arvu ja kogumüügi põhjal.
--Pood 2278 klienti, 6656 müüki summas 1 902 430.30
--Online 1706 klienti , 3462 müüki summa 1 006 747.68
-- ==========================================================
select
  channel,
  count(distinct customer_id) as kliente,    -- Mitu erinevat klienti kanalit kasutas?
  count(distinct sale_id) as müüke,  -- Mitu ostu tehti?
  sum(total_price) as kogumüük  -- Kui suur oli kanali kogumüük?
from sales
group by channel
order by kogumüük desc;

-- ============================================================
-- 3. MÜÜGIKANALID KLIENTIDE LINNADE JÄRGI
-- Eesmärk: uurida, millistest linnadest kliendid milliseid müügikanaleid kasutavad.
-- INNER JOIN ühendab müügid klientidega.
-- Suurim online müük Tallinn , kliente 667 ja oste 1194 summas 335 719.11
-- suurim poodide müük Tallinn, kliente 910 ja oste 2407 summas 670 533.77
-- ============================================================
select
  cust.city,
  sale.channel,
  count(distinct cust.customer_id) as kliente,  --erinevate klientide arv linnas ja kanalis
  count(distinct sale.sale_id) as oste, --ostude arv linnas ja kanalis
  sum(sale.total_price) as kogumüük
from sales as sale
inner join customers as cust on sale.customer_id = cust.customer_id
group by -- Iga müügikanali ja linna kombinatsioon eraldi
  cust.city,
  sale.channel
order by -- Kuvame tulemused kanalite ja kogumüügi järgi
  sale.channel,
  kogumüük desc;

-- ============================================================
-- 4. KOLME TABELI JOIN: MÜÜGIKANALID + KLIENDID + TOOTED
-- Eesmärk: uurida, millised tootekategooriad müüvad erinevates müügikanalites.
-- Ühendame kolm tabelit kahe INNER JOIN-iga.
-- online: suurim müük jalanõud summas 248 8820.61 keskmine ost 393.70
-- pood: suurim müük meeste_riided summas 447 173.58 keskmine ost 328.32
-- ============================================================
select
  sale.channel as kanal,
  prod.category as kategooria,
  count(distinct cust.customer_id) as kliente, --erinevate klientide arv kategooria ja kanali kaupa
  count(distinct sale.sale_id) as oste, --unikaalsete ostude arv
  sum(sale.total_price) as kogumüük,
  round(avg(sale.total_price),2) as keskmine_ost --keskmine ostu väärtus
from sales as sale
inner join customers as cust on sale.customer_id=cust.customer_id
inner join products as prod on sale.product_id=prod.product_id
group by
  sale.channel,
  prod.category
order by
  sale.channel,
  kogumüük desc;

-- ============================================================
-- 5. MÜÜGIKANALITE EFEKTIIVSUS
-- Eesmärk: leida, milline kanal teenib ühe kliendi kohta kõige rohkem müügitulu.
-- Suurim müük ühe kliendi kohta on füüsilises poes 835 vs online 590.
-- ============================================================

select
  channel,
  count(distinct customer_id) as kliente, --erinevate klientide arv
  sum(total_price) as kogumüük, --kanali kogumüük.
  round(sum(total_price) / count(distinct customer_id),2) as müük_klienditi --müügitulu ühe kliendi kohta
from sales
group by channel
order by müük_klienditi desc;

-- ============================================================
-- 6. EDASIJÕUDNUTE ÜLESANNE
-- KAUPLUSTE MÜÜGIKANALITE VÕRDLUS
-- Eesmärk: võrrelda Tallinna, Tartu ja Pärnu kaupluste, müügikanalite jaotust, kogumüüki ja keskmist ostu.
--Kõige suurem müük on Tallinnas 1 092 083.15, teine Tartu ja kolmas Pärnu, 
-- ============================================================
select
  store_location,
  channel,
  count(distinct sale_id) as oste,
  sum(total_price) as kogumüük,
  round(avg(total_price),2) as keskmine_ost
from sales
where store_location in ('Tallinn','Tartu','Pärnu')
group 
  by store_location,
  channel
order by
  kogumüük desc;