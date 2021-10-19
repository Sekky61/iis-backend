---------------------------------------------------------
-- Projekt - ISS -- Aukce: prodej a nákup zboží a majetku prostřednictvím dražby
---------------------------------------------------------

------- CLEAR TABLES -------  
DROP INDEX IF EXISTS IDX_session_expire;
DROP CONSTRAINT IF EXISTS web_session_pkey;

DROP TABLE IF EXISTS prihoz;
DROP TABLE IF EXISTS aukce;
DROP TABLE IF EXISTS objekt;
DROP TABLE IF EXISTS licitator;
DROP TABLE IF EXISTS zakaznik;
DROP TABLE IF EXISTS osoba;
DROP TABLE IF EXISTS web_session;

--------------------------------------     CREATING TABLES      ----------------------------------------

CREATE TABLE osoba(
  IDUzivatele INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Username VARCHAR(32) NOT NULL,
  Heslo VARCHAR(32) NOT NULL,
  Jmeno VARCHAR(32) NOT NULL,
  Prijmeni VARCHAR(32) NOT NULL,
  StavKonta INTEGER,
  DatumNarozeni DATE NOT NULL,
  Bydliste VARCHAR(100) NOT NULL,
  TelCislo INTEGER NOT NULL,
  Email VARCHAR(32) NOT NULL,
  Typ INTEGER NOT NULL
);

CREATE TABLE zakaznik(
  IDZakaznika INT NOT NULL,
  -- more fields specific to this role

  CONSTRAINT ZakaznikFK FOREIGN KEY(IDZakaznika) REFERENCES osoba (IDUzivatele) ON DELETE CASCADE
);

CREATE TABLE licitator(
  "IDLicitator" INT NOT NULL,
  -- more fields specific to this role

  CONSTRAINT LicitatorFK FOREIGN KEY(IDLicitator) REFERENCES osoba (IDUzivatele) ON DELETE CASCADE
);

CREATE TABLE objekt(
  IDobjektu INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Adresa VARCHAR(100) NOT NULL,
  DatumStavby DATE NOT NULL,
  Stav VARCHAR(20) NOT NULL,
  OdhadovanaCena INTEGER
);

CREATE TABLE aukce(
  CisloAukce INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Datum DATE NOT NULL,
  Nazev  VARCHAR(100) NOT NULL,
  VyvolavaciCena INTEGER,
  MinPrihoz INTEGER NOT NULL,
  Licitator INT NOT NULL,
  Autor INT NOT NULL,
  IDobject INT NOT NULL,

  CONSTRAINT LicitatorFK FOREIGN KEY(Licitator) REFERENCES osoba (IDUzivatele) ON DELETE SET NULL,
  CONSTRAINT AutorFK FOREIGN KEY(Autor) REFERENCES osoba (IDUzivatele) ON DELETE SET NULL,
  CONSTRAINT IDObjectFK FOREIGN KEY(IDobject) REFERENCES objekt (IDobjektu) ON DELETE SET NULL

);

CREATE TABLE prihoz(
    Zakaznik INT NOT NULL,
    Licitator INT NOT NULL,
    IDaukce INT NOT NULL,

    CONSTRAINT AukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE SET NULL,
    CONSTRAINT PrihodilFK FOREIGN KEY(Zakaznik) REFERENCES osoba (IDUzivatele) ON DELETE SET NULL,
    CONSTRAINT ZaznamenalFK FOREIGN KEY(Licitator) REFERENCES osoba (IDUzivatele) ON DELETE SET NULL
);

--------------------------------------     SESSION TABLE      ----------------------------------------

CREATE TABLE web_session(
  -- uvozovky -- klicova slova
  "sid" varchar NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" timestamp(6) NOT NULL,
  "uid" INT,

  CONSTRAINT web_session_pkey PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE
);

-- todo if exists
--ALTER TABLE "Session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;

CREATE INDEX IDX_session_expire ON web_session ("expire");
