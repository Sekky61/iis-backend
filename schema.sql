---------------------------------------------------------
-- Projekt - ISS -- Aukce: prodej a nákup zboží a majetku prostřednictvím dražby
---------------------------------------------------------

------- TYPES ------- 
DROP TYPE IF EXISTS PravidloAukce;
DROP TYPE IF EXISTS TypAukce;
DROP TYPE IF EXISTS TypUctu;

CREATE TYPE PravidloAukce AS ENUM ('uzavrena', 'otevrena');
CREATE TYPE TypAukce AS ENUM ('nabidkova', 'poptavkova');
CREATE TYPE TypUctu AS ENUM ('admin', 'licitator', 'uzivatel');

------- CLEAR TABLES -------  
DROP INDEX IF EXISTS IDX_session_expire;
DROP CONSTRAINT IF EXISTS web_session_pkey;

DROP TABLE IF EXISTS prihoz;
DROP TABLE IF EXISTS aukce;
DROP TABLE IF EXISTS objekt;
DROP TABLE IF EXISTS licitator;
DROP TABLE IF EXISTS uzivatel;
DROP TABLE IF EXISTS web_session;

DROP TABLE IF EXISTS osoba;

--------------------------------------     CREATING TABLES      ----------------------------------------

CREATE TABLE uzivatel(
  IDUzivatele INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Username VARCHAR(32) NOT NULL,
  Heslo VARCHAR(64) NOT NULL,
  Jmeno VARCHAR(32) NOT NULL,
  Prijmeni VARCHAR(32) NOT NULL,
  Email VARCHAR(32) NOT NULL,
  Typ TypUctu NOT NULL
);

CREATE TABLE licitator(
  IDLicitator INT NOT NULL,
  -- more fields specific to this role

  CONSTRAINT LicitatorFK FOREIGN KEY(IDLicitator) REFERENCES uzivatel (IDUzivatele) ON DELETE CASCADE
);

CREATE TABLE ucastnik(
  IDaukce INT NOT NULL,
  IDUzivatele INT NOT NULL,

  CONSTRAINT IDAukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE SET NULL,
  CONSTRAINT IDUcastnikFK FOREIGN KEY(IDUzivatele) REFERENCES uzivatel (IDUzivatele) ON DELETE SET NULL
);

CREATE TABLE objekt(
  IDobjektu INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Adresa VARCHAR(100) NOT NULL,
  Popis VARCHAR(500) NOT NULL,
  Stav VARCHAR(20) NOT NULL,
  IDaukce INT NOT NULL,

  CONSTRAINT IDObjectFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE SET NULL
);

CREATE TABLE aukce(
  CisloAukce INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Datum DATE NOT NULL,
  Nazev  VARCHAR(100) NOT NULL,
  VyvolavaciCena INTEGER NOT NULL,
  MinPrihoz INTEGER NOT NULL,
  Licitator INT NOT NULL,
  Autor INT NOT NULL,
  IDobject INT NOT NULL,
  Pravidlo PravidloAukce NOT NULL,
  Typ TypAukce NOT NULL,

  CONSTRAINT LicitatorFK FOREIGN KEY(Licitator) REFERENCES licitator (IDLicitator) ON DELETE SET NULL,
  CONSTRAINT AutorFK FOREIGN KEY(Autor) REFERENCES uzivatel (IDUzivatele) ON DELETE SET NULL

);

-- todo tabulka ucastnici aukce

CREATE TABLE prihoz(
    Ucastnik INT NOT NULL,
    IDaukce INT NOT NULL,
    Castka INT NOT NULL,

    CONSTRAINT AukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE SET NULL,
    CONSTRAINT PrihodilFK FOREIGN KEY(Ucastnik) REFERENCES uzivatel (IDUzivatele) ON DELETE SET NULL
);

--------------------------------------     SESSION TABLE      ----------------------------------------

CREATE TABLE web_session(
  -- uvozovky -- case sensitive klicova slova
  "sid" varchar NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" timestamp(6) NOT NULL,
  "uid" INT,

  CONSTRAINT web_session_pkey PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE
);

CREATE INDEX IDX_session_expire ON web_session ("expire");
