use VisionAirport_staging
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[luchthavens]') AND type in (N'U'))
DROP TABLE [CLEANSED].[luchthavens]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[planning]') AND type in (N'U'))
DROP TABLE [CLEANSED].[planning]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[klant]') AND type in (N'U'))
DROP TABLE [CLEANSED].[klant]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[vertrek]') AND type in (N'U'))
DROP TABLE [CLEANSED].[vertrek]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[aankomst]') AND type in (N'U'))
DROP TABLE [CLEANSED].[aankomst]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[banen]') AND type in (N'U'))
DROP TABLE [CLEANSED].[banen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[vlucht]') AND type in (N'U'))
DROP TABLE [CLEANSED].[vlucht]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[vliegtuig]') AND type in (N'U'))
DROP TABLE [CLEANSED].[vliegtuig]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[vliegtuigtype]') AND type in (N'U'))
DROP TABLE [CLEANSED].[vliegtuigtype]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[maatschappijen]') AND type in (N'U'))
DROP TABLE [CLEANSED].[maatschappijen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[weer]') AND type in (N'U'))
DROP TABLE [CLEANSED].[weer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[klant]') AND type in (N'U'))
DROP TABLE [CLEANSED].[klant]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CLEANSED].[luchthavens]') AND type in (N'U'))
DROP TABLE [CLEANSED].[luchthavens]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ARCHIVE].[aankomst_stored]') AND type in (N'U'))
DROP TABLE [ARCHIVE].[aankomst_stored]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ARCHIVE].[vertrek_stored]') AND type in (N'U'))
DROP TABLE [ARCHIVE].[vertrek_stored]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ARCHIVE].[vliegtuigtype_stored]') AND type in (N'U'))
DROP TABLE [ARCHIVE].[vliegtuigtype_stored]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ARCHIVE].[luchthavens_stored]') AND type in (N'U'))
DROP TABLE [ARCHIVE].[luchthavens_stored]
GO


