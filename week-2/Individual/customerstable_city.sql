--Päring: Formaatide diagnostika
--Autor: Egely Kink
--Kuupäev: 17.11.2026
--Eesmärk: Leida unikaalsed linnade kirjaviisid koos puhastatud versiooniga


SELECT
  city AS esialgne,
  TRIM(city) AS trimmitud,
  INITCAP(TRIM(city)) AS korrigeeritud,
  CASE
    WHEN city <> INITCAP(TRIM(city)) THEN 'jah'
    ELSE 'ei'
  END AS erineb_esialgsest
FROM customers
GROUP BY city
ORDER BY korrigeeritud;