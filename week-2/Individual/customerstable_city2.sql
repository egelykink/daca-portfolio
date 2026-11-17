--Päring: Iga linna klient, email
--Autor: Egely Kink
--Kuupäev: 17.11.2026
--Eesmärk: Puhastada linnade kirjaviis, leida iga linna kliendiarv ning puuduva emaili arv (+protsentuaalselt)

SELECT
  INITCAP(TRIM(city)) AS puhastatud_linn,
  COUNT(*) AS kliente,
  COUNT(*) FILTER (WHERE email IS NULL) AS puuduv_email,
  ROUND(COUNT(*) FILTER (WHERE email IS NULL)::numeric/COUNT(*)*100,2) AS puuduv_email_protsent
FROM customers
GROUP BY puhastatud_linn
ORDER BY puuduv_email_protsent DESC;