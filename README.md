# VisionAirport: handleiding

Volg de stappen in de juiste volgorde voor het opzetten van het project. Alle bestanden zijn te vinden in dit repository.
Laten we beginnen!

## Het opzetten van de staging area

Omdat het manueel importeren van de geleverde bronbestanden (flat files) een aanzienlijk tijd in beslag zullen nemen wordt er bij dit project een back-up bestand meegeleverd genaamd "Staging_area.bapcpac". Dit bestand gebruik je om een lege database aan te maken, te scaffolden en op te vullen met ruwe data.

**Stappen die je moet nemen:**

1. Rechtermuisklik op het folder "Databases" in de object explorer.
2. Klik op "Import Data-Tier Application..." om de wizard te starten.
      
![image](https://user-images.githubusercontent.com/57638471/146682177-3ad72f0d-66c3-429c-aa1a-3bab344f7284.png)
   
3. Klik op "Next" 
4. Browse voor het bestand "Staging_area.bapcpac" (zie repo).
      
![image](https://user-images.githubusercontent.com/57638471/146683177-a48c1de1-32e4-4c1c-b367-ab97a825d51d.png)

5. Klik op "Next"
6. Geef nu de database naam "VisionAirport_staging"

![image](https://user-images.githubusercontent.com/57638471/146683257-0f0c7f75-7cb0-4b7b-80e3-4c11b63edff4.png)
 
   > Let op: De database naam moet overeenkomen met als hierboven om later fouten te vermijden bij het uitvoeren van de script. 

 7. Klik op "Next"
 8. Klik op "Finish"

Om zeker te zijn of de stappen correct zijn gebeurd kijk na dat de database tabellen heeft en/of er data zit in de tabellen die beginnen met "RAW".
Na dit gelukt is kunnen we beginnen met het cleanen van de data. Dat doen we door gebruik te maken van het script "CleaningScript.sql".

## Script uitvoeren voor het cleanen van de data

**Stappen die je moet nemen:**

1. Open het bestand "CleaningScript.sql" (zie repo)
2. Klik op "Execute"

![image](https://user-images.githubusercontent.com/57638471/146683865-1d2e6744-155a-4df7-a3df-0d6e8610bc64.png)

  > Let op: Het kan even duren voor het script klaar is afhankelijk van de hardware die je gebruikt.

Als alles gelukt is zou je het volgende onderaan je management studio moeten zien.

![image](https://user-images.githubusercontent.com/57638471/146683949-93cf1a6a-c64c-4362-a95e-1984defb7e44.png)

## Het opzetten van de datawarehouse

Nu we onze data gecleaned hebben in de staging area is het de bedoeling dat de bruikbare data overgezet wordt naar onze datawarehouse database. Dit doen we aan de hand van SSIS-packages. Vooraleer we dat doen moeten we eerst een lege database aanmaken en onze dimensies & fact tabellen aanmaken. Hiervoor voeren

## SSIS-packages





