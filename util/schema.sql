---------------------------------------------------------
-- Projekt - ISS -- Aukce: prodej a nákup zboží a majetku prostřednictvím dražby
---------------------------------------------------------

------- CLEAR INDEXES -------  

DROP INDEX IF EXISTS IDX_session_expire;
ALTER TABLE web_session DROP CONSTRAINT IF EXISTS web_session_pkey;

DROP INDEX IF EXISTS uzivatel_uid_idx;
DROP INDEX IF EXISTS uzivatel_username_idx;

------- CLEAR TABLES -------  

DROP TABLE IF EXISTS aukce_tag;
DROP TABLE IF EXISTS tag;

DROP TABLE IF EXISTS prihoz; --CASCADE
DROP TABLE IF EXISTS ucastnik;
DROP TABLE IF EXISTS objekt;
DROP TABLE IF EXISTS aukce;
DROP TABLE IF EXISTS licitator;
DROP TABLE IF EXISTS uzivatel;
DROP TABLE IF EXISTS web_session;

DROP TABLE IF EXISTS osoba CASCADE; -- mazani stare verze
DROP TABLE IF EXISTS zakaznik CASCADE; -- mazani stare verze


------- TYPES ------- 
DROP TYPE IF EXISTS PravidloAukce;
DROP TYPE IF EXISTS TypAukce;
DROP TYPE IF EXISTS StavAukce; 
DROP TYPE IF EXISTS TypUctu;

CREATE TYPE PravidloAukce AS ENUM ('uzavrena', 'otevrena');
CREATE TYPE TypAukce AS ENUM ('nabidkova', 'poptavkova');
CREATE TYPE StavAukce AS ENUM ('neschvalena', 'schvalena', 'probihajici', 'ukoncena', 'zamitnuta');
CREATE TYPE TypUctu AS ENUM ('admin', 'licitator', 'uzivatel');

--------------------------------------     CREATING TABLES      ----------------------------------------

CREATE TABLE uzivatel(
  IDUzivatele INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Username VARCHAR(32) NOT NULL UNIQUE,
  Heslo VARCHAR(64) NOT NULL,
  Jmeno VARCHAR(32) NOT NULL,
  Prijmeni VARCHAR(32) NOT NULL,
  Email VARCHAR(32) NOT NULL,
  Typ TypUctu NOT NULL
);

CREATE UNIQUE INDEX uzivatel_uid_idx ON uzivatel (IDUzivatele);
CREATE UNIQUE INDEX uzivatel_username_idx ON uzivatel (Username);

-- todo delete? not needed right now
CREATE TABLE licitator(
  IDLicitator INT NOT NULL PRIMARY KEY,
  -- more fields specific to this role

  CONSTRAINT LicitatorFK FOREIGN KEY(IDLicitator) REFERENCES uzivatel (IDUzivatele) ON DELETE CASCADE
);

CREATE TABLE aukce(
  CisloAukce INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  Nazev  VARCHAR(100) NOT NULL,
  VyvolavaciCena INTEGER NOT NULL,
  MinPrihoz INTEGER NOT NULL,
  Licitator INT,
  Autor INT NOT NULL,
  IDobject INT NOT NULL,

  Pravidlo PravidloAukce NOT NULL,
  Typ TypAukce NOT NULL,
  MinPocetUcastniku INT DEFAULT 1,

  Stav StavAukce NOT NULL,
  ZacatekAukce TIMESTAMP,
  KonecAukce TIMESTAMP,

  ProdejniCena INT, -- todo decimal

  CONSTRAINT LicitatorFK FOREIGN KEY(Licitator) REFERENCES uzivatel (IDUzivatele) ON DELETE SET NULL,
  CONSTRAINT AutorFK FOREIGN KEY(Autor) REFERENCES uzivatel (IDUzivatele) ON DELETE SET NULL

);

CREATE TABLE tag(
  IDTag INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  nazev VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE aukce_tag(
  IDaukce INT NOT NULL,
  IDTag INT NOT NULL,

  UNIQUE (IDaukce, IDTag), -- dvojce je unikatni

  CONSTRAINT IDAukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE SET NULL,
  CONSTRAINT IDTagFK FOREIGN KEY(IDTag) REFERENCES tag (IDTag) ON DELETE SET NULL
);

CREATE TABLE ucastnik(
  IDaukce INT NOT NULL,
  IDUzivatele INT NOT NULL,
  Schvalen BOOLEAN DEFAULT FALSE,

  UNIQUE (IDaukce, IDUzivatele), -- dvojce je unikatni

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

  CONSTRAINT web_session_pkey PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE
);

CREATE INDEX IDX_session_expire ON web_session ("expire");
