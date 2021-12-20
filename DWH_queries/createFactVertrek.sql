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


