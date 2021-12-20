IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'VisionAirport_DWH')
BEGIN
CREATE DATABASE VisionAirport_DWH;
END;
GO

use VisionAirport_DWH
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vertrek]') AND type in (N'U'))
DROP TABLE[dbo].[vertrek]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aankomst]') AND type in (N'U'))
DROP TABLE[dbo].[aankomst]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banen]') AND type in (N'U'))
DROP TABLE [dbo].[banen]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[klant]') AND type in (N'U'))
DROP TABLE [dbo].[klant]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luchthavens]') AND type in (N'U'))
DROP TABLE [dbo].[luchthavens]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maatschappijen]') AND type in (N'U'))
DROP TABLE [dbo].[maatschappijen]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[planning]') AND type in (N'U'))
DROP TABLE [dbo].[planning]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[datum]') AND type in (N'U'))
DROP TABLE [dbo].[datum]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vliegtuig]') AND type in (N'U'))
DROP TABLE [dbo].[vliegtuig]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vliegtuigtype]') AND type in (N'U'))
DROP TABLE [dbo].[vliegtuigtype]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vlucht]') AND type in (N'U'))
DROP TABLE [dbo].[vlucht]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[weer]') AND type in (N'U'))
DROP TABLE [dbo].[weer]
GO

-- DIMENSIONS

