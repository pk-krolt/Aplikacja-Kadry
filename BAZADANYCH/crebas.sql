/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     26.01.2018 04:38:29                          */
/*==============================================================*/


/*==============================================================*/
/* Table: OGLOSZENIE_STANOWISKO                                 */
/*==============================================================*/
create table OGLOSZENIE_STANOWISKO (
   Id_ogloszenie        numeric              identity,
   Id_stanowisko        numeric              not null,
   Nazwa_ogloszenie     varchar(50)          null,
   Opis_ogloszenie      varchar(2500)        null,
   Status_ogloszenie    varchar(50)          null,
   Data_poczatek        datetime             null,
   Data_zakonczenie     datetime             null,
   constraint PK_OGLOSZENIE_STANOWISKO primary key nonclustered (Id_ogloszenie)
)
go

/*==============================================================*/
/* Index: OGLOSZENIE_FK                                         */
/*==============================================================*/
create index OGLOSZENIE_FK on OGLOSZENIE_STANOWISKO (
Id_stanowisko ASC
)
go

/*==============================================================*/
/* Table: PRACOWNIK                                             */
/*==============================================================*/
create table PRACOWNIK (
   Id_pracownik         numeric              identity,
   Id_stanowisko        numeric              not null,
   Imie_pracownik       varchar(50)          not null,
   Nazwisko_pracownik   varchar(50)          not null,
   Data_urodzenia       datetime             not null,
   Telefon              varchar(9)           null,
   Urlop_wypoczynkowy   int                  null,
   Urlop_szkoleniowy    int                  null,
   Urlop_zdrowotny      int                  null,
   Urlop_macierzynski   int                  null,
   Email                varchar(50)          not null,
   PESEL                varchar(11)          null,
   constraint PK_PRACOWNIK primary key nonclustered (Id_pracownik)
)
go

/*==============================================================*/
/* Index: ZATRUDNIENIE_FK                                       */
/*==============================================================*/
create index ZATRUDNIENIE_FK on PRACOWNIK (
Id_stanowisko ASC
)
go

/*==============================================================*/
/* Table: STANOWISKO                                            */
/*==============================================================*/
create table STANOWISKO (
   Id_stanowisko        numeric              identity,
   Nazwa_stanowisko     varchar(50)          null,
   Dzial                varchar(50)          null,
   constraint PK_STANOWISKO primary key nonclustered (Id_stanowisko)
)
go

/*==============================================================*/
/* Table: WNIOSEK_URLOP                                         */
/*==============================================================*/
create table WNIOSEK_URLOP (
   Id_wniosek           numeric              identity,
   Id_pracownik         numeric              not null,
   Data_od              datetime             null,
   Data_do              datetime             null,
   Rodzaj_urlop         varchar(50)          null,
   Status_urlop         varchar(50)          null,
   Wiadomosc            varchar(50)          null,
   Data_utworzenia      datetime             null,
   Nazwa_urlop          varchar(250)         null,
   constraint PK_WNIOSEK_URLOP primary key nonclustered (Id_wniosek)
)
go

/*==============================================================*/
/* Index: URLOPY_FK                                             */
/*==============================================================*/
create index URLOPY_FK on WNIOSEK_URLOP (
Id_pracownik ASC
)
go

/*==============================================================*/
/* Table: WNIOSEK_ZATRUDNIENIE                                  */
/*==============================================================*/
create table WNIOSEK_ZATRUDNIENIE (
   Id_aplikacja         numeric              identity,
   Id_ogloszenie        numeric              not null,
   Imie_aplikant        varchar(50)          null,
   Nazwisko_aplikant    varchar(50)          null,
   Plik_CV              varbinary(max) 		 null,
   Telefon              varchar(9)           null,
   Email                varchar(50)          null,
   Data_wniosku         datetime             null,
   Status               varchar(50)          null,
   Dodatkowy_opis       varchar(2500)        null,
   Feedback             varchar(500)         null,
   constraint PK_WNIOSEK_ZATRUDNIENIE primary key nonclustered (Id_aplikacja)
)
go

/*==============================================================*/
/* Index: APLIKACJA_FK                                          */
/*==============================================================*/
create index APLIKACJA_FK on WNIOSEK_ZATRUDNIENIE (
Id_ogloszenie ASC
)
go

alter table OGLOSZENIE_STANOWISKO
   add constraint FK_OGLOSZEN_OGLOSZENI_STANOWIS foreign key (Id_stanowisko)
      references STANOWISKO (Id_stanowisko)
go

alter table PRACOWNIK
   add constraint FK_PRACOWNI_ZATRUDNIE_STANOWIS foreign key (Id_stanowisko)
      references STANOWISKO (Id_stanowisko)
go

alter table WNIOSEK_URLOP
   add constraint FK_WNIOSEK__URLOPY_PRACOWNI foreign key (Id_pracownik)
      references PRACOWNIK (Id_pracownik)
go

alter table WNIOSEK_ZATRUDNIENIE
   add constraint FK_WNIOSEK__APLIKACJA_OGLOSZEN foreign key (Id_ogloszenie)
      references OGLOSZENIE_STANOWISKO (Id_ogloszenie)
go

