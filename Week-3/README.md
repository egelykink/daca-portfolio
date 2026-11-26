# Nädal 3: SQL JOINs

## Iseseisev töö 

1. Äriküsimus:  
- UrbanStyle.ltd andmed on erinevates tabelites (sales, customers, products, inventory). Anna vajab vastuseid, mis nõuavad mitme tabeli ühendamist: kes ostab, kes ei osta, mis müüb, mis ei müü, ning kuidas müügikanalid ja linnad tulemust mõjutavad.

2. Mida tegin:  
Kasutades Supabase keskkonda ning SQL editori koos UrbanStyle andmebaasida:
- Puhastasin ära originaal andmebaasid ja panin logi "cleaning_log" tabelisse.
- Lahendasin ülesandeid kasutades inner ja left joini
- Kasutasin joini et ühendada kolme erinevat tabelit.

3. Tulemus
- Otsisin ja leidsin TOP 20 klienti koos kõige müüdavamate kategooriatega (Müüdavaim kategooria: jalanõud, meeste riided ja naiste riided, Top 1 klient Tiina Pärn)
- Leidsin, et meil on 599 nö kadunud klienti. 
- Otsisin tooteid mida pole sales tabelis varem müüdud (12 toodet, seotud products andmebaasi duplikaatiega)
- 9130 rida saame siis kui vaatame müüke koos kliendibaasiga (10118 - 9130= 988 külalisostud)


| Kategooria TOP| summa     |
| ------------- | --------- |
| jalanõusid    | 774034.75 |
| meeste_riided | 749798.72 |
| naiste_riided | 686464.24 |
| aksessuaarid  | 393035.82 |
| laste_riided  | 305844.45 |

## Grupitöö

Nädal 3 eesmärk oli õppida ühendama mitut andmebaasi tabelit ning analüüsida müügiandmeid erinevate mõõdikute alusel.  

Analüüs põhines UrbanStyle'i andmebaasi tabelitel:  
sales – müügitehingud  
customers – klientide andmed  
products – toodete andmed  

Kasutatud SQL-tehnikad
- INNER JOIN – tabelite ühendamine ühiste võtmeväljade alusel.
- GROUP BY – andmete grupeerimine müügikanali, linna ja tootekategooria järgi.
- COUNT(*) – ostude arvu leidmine.
- COUNT(DISTINCT ...) – unikaalsete klientide arvu leidmine.
- SUM() ja AVG() – müügitulu ning keskmise ostusumma arvutamine.
- WHERE ja IN – andmete filtreerimine konkreetsete tingimuste või linnade alusel.
- ORDER BY – tulemuste sorteerimine.

Selle nädala jooksul sain praktilise kogemuse mitme tabeli ühendamisel ja müügiandmete analüüsimisel.  
Nädal 3 tulemused on näha failis: week3_roll_dmuugikanalid.sql
