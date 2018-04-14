USE [Kadry]
GO

INSERT INTO [dbo].[WNIOSEK_URLOP]
           ([Id_pracownik]
	       ,[Nazwa_urlop]
		   ,[Data_od]
           ,[Data_do]
           ,[Rodzaj_urlop]
           ,[Status_urlop]
		   ,[Wiadomosc]
		   ,[Data_utworzenia])
     VALUES
           ('1','Urlop na wypoczynek','2017-12-15','2017-12-23','Wypoczynkowy','Oczekuje','Potrzebuje wypoczynku','2017-12-23'),
		   ('2','Urlop na wypoczynek','2018-01-01','2018-02-01','Wypoczynkowy','Zaakceptowany','Potrzebuje wypoczynku','2017-12-23'),
		   ('2','Urlop na wypoczynek','2018-06-01','2018-07-25','Wypoczynkowy','Oczekuje','Potrzebuje wypoczynku','2017-12-23'),
		   ('4','Urlop na szkolenie','2017-12-15','2017-12-23','Szkoleniowy','Zaakceptowany','Potrzebuje szkolenia','2017-12-23'),
		   ('4','Urlop na wypoczynek','2018-05-01','2018-05-14','Wypoczynkowy','Oczekuje','Potrzebuje wypoczynku','2017-12-23')
GO


