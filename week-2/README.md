# Nädal 2: SQL Cleaning 

## Iseseisev töö 

1. Äriküsimus:  
- Kuidas muuta kaoslikud andmed usaldusväärseks ilma midagi olulist kaotamata?

2. Mida tegin:  
Kasutades Supabase keskkonda ning SQL editori koos UrbanStyle andmebaasida:
- Tuvastasin ja eemaldasin duplikaate (GROUP BY, HAVING, ROW_NUMBER)
- Leidsin ja käsitlesin NULL väärtusi (IS NULL, COALESCE, NULLIF)
- Puhastasin ja ühtlustasin andmeväljasid (CAST, TRIM, UPPER/LOWER)

3. Tulemus
- Duplikaate leidsin:  
sales - sales_id - 5116  
customers - email - 130  
products - name - 12  

- NULL väärtused:  
sales - customer_id - 1487  
customers - email - 380  
products - eco_certified - 18  

- Ühtlustasin customer tabeli linnade välja, kokku oli 54 linna nimekirjas millest 12 unikaalsed linnad ning ülejäänud 46 variatsioon neist 12st.   


## Grupitöö
Nädal 2 grupitöös olin rollis A. A rolli ülesandeks oli olla müügiandmete puhastaja ja analüüsida andmebaasis sales tabelit.
Leidsin:  

- 4013 korduvat arvet mis annavad kokku 5116 duplikaati.
- 1487 puuduvat kliendi ID / "külalisostud"
- 305 negatiivse summaga arvet
- 50 arvet müügikuupäevast väljas pool (2026-02-28)

Ühtlasi leidsin, et sales tabelis lisaks miinuses olevatele summadele on koguse ja hinna korrutise vahesid ka teistel ridadel mis ei ole seotud duplikaatide või muude vigaste ridadega. Kontrolliks kasutasin päringut: 

select  
  customer_id,  
  product_id,  
  invoice_id,  
  quantity,  
  unit_price, -- *müügitabelis olev ühikuhind*  
  total_price as originaal_summa,  --*total_price veerg sales tabelis*  
  quantity * unit_price as kontroll_summa, --*ühiku hind korrutatud kogusega*  
  (quantity * unit_price) - total_price as kontrolli_vahe - *korrutise ja total_price veeru vahe.*  
from sales  
WHERE (quantity * unit_price) <> total_price;  
  --AND sale_date >= DATE '2025-02-28';  

