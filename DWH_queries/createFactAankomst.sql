USE [vision_airport_DWH]

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



