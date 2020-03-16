-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2019-12-08 11:26:14 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE BUTY_KLIENT;

CREATE TABLE BUTY_KLIENT
  (
    numer_klienta          NUMBER NOT NULL ,
    imie_klienta           VARCHAR2 (20) NOT NULL ,
    nazwisko_klienta       VARCHAR2 (20) NOT NULL ,
    ulica_klienta          VARCHAR2 (50) ,
    miasto_klienta         VARCHAR2 (30) ,
    kod_pocztowy_klienta   VARCHAR2 (10) ,
    numer_telefonu_klienta VARCHAR2 (20) ,
    email_klienta          VARCHAR2 (30)
  ) ;
ALTER TABLE BUTY_KLIENT ADD CONSTRAINT BUTY_KLIENT_PK PRIMARY KEY ( numer_klienta ) ;
ALTER TABLE BUTY_KLIENT ADD CONSTRAINT email_klienta_UN UNIQUE ( email_klienta ) ;


DROP SEQUENCE BUTY_KLIENT_SEQ;
CREATE SEQUENCE BUTY_KLIENT_SEQ
 START WITH     207
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 DROP TABLE BUTY_PRACOWNIK;

CREATE TABLE BUTY_PRACOWNIK
  (
    numer_pracownika    NUMBER (10) NOT NULL ,
    imie_pracownika     VARCHAR2 (20) NOT NULL ,
    nazwisko_pracownika VARCHAR2 (20) NOT NULL
  ) ;

ALTER TABLE BUTY_PRACOWNIK ADD CONSTRAINT BUTY_PRACOWNIK_PK PRIMARY KEY ( numer_pracownika ) ;

DROP SEQUENCE BUTY_KLIENT_SEQ;
CREATE SEQUENCE BUTY_KLIENT_SEQ
 START WITH     123
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;


DROP TABLE BUTY_PRODUKT;

CREATE TABLE BUTY_PRODUKT
  (
    numer_produktu NUMBER NOT NULL ,
    nazwa_produktu VARCHAR2 (30) NOT NULL ,
    cena_produktu  NUMBER (5,2) NOT NULL ,
    opis_produktu  VARCHAR2 (2000) ,
    zdjecie_produktu BLOB ,
    rodzaj_produktu NUMBER (10) NOT NULL
  ) ;
ALTER TABLE BUTY_PRODUKT ADD CONSTRAINT BUTY_PRODUKT_PK PRIMARY KEY ( numer_produktu ) ;
ALTER TABLE BUTY_PRODUKT ADD CONSTRAINT nazwa_produktu_UN UNIQUE ( nazwa_produktu ) ;


DROP SEQUENCE BUTY_PRODUKT_SEQ;
CREATE SEQUENCE BUTY_PRODUKT_SEQ
 START WITH     345
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;


DROP TABLE BUTY_RODZAJ_PRODUKTU

CREATE TABLE BUTY_RODZAJ_PRODUKTU
  (
    rodzaj_produktu        NUMBER (10) NOT NULL ,
    nazwa_rodzaju_produktu VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE BUTY_RODZAJ_PRODUKTU ADD CONSTRAINT BUTY_RODZAJ_PRODUKTU_PK PRIMARY KEY ( rodzaj_produktu ) ;
ALTER TABLE BUTY_RODZAJ_PRODUKTU ADD CONSTRAINT nazwa_rodzaju_produktu_UN UNIQUE ( nazwa_rodzaju_produktu ) ;


DROP SEQUENCE BUTY_RODZAJ_PRODUKTU_SEQ;
CREATE SEQUENCE BUTY_RODZAJ_PRODUKTU_SEQ
 START WITH     657
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;


DROP TABLE BUTY_ZAMOWIENIE;


CREATE TABLE BUTY_ZAMOWIENIE
  (
    nr_zamowienia      NUMBER NOT NULL ,
    numer_klienta      NUMBER NOT NULL ,
    data_zamowienia    DATE NOT NULL ,
    wartosc_zamowienia NUMBER (10,2) NOT NULL ,
    status_zamowienia  VARCHAR2 (10) NOT NULL ,
    numer_pracownika   NUMBER (10) NOT NULL
  ) ;
ALTER TABLE BUTY_ZAMOWIENIE ADD CONSTRAINT BUTY_ZAMOWIENIE_PK PRIMARY KEY ( nr_zamowienia ) ;


DROP SEQUENCE BUTY_ZAMOWIENIE_SEQ;
CREATE SEQUENCE BUTY_ZAMOWIENIE_SEQ
 START WITH     543
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;


DROP TABLE BUTY_ZAMOWIENIE_SZCZEGOLY;


CREATE TABLE BUTY_ZAMOWIENIE_SZCZEGOLY
  (
    nr_zamowienia      NUMBER NOT NULL ,
    pozycja_zamowienia NUMBER NOT NULL ,
    numer_produktu     NUMBER NOT NULL ,
    cena_zakupu        NUMBER (8,2) NOT NULL ,
    ilosc_zakupiona    NUMBER (10) NOT NULL ,
    wartosc_pozycji    NUMBER (10,2) NOT NULL
  ) ;
ALTER TABLE BUTY_ZAMOWIENIE_SZCZEGOLY ADD CONSTRAINT BUTY_ZAMOWIENIE_SZCZEGOLY_PK PRIMARY KEY ( pozycja_zamowienia, nr_zamowienia ) ;


DROP SEQUENCE BUTY_ZAMOWIENIE_SZCZEGOLY_SEQ;
CREATE SEQUENCE BUTY_ZAMOWIENIE_SZCZEGOLY_SEQ
 START WITH     567
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

ALTER TABLE BUTY_ZAMOWIENIE ADD CONSTRAINT BUTY_KLIENT_FK FOREIGN KEY ( numer_klienta ) REFERENCES BUTY_KLIENT ( numer_klienta ) ;

ALTER TABLE BUTY_ZAMOWIENIE ADD CONSTRAINT BUTY_PRACOWNIK_FK FOREIGN KEY ( numer_pracownika ) REFERENCES BUTY_PRACOWNIK ( numer_pracownika ) ;

ALTER TABLE BUTY_ZAMOWIENIE_SZCZEGOLY ADD CONSTRAINT BUTY_PRODUKT_FK FOREIGN KEY ( numer_produktu ) REFERENCES BUTY_PRODUKT ( numer_produktu ) ;

ALTER TABLE BUTY_PRODUKT ADD CONSTRAINT BUTY_RODZAJ_PRODUKTU_FK FOREIGN KEY ( rodzaj_produktu ) REFERENCES BUTY_RODZAJ_PRODUKTU ( rodzaj_produktu ) ;

ALTER TABLE BUTY_ZAMOWIENIE_SZCZEGOLY ADD CONSTRAINT BUTY_ZAMOWIENIE_FK FOREIGN KEY ( nr_zamowienia ) REFERENCES BUTY_ZAMOWIENIE ( nr_zamowienia ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0