CREATE TABLE [CLEANSED].[weer](
	WeerId	Int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Datum	date		NOT NULL,
	DDVEC	smallint	NOT NULL,
	FHVEC	tinyint		NOT NULL,
	FG		tinyint		NOT NULL,
	FHX		smallint	NOT NULL,
	FHXH	tinyint		NOT NULL,
	FHN		tinyint		NOT NULL,
	FHNH	tinyint		NOT NULL,
	FXX		smallint	NOT NULL,
	FXXH	tinyint		NOT NULL,
	TG		smallint	NOT NULL,
	TN		smallint	NOT NULL,
	TNH		tinyint 	NOT NULL,
	TX		smallint 	NOT NULL,
	TXH		tinyint 	NOT NULL,
	T10N	smallint 	NOT NULL,
	T10NH	tinyint 	NOT NULL,
	SQ		smallint 	NOT NULL,
	SP		tinyint 	NOT NULL,
	Q		smallint 	NOT NULL,
	DR 		smallint 	NOT NULL,
	RH 		smallint 	NOT NULL,
	RHX 	smallint 	NOT NULL,
	RHXH 	tinyint 	NOT NULL,
	PG 		smallint 	NOT NULL,
	PX 		smallint 	NOT NULL,
	PXH 	tinyint 	NOT NULL,
	PN 		smallint 	NOT NULL,
	PNH 	tinyint 	NOT NULL,
	VVN 	tinyint 	NOT NULL,
	VVNH 	tinyint 	NOT NULL,
	VVX	 	tinyint 	NOT NULL,
	VVXH 	tinyint 	NOT NULL,
	NG 		tinyint 	NOT NULL,
	UG 		tinyint 	NOT NULL,
	UX 		tinyint 	NOT NULL,
	UXH 	tinyint 	NOT NULL,
	UN 		tinyint 	NOT NULL,
	UNH 	tinyint 	NOT NULL,
	EV2 	tinyint 	NOT NULL
);
CREATE TABLE [CLEANSED].[maatschappijen] (
	Id		int		NOT NULL	IDENTITY	PRIMARY KEY,
	Name	varchar(50) NOT NULL,
	IATA	varchar(2)	NULL,
	ICAO	varchar(3)	NULL
);
CREATE TABLE [CLEANSED].[vliegtuigtype](
	IATA				char(3)			NOT NULL	PRIMARY KEY,
	ICAO				char(4)			NULL,
	Merk				varchar(50)		NOT NULL,
	Type				varchar(100)	NOT NULL,
	Wake				char(1)			NULL,
	Cat					varchar(50)		NULL,
	Capaciteit			int				NULL,
	Vracht				int				NULL
);
CREATE TABLE [CLEANSED].[vliegtuig](
	VliegtuigCode		varchar(8)		NOT NULL	PRIMARY KEY,
	VliegtuigType		char(3)			NOT NULL,
	AirlineCode			varchar(5)		NULL,
	Bouwjaar			int				NULL,
	FOREIGN KEY (VliegtuigType) REFERENCES [CLEANSED].[vliegtuigtype](IATA),
);
CREATE TABLE [CLEANSED].[vlucht] (
	VluchtId		int			NOT NULL	PRIMARY KEY,
	VluchtNr		varchar(7)		NULL,
	AirlineCode		varchar(3)		NULL,		-- TODO
	DestCode		varchar(3)		NOT NULL,	-- TODO
	VliegtuigCode	varchar(8)		NOT NULL,
	Datum			date			NOT NULL,
	FOREIGN KEY (VliegtuigCode) REFERENCES [CLEANSED].[vliegtuig](VliegtuigCode),
);
CREATE TABLE [CLEANSED].[banen] (
	Baannummer	int			NOT NULL	PRIMARY KEY,
	Code		varchar(7)	NOT NULL,
	Naam		varchar(50) NOT NULL,
	Lengte		int			NOT NULL
);
CREATE TABLE [CLEANSED].[aankomst](
	VluchtId		int		NOT NULL	PRIMARY KEY,
	VliegtuigCode	varchar(8) NOT NULL,
	Terminal		char(1)		NULL,
	Gate			char(2)		NULL,
	Baan			int			NULL,
	Weer			int			NULL,
	Bezetting		int			NULL,
	Vracht			int			NULL,
	DatumId			int			NULL,
	WeerDatum		date		NULL,
	Datum			datetime		NULL
	FOREIGN KEY (Weer) REFERENCES [CLEANSED].[weer](WeerId),
	FOREIGN KEY (VluchtId) REFERENCES [CLEANSED].[vlucht](VluchtId),
	FOREIGN KEY (Baan) REFERENCES [CLEANSED].[banen](Baannummer),
);
CREATE TABLE [CLEANSED].[vertrek](
	VluchtId		int		NOT NULL	PRIMARY KEY,
	VliegtuigCode	varchar(8)	NOT NULL,
	Terminal		char(1)		NULL,
	Gate			char(2)		NULL,
	Baan			int			NULL,
	Weer			int			NULL,
	Bezetting		int			NULL,
	Vracht			int			NULL,
	DatumId			int			NULL,
	WeerDatum		date		NULL,
	Datum			datetime		NULL
	FOREIGN KEY (Weer) REFERENCES [CLEANSED].[weer](WeerId),
	FOREIGN KEY (VluchtId) REFERENCES [CLEANSED].[vlucht](VluchtId),
	FOREIGN KEY (Baan) REFERENCES [CLEANSED].[banen](Baannummer),
);

CREATE TABLE [CLEANSED].[planning] (
	VluchtNr		varchar(8)	NOT NULL	PRIMARY KEY,
    AirlineCode		varchar(3)	NOT NULL,
    DestCode		char(3)		NOT NULL,
    PlanTerminal	char(1)		NULL,
    PlanGate		char(2)		NULL,
    PlanTijd		time		NULL
);

CREATE TABLE [CLEANSED].[klant] (
	KlantId			int		NOT NULL IDENTITY(1,1) PRIMARY KEY,
	VluchtId		int		NOT NULL,
	Operatie		float	NOT NULL,
	Faciliteiten	float	NOT NULL,
	Shops			float	NULL,
	FOREIGN KEY (VluchtId) REFERENCES [CLEANSED].[vlucht](VluchtId),
);
CREATE TABLE [CLEANSED].[luchthavens] (
	Id			bigint			NOT NULL	IDENTITY	PRIMARY KEY,
	Luchthaven		varchar(100)	NOT NULL,
	Stad		varchar(50)		NOT NULL,
	Land		varchar(50)		NOT NULL,
	IATA		varchar(3)		NULL,
	ICAO		varchar(4)		NOT NULL,
	Latitude	float			NOT NULL,
	Longitude	float			NOT NULL,
	Altitude	smallint		NOT NULL,
	Tijdzone	float			NOT NULL,
	DST			char(1)			NOT NULL,
	TijdZoneTekst varchar(100)	NULL
);

