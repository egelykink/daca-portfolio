# Nädal 2: SQL Cleaning 

## Iseseisev töö 

1. Äriküsimus:  
- Kuidas muuta kaoslikud andmed usaldusväärseks ilma midagi olulist kaotamata?

2. Mida tegin:  
Kasutades Supabase keskonda ning SQL editori koos UrbanStyle andmebaasida:
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
