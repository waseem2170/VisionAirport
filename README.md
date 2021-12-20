# VisionAirport: handleiding

Volg de stappen in de juiste volgorde voor het opzetten van het project. Alle bestanden zijn te vinden in deze repository.
Laten we beginnen!

## Het opzetten van de staging area

Omdat het manueel importeren van de geleverde bronbestanden (flat files) een aanzienlijke tijd in beslag zal nemen, werd er bij dit project een back-up bestand bijgevoegd genaamd "Staging_area.bapcpac". Dit bestand gebruiken we om een lege database aan te maken, de bijhorende scaffolding te doen en de database op te vullen met ruwe data.

**Stappen die je moet nemen:**

1. Rechtermuisklik op de folder "Databases" in de object explorer.
2. Klik op "Import Data-Tier Application..." om de wizard te starten.
      
![image](https://user-images.githubusercontent.com/57638471/146682177-3ad72f0d-66c3-429c-aa1a-3bab344f7284.png)
   
3. Klik op "Next" 
4. Browse voor het bestand "Staging_area.bapcpac" in de folder "StagingArea" (zie repo).
      
![image](https://user-images.githubusercontent.com/57638471/146683177-a48c1de1-32e4-4c1c-b367-ab97a825d51d.png)

5. Klik op "Next"
6. Geef nu de database de volgende naam: "VisionAirport_staging"

![image](https://user-images.githubusercontent.com/57638471/146683257-0f0c7f75-7cb0-4b7b-80e3-4c11b63edff4.png)
 
   > Let op: De database naam moet overeen komen met de eerder gegeven naam om later fouten te vermijden bij het uitvoeren van de scripts. 

 7. Klik op "Next"
 8. Klik op "Finish"

Om zeker te zijn dat de stappen correct zijn uitgevoerd, kijk je best na dat de database verschillende tabellen bevat en/of er data zit in de tabellen die beginnen met "RAW". Nadat dit gecontroleerd is, kunnen we beginnen met het cleanen van de data. Dat doen we door gebruik te maken van het script "CleaningScript.sql" (zie verder).

> Tip: Zie je de tabellen niet? Druk dan zeker op de refresh knop op tabel niveau!

![image](https://user-images.githubusercontent.com/57638471/146793927-3a91330d-70db-4b19-bc58-a3440bbe49b9.png)

## Data cleanen

In de folder "StagingArea" wordt een cleaning script voorzien die we gaan gebruiken om alle bruikbare data te exporteren naar onze data warehouse. Later meer hierover.

**Stappen die je moet nemen:**

1. Open het bestand "CleaningScript.sql" in de folder "StagingArea" (zie repo)
2. Nadat het bestand succesvol is geopend in de Management Studio, klik dan op de knop "Execute"

![image](https://user-images.githubusercontent.com/57638471/146683865-1d2e6744-155a-4df7-a3df-0d6e8610bc64.png)

  > Let op: Het kan even duren voor het script klaar is.

Als alles gelukt is, zou je het volgende onderaan je Management Studio moeten zien:

![image](https://user-images.githubusercontent.com/57638471/146683949-93cf1a6a-c64c-4362-a95e-1984defb7e44.png)

## Het opzetten van de data warehouse

Nu we onze data gecleaned hebben in de staging area is het de bedoeling dat de bruikbare data overgezet wordt naar onze data warehouse database. Dit doen we aan de hand van SSIS-packages. Vooraleer we dat doen moeten we eerst een script uitvoeren voor het aanmaken van onze data warehouse en daarin onze dimensies & fact tabellen. Hiervoor voeren de volgende stappen uit.

1. Open het bestand "DWH.sql" in de folder "Datawarehouse" (zie repo)
2. klik op "Execute" na het bestand is ingeladen in management studio

Als alles goed is verlopen zou je dimensies & fact tabellen moeten kunnen zien in de data warehouse database.

## SSIS-packages

Nu we de nodige scaffolding hebben uitgevoerd voor de data warehouse, gaan we deze opvullen met alle bruikbare data (cleaned data). Dit doen we aan de hand van SSIS packages. Pak hiervoor de VisionAirport.zip uit en open de solution in Visual Studio.

Nadat de solution is geopend, is het belangrijk om de verbinding met onze lokaal SQL server te leggen.
**Stappen die je moet nemen:**

1. Verwijder de twee connecties die als bij default meekomen met het project.

![image](https://user-images.githubusercontent.com/57638471/146685526-4e30dc3a-fb7b-4aa1-beb1-1c58c5cae9c2.png)

Voeg nu je eigen connecties toe met je lokale SQL server.

2. Rechtermuisklik op "Connection Managers"
3. Klik vervolgens op "New Connection Manager"
4. Selecteer "OLEDB" als type connectie en klik op "Next"

![image](https://user-images.githubusercontent.com/57638471/146685854-76f33c8f-82b4-4b6c-b3e3-c7472235bde2.png)

5. Klik vervolgens op "New"
7. Geef je server naam in en druk op "OK"
8. Selecteer de staging database "VisionAirport_staging"

![image](https://user-images.githubusercontent.com/57638471/146685966-8235542c-a451-4172-b171-07e7ebab675d.png)

Herhaal de voorgaande stappen om nu een verbinding te leggen met de data warehouse genaamd "VisionAirport_DWH". Nadat je dit gedaan hebt, kunnen we aan de slag met de SSIS-packages. Zorg ervoor dat in elke package de verbinding is gelegd met je database door gebruik te maken van de juiste connection manager.

Als je dat gedaan hebt, klik op de main package en voer het uit. Dit package zal alle andere packages in de juiste volgorde uitvoeren. Wanneer deze stap succesvol uitgevoerd werd, zouden de tabellen in de VisionAirport_DWH database gevuld moeten zijn met dat. Controleer dit adhv de Management Studio.


## Power-BI dashboard
Via de tool power BI hebben we de gegevens die in onze DWH werden opgeslagen visueel willen tonen op een dashboard. Op het dashboard worden een aantal resultaten getoond die naar onze mening van nut kunnen zijn om de grote hoeveelheid data makkelijker te kunnen interpreteren. 
Je kan het dashboard vinden en downloaden op de link die beschikbaar is via het bestand "PowerBIProject_Link.txt". Het project kan enkel geopend worden met Power BI desktop desktop versie dus zie dat je het geïnstalleerd hebt. In het Power BI project staan er al standaard alle tabellen van de data warehouse in die wij hebben toegevoegd.

Als je graag wil verbinden met je eigen lokaal SQL server en nieuwe gegevens wilt ophalen kan dit nog altijd in Power BI via het knop “Gegevens ophalen ” of “SQL server” :

![image](https://user-images.githubusercontent.com/61239203/146779999-4a9207e7-1a32-4733-8cbe-f3ce2fa1b049.png)

Voer de servernaam in van je SQL server & druk “OK” :

![image](https://user-images.githubusercontent.com/61239203/146780055-a491d0e6-9e2b-4242-a50e-89a506b9adc6.png)

Klap de database open die je wilt gebruiken door op het pijltje te drukken. In ons voorbeeld is dit “VisionAirport_DWH”. Selecteer welke tabellen je mee wilt overnemen om vervolgens te gaan gebruiken. Druk “Laden”:

![image](https://user-images.githubusercontent.com/61239203/146780113-0a8bf882-9eea-43e4-91fa-59e17e209843.png)

Als dit is gelukt kan je bij “Velden” al je tabellen zien:

![image](https://user-images.githubusercontent.com/61239203/146780163-614475d4-31e0-4b0a-981c-97a35e7b2063.png)

Het dashboard geeft onderstaande zaken op een visuele manieren weer: 
1.	Vluchten per maand
2.	Vluchten per land
3.	Aantal vluchten per land (top 5)
4.	Totaal van aantal vertrokken vluchten
5.	Totaal van aantal aangekomen vluchten
6.	Gemiddelde vertraging bij het vertrek
7.	Gemiddelde vertraging bij aankomst
8.	Klanttevredenheid in relatie tot vertraging
9.	Aantal vliegtuigtypes 
10.	Totaal van aantal vlieghavens 
11.	Faciliteit score op 10
12.	Operatie Score op 10

## Dashboard
![image](https://user-images.githubusercontent.com/61239203/146784228-1b3f5214-e774-4557-8dc8-b9925b55960c.png)