INSERT INTO [CLEANSED].[weer] 
	SELECT 
		CAST(Datum AS date),
		CAST(DDVEC AS smallint),
		CAST(FHVEC AS tinyint),
		CAST(FG AS tinyint),
		CAST(FHX AS smallint),
		CAST(FHXH AS tinyint),
		CAST(FHN AS tinyint),
		CAST(FHNH AS tinyint),
		CAST(FXX AS smallint),
		CAST(FXXH AS tinyint),
		CAST(TG AS smallint),
		CAST(TN AS smallint),
		CAST(TNH AS tinyint),
		CAST(TX AS smallint),
		CAST(TXH AS tinyint),
	    CAST(T10N AS smallint),
	    CAST(T10NH AS tinyint),
		CAST(SQ AS smallint),
		CAST(SP AS tinyint),
		CAST(Q AS smallint),
		CAST(DR AS smallint),
		CAST(RH AS smallint),
		CAST(RHX AS smallint),
		CAST(RHXH AS tinyint),
		CAST(PG AS smallint),
		CAST(PX AS smallint),
		CAST(PXH AS tinyint),
		CAST(PN AS smallint),
		CAST(PNH AS tinyint),
		CAST(VVN AS tinyint),
		CAST(VVNH AS tinyint),
		CAST(VVX AS tinyint),
		CAST(VVXH AS tinyint),
		CAST(NG AS tinyint),
		CAST(UG AS tinyint),
		CAST(UX AS tinyint),
		CAST(UXH AS tinyint),
		CAST(UN AS tinyint),
		CAST(UNH AS tinyint),
		CAST(EV2 AS tinyint)
	FROM [RAW].weer


INSERT INTO [CLEANSED].[maatschappijen]
		SELECT 
			NULLIF(REPLACE(REPLACE(REPLACE(CAST(Name AS varchar(50)), '!', ''), '#', ''), '$', ''),'') Name,
			NULLIF(CAST(IATA AS varchar(2)), '') IATA, 
			NULLIF(CAST(ICAO AS varchar(3)), '') ICAO 
		FROM [RAW].[maatschappijen];

INSERT INTO [CLEANSED].[vliegtuigtype]
		SELECT 
			CAST(IATA AS char(3)) IATA, 
			NULLIF(REPLACE(CAST(ICAO AS char(4)),'n/a',''), '') ICAO, 
			CAST(Merk AS varchar(50)) Merk,
			CAST(Type AS varchar(100)) Type,
			NULLIF(REPLACE(CAST(WAKE AS char(1)),'n',''),'') Wake, 
			NULLIF(CAST(CAT AS varchar(50)), '') Cat,
			NULLIF(CAST(Capaciteit AS int),'') Capaciteit,
			NULLIF(CAST(Vracht AS int),'') Vracht	
		FROM [RAW].[vliegtuigtype]
		WHERE IATA IS NOT NULL AND Merk IS NOT NULL AND type IS NOT NULL;

INSERT INTO [CLEANSED].[vliegtuig] 
	SELECT
		CAST(VliegtuigCode AS varchar(10)) VliegtuigCode,
		NULLIF(CAST(VliegtuigType AS char(3)),'') VliegtuigType,
		NULLIF(REPLACE(CAST(AirlineCode AS varchar(5)),'-',''),'') AirlineCode, 
		NULLIF(CAST(Bouwjaar AS int), '') Bouwjaar
	FROM [RAW].[vliegtuig]
		
INSERT INTO [CLEANSED].[vlucht]
	SELECT 
		Vluchtid,
		NULLIF(CAST(VluchtNr AS varchar(7)), ''),
		NULLIF(CAST(AirlineCode AS varchar(3)), ''),
		CAST(DestCode AS varchar(3)),
		CAST(Vliegtuigcode AS varchar(8)),
		NULLIF(CAST(Datum AS date),'')
	FROM [RAW].[vlucht]
	WHERE(TRY_CAST(Vluchtid AS int) IS NOT NULL);

INSERT INTO [CLEANSED].[banen]
	SELECT 
		CAST(Baannummer AS int),
		CAST(Code AS varchar(7)),
		CAST((Naam) AS varchar(50)),
		CAST(Lengte AS int)
	FROM [RAW].[banen];

