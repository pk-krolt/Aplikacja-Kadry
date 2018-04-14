USE [Kadry]
GO

INSERT INTO [dbo].[WNIOSEK_ZATRUDNIENIE]
           ([Id_ogloszenie]
           ,[Imie_aplikant]
           ,[Nazwisko_aplikant]
		   ,[Plik_CV]
           ,[Telefon]
		   ,[Email]
		   ,[Dodatkowy_opis]
		   ,[Status]
		   ,[Data_wniosku])
     VALUES
           ('1','Łukasz','Dobrowolski',null,'98010199889','lukaszdo@kadry.pl','Jestem specjalista','Oczekuje','2018-01-02'),
		   ('2','Agnieszka','Mila',null,'98010199889','milagaa@kadry.pl','Jestem specjalista','Oczekuje','2018-01-02'),
		   ('3','Anna','Baczyńska',null,'98010199889','annabacz@kadry.pl','Jestem specjalista','Odrzucono','2018-01-02'),
		   ('3','Igor','Norowicz',null,'98010199889','igornor@kadry.pl','Jestem specjalista','Oczekuje','2018-01-02'),
		   ('2','Michał','Nowak',null,'98010199889','michalnowa@kadry.pl','Jestem specjalista','Zaakceptowano','2018-01-02'),
		   ('4','Jolanta','Mazur',null,'98010199889','jolamazur@kadry.pl','Jestem specjalista','Oczekuje','2018-01-02'),
		   ('4','Krzysztof','Rak',null,'98010199889','krzysztofrak@kadry.pl','Jestem specjalista','Oczekuje','2018-01-02'),
		   ('2','Łukasz','Koło',null,'98010199889','lukaszko@kadry.pl','Jestem specjalista','Oczekuje','2018-01-02')
GO


