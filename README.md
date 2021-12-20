# VisionAirport: handleiding

Volg de stappen in de juiste volgorde voor het opzetten van het project. Alle bestanden zijn te vinden in deze repository.
Laten we beginnen!

## Het opzetten van de staging area

Omdat het manueel importeren van de geleverde bronbestanden (flat files) een aanzienlijk tijd in beslag zal nemen wordt er bij dit project een back-up bestand meegeleverd genaamd "Staging_area.bapcpac". Dit bestand gebruiken we om een lege database aan te maken, de bijhorende scaffolding te doen en de database op te vullen met ruwe data.

**Stappen die je moet nemen:**

1. Rechtermuisklik op het folder "Databases" in de object explorer.
2. Klik op "Import Data-Tier Application..." om de wizard te starten.
      
![image](https://user-images.githubusercontent.com/57638471/146682177-3ad72f0d-66c3-429c-aa1a-3bab344f7284.png)
   
3. Klik op "Next" 
4. Browse voor het bestand "Staging_area.bapcpac" in het folder "StagingArea" (zie repo).
      
![image](https://user-images.githubusercontent.com/57638471/146683177-a48c1de1-32e4-4c1c-b367-ab97a825d51d.png)

5. Klik op "Next"
6. Geef nu de database naam "VisionAirport_staging"

![image](https://user-images.githubusercontent.com/57638471/146683257-0f0c7f75-7cb0-4b7b-80e3-4c11b63edff4.png)
 
   > Let op: De database naam moet overeen komen met als hierboven om later fouten te vermijden bij het uitvoeren van de scripts. 

 7. Klik op "Next"
 8. Klik op "Finish"

Om zeker te zijn of de stappen correct zijn gebeurd kijk je liefts na dat de database tabellen heeft en/of er data zit in de tabellen die beginnen met "RAW".
Na dit gecontroleerd is kunnen we beginnen met het cleanen van de data. Dat doen we door gebruik te maken van het script "CleaningScript.sql" (zie verder).

## Data cleanen

In het folder "StagingArea" is er een cleaning script voorzien die we gaan gebruiken om alle bruikbare data te exporteren naar onze data warehouse later meer hierover.

**Stappen die je moet nemen:**

1. Open het bestand "CleaningScript.sql" in de folder "StagingArea" (zie repo)
2. Na het bestand is geopend in het management studio klik dan op knop "Execute"

![image](https://user-images.githubusercontent.com/57638471/146683865-1d2e6744-155a-4df7-a3df-0d6e8610bc64.png)

  > Let op: Het kan even duren voor het script klaar is.

Als alles gelukt is zou je het volgende onderaan je management studio moeten zien.

![image](https://user-images.githubusercontent.com/57638471/146683949-93cf1a6a-c64c-4362-a95e-1984defb7e44.png)

## Het opzetten van de data warehouse

Nu we onze data gecleaned hebben in de staging area is het de bedoeling dat de bruikbare data overgezet wordt naar onze data warehouse database. Dit doen we aan de hand van SSIS-packages. Vooraleer we dat doen moeten we eerst een lege database aanmaken en daarin onze dimensies & fact tabellen aanmaken. Hiervoor voeren de volgende stappen uit.

1. Maak een nieuwe database aan en noem het "VisionAirport_DWH".

![image](https://user-images.githubusercontent.com/57638471/146685185-ca9cbf6e-1200-4420-bade-98ee7a7fb78a.png)

2. Open het bestand "DWH.sql" in de folder DWH_queries (zie repo)
3. klik op "Execute" na het bestand is ingeladen in management studio
4. Herhaal de voorgaande stappen voor het bestand "createFactVertrek.sql" en "createFactAankomst.sql"

Als alles goed is verlopen zou je dimensies & fact tabellen moeten kunnen zien in de data warehouse database.

## SSIS-packages

Nu we de nodige scaffolding hebben gedaan voor onze data warehouse gaan we deze opvullen met alle bruikbare data (cleaned data). Dit doen we aan de hand van SSIS packages. Pak hiervoor de TestVisionAirport.zip uit en open de solution in Visual Studio.

Na dat de solution is geopend is het belangrijk dat we de verbinding met onze lokaal SQL server leggen.
**Stappen die je moet nemen:**

1. Verwijder de twee connectie die als bij default meekomen met het project

![image](https://user-images.githubusercontent.com/57638471/146685526-4e30dc3a-fb7b-4aa1-beb1-1c58c5cae9c2.png)

Voeg nu je eigen connecties toe met je lokaal SQL server.

2. Rechtermuisklik op "Connection Managers"
3. Klik op vervolgens op "New Connection Manager"
4. Selecteer "OLEDB" als type connectie en klik op "Next"

![image](https://user-images.githubusercontent.com/57638471/146685854-76f33c8f-82b4-4b6c-b3e3-c7472235bde2.png)

5. Klik vervolgens op "New"
7. Geef je server naam in en druk op "OK"
8. Selecteer de staging database "VisionAirport_staging"

![image](https://user-images.githubusercontent.com/57638471/146685966-8235542c-a451-4172-b171-07e7ebab675d.png)

Herhaal de voorgaande stappen om nu een verbinding te leggen met de data warehouse genaamd "VisionAirport_DWH". Na je dit gedaan hebt kunnen we aan de slag met de SSIS-packages. Zorg ervoor dat voor elke package de verbinding is gelegd met je database door gebruik te maken van de juiste connection manager.

Als je dat gedaan hebt, klik op de main package en voer het uit. Dit package zal alle andere packages in de juiste volgorde uitvoeren. Als dit succesvol verlopen is dubbelcheck door te zien of er nu data is in de data warehouse door dit in de management studio te controleren.


## Power-BI dashboard
Via de tool power BI hebben we de gegevens die in onze DWH zijn opgeslagen visueel willen tonen op een dashboard. Op het dashboard worden een aantal resultaten getoond die naar onze mening van nut kunnen zijn om de vele data makkelijker te kunnen interpreteren. 
Het is belangrijk dat voordat je het dashboard opent, je power BI desktop installeert op je computer. Je kan het dashboard vinden en downloaden op de link die beschikbaar is via de PowerBIProject_Link.txt. 

Als je graag aanpassingen wilt maken of gegevens wilt importeren kan dit ook nog altijd in Power BI via: 
“Gegevens ophalen ”  “SQL server” : <br />
![image](https://user-images.githubusercontent.com/61239203/146779999-4a9207e7-1a32-4733-8cbe-f3ce2fa1b049.png)

Voer de servernaam in van je SQL server & druk “OK” :<br />
![image](https://user-images.githubusercontent.com/61239203/146780055-a491d0e6-9e2b-4242-a50e-89a506b9adc6.png)
<br />
Klap door op het pijltje te drukken de database open die je wilt gebruiken. In ons voorbeeld is dit “VisionAirport_DWH”, selecteer welke tabellen je mee wilt overnemen om vervolgens te gaan gebruiken. Druk “Laden”:<br />
![image](https://user-images.githubusercontent.com/61239203/146780113-0a8bf882-9eea-43e4-91fa-59e17e209843.png)
<br />
Als dit is gelukt kan je bij “Velden” al je tabellen zien: <br />
![image](https://user-images.githubusercontent.com/61239203/146780163-614475d4-31e0-4b0a-981c-97a35e7b2063.png)
<br />
Het dashboard geeft onderstaande zaken op een visuele manieren weer: 
1.	Flights per month
2.	Flights per country
3.	Aantal Airlines per country (top 5)
4.	Totaal van aantal vertrokken vluchten
5.	Totaal van aantal aangekomen vluchten
6.	Gemiddelde vertraging bij het vertrek
7.	Gemiddelde vertraging bij aankomst
8.	klanttevredenheid in relatie tot vertraging
9.	Aantal vliegtuigtypes 
10.	Totaal van aantal vlieghavens 
11.	Faciliteit score op 10
12.	Operatie Score op 10

![image](https://user-images.githubusercontent.com/61239203/146784228-1b3f5214-e774-4557-8dc8-b9925b55960c.png)