INSERT INTO [CLEANSED].[aankomst] (Vluchtid,	Vliegtuigcode,	Terminal,
	Gate,	Baan,	Bezetting,	Vracht,	Datum)
	SELECT 
		vluchtId,
		CAST(VliegtuigCode AS varchar(10)), 
		NULLIF(CAST(Terminal AS char(1)), ''), 
		NULLIF(CAST(Gate AS char(2)), ''), 
		NULLIF(CAST(Baan AS int), ''),
		NULLIF(CAST(Bezetting AS int), ''), 
		NULLIF(CAST(Vracht AS int), ''),
		NULLIF(CAST(AankomstTijd AS DATETIME), '')
	FROM [RAW].[aankomst]
	WHERE (TRY_CAST(Vluchtid AS int) IS NOT NULL) AND Aankomsttijd IS NOT NULL;

INSERT INTO [CLEANSED].[vertrek] (Vluchtid,	Vliegtuigcode,	Terminal,
	Gate,	Baan,	Bezetting,	Vracht,	Datum)
	SELECT 
		CAST(Vluchtid AS int),
		CAST(VliegtuigCode AS varchar(10)), 
		NULLIF(CAST(Terminal AS char(1)), ''), 
		NULLIF(CAST(Gate AS char(2)), ''), 
		NULLIF(CAST(Baan AS int), ''), 
		NULLIF(CAST(Bezetting AS int), ''), 
		NULLIF(CAST(Vracht AS int), ''), 
		NULLIF(CAST(Vertrektijd AS DATETIME), '')		
	FROM [RAW].[vertrek]
	WHERE NULLIF(CAST(Vertrektijd AS DATETIME), '') IS NOT NULL;

INSERT INTO [CLEANSED].[planning]
	SELECT 
		CAST(VluchtNr AS varchar(8)),
		CAST(AirlineCode AS varchar(3)),
		CAST(DestCode AS char(3)),
		NULLIF(CAST(PlanTerminal AS char(1)), ''),
		NULLIF(CAST(PlanGate AS char(2)), ''),
		NULLIF(CAST(PlanTijd AS time), '')
	FROM [RAW].[planning];

	INSERT INTO [CLEANSED].[klant]
	SELECT 
		VluchtId,
		CAST(Operatie AS float), 
		CAST(Faciliteiten AS float),
		NULLIF(CAST(Shops AS float), 0)
	FROM [RAW].[klant]
	WHERE(TRY_CAST(Vluchtid AS int) IS NOT NULL);

	INSERT INTO [CLEANSED].[luchthavens]
		SELECT 
			NULLIF(REPLACE(REPLACE(REPLACE(CAST(Airport AS varchar(100)), '?', ''), '#', ''), '$', ''),'') Luchthaven,
			NULLIF(REPLACE(REPLACE(REPLACE(CAST(City AS varchar(50)), '?', ''), '#', ''), '$', ''),'') Stad,
			CAST(Country AS varchar(50)) Land,
			NULLIF(CAST(IATA AS varchar(3)), ''),
			CAST(ICAO AS varchar(4)),
			CAST(Lat AS float) Latitude,
			CAST(Lon AS float) Longitude,
			CAST(Alt AS smallint) Altidue,
			CAST(TZ AS float) TimeZoneNummer,
			CAST(DST AS char(1)) DST,
			NULLIF(REPLACE(CAST(Tz AS varchar(100)), '\N', ''), '') TimeZoneTekst
		FROM [RAW].[luchthavens]
	WHERE ICAO IS NOT NULL OR ICAO NOT LIKE '/N';

--maatschapij tabel update
UPDATE [CLEANSED].[maatschappijen]
	SET IATA = NULL
	WHERE (IATA NOT LIKE REPLICATE('[0-9A-Z]', 2))

UPDATE [CLEANSED].[maatschappijen]
	SET ICAO = NULL
	WHERE (ICAO NOT LIKE REPLICATE('[0-9A-Z]', 3))

--ARCHIVE
CREATE TABLE [ARCHIVE].[aankomst_stored] (
	VluchtId		int		NOT NULL PRIMARY KEY,
	VliegtuigCode	varchar(10) NULL,
	Terminal		char(1)		NULL,
	Gate			char(2)		NULL,
	Baan			int			NULL,
	Bezetting		int			NULL,
	Vracht			int			NULL,
	Aankomsttijd	datetime	NULL,
);