CREATE TABLE [dbo].[banen](
	[Baannummer] [int] NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Naam] [varchar](50) NOT NULL,
	[Lengte] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Baannummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[datum](
	[DatumId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekDayName_Short] [char](3) NOT NULL,
	[WeekDayName_FirstLetter] [char](1) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[MonthName_Short] [char](3) NOT NULL,
	[MonthName_FirstLetter] [char](1) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DatumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[klant](
	[KlantId] [int] IDENTITY(1,1) NOT NULL,
	[VluchtId] [int] NOT NULL,
	[Operatie] [float] NOT NULL,
	[Faciliteiten] [float] NOT NULL,
	[Shops] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[KlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[luchthavens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Luchthaven] [varchar](100) NOT NULL,
	[Stad] [varchar](50) NOT NULL,
	[Land] [varchar](50) NOT NULL,
	[IATA] [varchar](3) NULL,
	[ICAO] [varchar](4) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Altitude] [smallint] NOT NULL,
	[Tijdzone] [float] NOT NULL,
	[DST] [char](1) NOT NULL,
	[TijdZoneTekst] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[maatschappijen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IATA] [varchar](2) NULL,
	[ICAO] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[planning](
	[VluchtNr] [varchar](8) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[DestCode] [char](3) NOT NULL,
	[PlanTerminal] [char](1) NULL,
	[PlanGate] [char](2) NULL,
	[PlanTijd] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[VluchtNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[vliegtuig](
	[VliegtuigCode] [varchar](8) NOT NULL,
	[VliegtuigType] [char](3) NOT NULL,
	[AirlineCode] [varchar](5) NULL,
	[Bouwjaar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VliegtuigCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vliegtuigtype](
	[IATA] [char](3) NOT NULL,
	[ICAO] [char](4) NULL,
	[Merk] [varchar](50) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Wake] [char](1) NULL,
	[Cat] [varchar](50) NULL,
	[Capaciteit] [int] NULL,
	[Vracht] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IATA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[weer](
	[WeerId] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[DDVEC] [smallint] NOT NULL,
	[FHVEC] [tinyint] NOT NULL,
	[FG] [tinyint] NOT NULL,
	[FHX] [smallint] NOT NULL,
	[FHXH] [tinyint] NOT NULL,
	[FHN] [tinyint] NOT NULL,
	[FHNH] [tinyint] NOT NULL,
	[FXX] [smallint] NOT NULL,
	[FXXH] [tinyint] NOT NULL,
	[TG] [smallint] NOT NULL,
	[TN] [smallint] NOT NULL,
	[TNH] [tinyint] NOT NULL,
	[TX] [smallint] NOT NULL,
	[TXH] [tinyint] NOT NULL,
	[T10N] [smallint] NOT NULL,
	[T10NH] [tinyint] NOT NULL,
	[SQ] [smallint] NOT NULL,
	[SP] [tinyint] NOT NULL,
	[Q] [smallint] NOT NULL,
	[DR] [smallint] NOT NULL,
	[RH] [smallint] NOT NULL,
	[RHX] [smallint] NOT NULL,
	[RHXH] [tinyint] NOT NULL,
	[PG] [smallint] NOT NULL,
	[PX] [smallint] NOT NULL,
	[PXH] [tinyint] NOT NULL,
	[PN] [smallint] NOT NULL,
	[PNH] [tinyint] NOT NULL,
	[VVN] [tinyint] NOT NULL,
	[VVNH] [tinyint] NOT NULL,
	[VVX] [tinyint] NOT NULL,
	[VVXH] [tinyint] NOT NULL,
	[NG] [tinyint] NOT NULL,
	[UG] [tinyint] NOT NULL,
	[UX] [tinyint] NOT NULL,
	[UXH] [tinyint] NOT NULL,
	[UN] [tinyint] NOT NULL,
	[UNH] [tinyint] NOT NULL,
	[EV2] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WeerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[vliegtuig]  WITH NOCHECK ADD  CONSTRAINT [FK_Vliegtuig_VliegtuigType] FOREIGN KEY([VliegtuigType])
REFERENCES [dbo].[vliegtuigtype] ([IATA])
GO

ALTER TABLE [dbo].[vliegtuig] CHECK CONSTRAINT [FK_Vliegtuig_VliegtuigType]


-- FACT TABELLEN

drop table if exists [dbo].[aankomst]

CREATE TABLE [dbo].[aankomst](
	[vluchtid] [int] NOT NULL,
	[vliegtuigtype] [char](3) NULL,
	[baannummer] [int] NULL,
	[vliegtuigcode] [varchar](8) NULL,
	[weerId] [int] NULL,
	[vluchtnr] [varchar](8) NULL,
	[gate] [char](2) NULL,
	[datumId] [int] NULL,
	[bezetting] [smallint] NULL,
	[vracht] [tinyint] NULL,
	[land][varchar](50) NULL,
	[luchthaven][varchar](100) NULL,
	[datum] [datetime] NULL,
	[vertragingMin] [int] NULL,
	CONSTRAINT FK_datum_aankomst FOREIGN KEY (datumId) REFERENCES datum(DatumId),
	CONSTRAINT FK_vliegtuigtype_aankomst FOREIGN KEY (vliegtuigtype) REFERENCES vliegtuigtype(IATA),
	CONSTRAINT FK_baan_aankomst FOREIGN KEY (baannummer) REFERENCES banen(Baannummer),
	CONSTRAINT FK_vliegtuig_aankomst FOREIGN KEY (vliegtuigcode) REFERENCES vliegtuig(Vliegtuigcode),
	CONSTRAINT FK_weer_aankomst FOREIGN KEY (weerId) REFERENCES weer(WeerId),
	CONSTRAINT FK_planning_aankomst FOREIGN KEY (vluchtnr) REFERENCES planning(Vluchtnr),
PRIMARY KEY CLUSTERED 
(
	[vluchtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [vision_airport_DWH]

drop table if exists [dbo].[vertrek]

CREATE TABLE [dbo].[vertrek](
	[vluchtid] [int] NOT NULL,
	[vliegtuigtype] [char](3) NULL,
	[baannummer] [int] NULL,
	[vliegtuigcode] [varchar](8) NULL,
	[weerId] [int] NULL,
	[vluchtnr] [varchar](8) NULL,
	[gate] [char](2) NULL,
	[datumId] [int] NULL,
	[bezetting] [smallint] NULL,
	[vracht] [tinyint] NULL,
	[land][varchar](50) NULL,
	[luchthaven][varchar](100) NULL,
	[datum] [datetime] NULL,
	[vertragingMin] [int] NULL,
	CONSTRAINT FK_datum_vertrek FOREIGN KEY (datumId) REFERENCES datum(DatumId),
	CONSTRAINT FK_vliegtuigtype_vertrek FOREIGN KEY (vliegtuigtype) REFERENCES vliegtuigtype(IATA),
	CONSTRAINT FK_baan_vertrek FOREIGN KEY (baannummer) REFERENCES banen(Baannummer),
	CONSTRAINT FK_vliegtuig_vertrek FOREIGN KEY (vliegtuigcode) REFERENCES vliegtuig(Vliegtuigcode),
	CONSTRAINT FK_weer_vertrek FOREIGN KEY (weerId) REFERENCES weer(WeerId),
	CONSTRAINT FK_planning_vertrek FOREIGN KEY (vluchtnr) REFERENCES planning(Vluchtnr),
PRIMARY KEY CLUSTERED 
(
	[vluchtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