CREATE TABLE [ARCHIVE].[vertrek_stored](
	VluchtId		int		NOT NULL	PRIMARY KEY,
	VliegtuigCode	varchar(10)	NOT NULL,
	Terminal		char(1)		NULL,
	Gate			char(2)		NULL,
	Baan			int			NULL,
	Bezetting		int			NULL,
	Vracht			int			NULL,
	Datum			datetime		NULL
);

CREATE TABLE [ARCHIVE].[vliegtuigtype_stored](
	IATA				char(3)			NOT NULL	PRIMARY KEY,
	ICAO				char(4)			NULL,
	Merk				varchar(50)		NULL,
	Type				varchar(100)	NULL,
	Wake				char(1)			NULL,
	Cat					varchar(50)		NULL,
	Capaciteit			int				NULL,
	Vracht				int				NULL
);

CREATE TABLE [ARCHIVE].[luchthavens_stored] (
	Id			bigint			NOT NULL IDENTITY PRIMARY KEY,
	Luchthaven		varchar(100) NULL,
	Stad		varchar(50)		 NULL,
	Land		varchar(50)		 NULL,
	IATA		varchar(3)		NULL,
	ICAO		varchar(4)		NULL,
	Latitude	float			NULL,
	Longitude	float			NULL,
	Altitude	smallint		NULL,
	Tijdzone	float			NULL,
	DST			char(1)			NULL,
	TijdZoneTekst varchar(100)	NULL
);

INSERT INTO [ARCHIVE].[aankomst_stored] 
	SELECT 
		CAST(VluchtId AS int),
		CAST(VliegtuigCode AS varchar(10)), 
		CAST(Terminal AS char(1)), 
		NULLIF(CAST(Gate AS char(2)),''), 
		CAST(Baan AS int), 
		CAST(Bezetting AS int), 
		CAST(Vracht AS int), 
		CAST(AankomstTijd AS datetime) AankomstTijd
	FROM [RAW].[aankomst] WHERE NULLIF(CAST(Aankomsttijd AS DATEtime), '') IS NULL;

INSERT INTO [ARCHIVE].[vertrek_stored]
	SELECT 
		CAST(Vluchtid AS int),
		CAST(VliegtuigCode AS varchar(10)), 
		NULLIF(CAST(Terminal AS char(1)), ''), 
		NULLIF(CAST(Gate AS char(2)), ''), 
		NULLIF(CAST(Baan AS int), ''), 
		NULLIF(CAST(Bezetting AS int), ''), 
		NULLIF(CAST(Vracht AS int), ''), 
		NULLIF(CAST(Vertrektijd AS DATEtime), '')		
	FROM [RAW].[vertrek]
	WHERE NULLIF(CAST(Vertrektijd AS DATEtime), '') IS NULL;

INSERT INTO [ARCHIVE].[vliegtuigtype_stored]
		SELECT 
			CAST(IATA AS char(3)) IATA, 
			NULLIF(REPLACE(CAST(ICAO AS char(4)),'n/a',''), '') ICAO, 
			NULLIF(CAST(Merk AS varchar(50)),'') Merk,
			NULLIF(CAST(Type AS varchar(100)),'') [Type],
			NULLIF(REPLACE(CAST(WAKE AS char(1)),'n',''),'') Wake, 
			NULLIF(CAST(CAT AS varchar(50)), '') Cat,
			NULLIF(CAST(Capaciteit AS int),'') Capaciteit,
			NULLIF(CAST(Vracht AS int),'') Vracht	
		FROM [RAW].[vliegtuigtype]
		WHERE IATA IS NULL OR ICAO IS NULL OR Merk IS NULL;

INSERT INTO [ARCHIVE].[luchthavens_stored]
		SELECT 
			CAST(Airport AS varchar(100)) Luchthaven,
			CAST(City AS varchar(50)) Stad,
			CAST(Country AS varchar(50)) Land,
			NULLIF(CAST(IATA AS varchar(3)), ''),
			CAST(ICAO AS varchar(4)),
			CAST(Lat AS float) Latitude,
			CAST(Lon AS float) Longitude,
			CAST(Alt AS smallint) Altidue,
			CAST(TZ AS float) TimeZoneNummer,
			CAST(DST AS char(1)) DST,
			NULLIF(REPLACE(CAST(Tz AS varchar(100)), '\N', ''), '') TimeZoneTekst
		FROM [RAW].[luchthavens]
	WHERE ICAO IS NULL OR ICAO LIKE '/N';