---------------------------------------------------------
-- Projekt - ISS -- Aukce: prodej a nákup zboží a majetku prostřednictvím dražby
---------------------------------------------------------

------- CLEAR INDEXES -------  

DROP INDEX IF EXISTS IDX_session_expire;
ALTER TABLE web_session DROP CONSTRAINT IF EXISTS web_session_pkey;

DROP INDEX IF EXISTS uzivatel_uid_idx;
DROP INDEX IF EXISTS uzivatel_username_idx;

DROP FUNCTION IF EXISTS get_auction_status;

------- CLEAR TABLES -------  

DROP TABLE IF EXISTS aukce_tag;
DROP TABLE IF EXISTS tag;

DROP TABLE IF EXISTS prihoz; --CASCADE
DROP TABLE IF EXISTS ucastnik;
DROP TABLE IF EXISTS aukce;
DROP TABLE IF EXISTS uzivatel;
DROP TABLE IF EXISTS web_session;
DROP TABLE IF EXISTS objekt;

-- clear old tables
DROP TABLE IF EXISTS licitator;
DROP TABLE IF EXISTS osoba CASCADE;
DROP TABLE IF EXISTS zakaznik CASCADE;


------- TYPES ------- 
DROP TYPE IF EXISTS PravidloAukce;
DROP TYPE IF EXISTS TypAukce;
DROP TYPE IF EXISTS StavAukce; 
DROP TYPE IF EXISTS TypUctu;

CREATE TYPE PravidloAukce AS ENUM ('uzavrena', 'otevrena');
CREATE TYPE TypAukce AS ENUM ('nabidkova', 'poptavkova');
--CREATE TYPE UzivatelSchvalen AS ENUM ('neschvalen', 'schvalen', 'zamitnut');
CREATE TYPE StavAukce AS ENUM ('neschvalena', 'schvalena', 'probihajici', 'ukoncena', 'vyhodnocena', 'zamitnuta');
CREATE TYPE TypUctu AS ENUM ('admin', 'licitator', 'uzivatel');

-- ID sequences - know type of ID at first glance + no conflict with seeded demo values

DROP SEQUENCE IF EXISTS user_seq;
DROP SEQUENCE IF EXISTS auction_seq;
DROP SEQUENCE IF EXISTS tag_seq;
DROP SEQUENCE IF EXISTS object_seq;

CREATE SEQUENCE user_seq START 1000;
CREATE SEQUENCE auction_seq START 2000;
CREATE SEQUENCE tag_seq START 3000;
CREATE SEQUENCE object_seq START 4000;

--------------------------------------     CREATING TABLES      ----------------------------------------

CREATE TABLE uzivatel(
  id INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('user_seq'),
  Username VARCHAR(32) NOT NULL UNIQUE,
  Heslo VARCHAR(64) NOT NULL,
  Jmeno VARCHAR(32) NOT NULL,
  Prijmeni VARCHAR(32) NOT NULL,
  Email VARCHAR(64) NOT NULL,
  Typ TypUctu NOT NULL
);

CREATE UNIQUE INDEX uzivatel_uid_idx ON uzivatel (id);
CREATE UNIQUE INDEX uzivatel_username_idx ON uzivatel (Username);

CREATE TABLE objekt(
  IDobjektu INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('object_seq'),
  Nazev VARCHAR(64) NOT NULL,
  Adresa VARCHAR(100) NOT NULL,
  Popis VARCHAR(500) NOT NULL,
  foto_url VARCHAR(128)
);

CREATE TABLE aukce(
  CisloAukce INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('auction_seq'),
  Nazev  VARCHAR(100) NOT NULL,

  objekt INT DEFAULT NULL,

  VyvolavaciCena INTEGER NOT NULL, -- todo zrusit?
  Cena INTEGER, -- nenormalizovano, lepsi nez prohledavat vsechny prihozy
  MinPrihoz INTEGER NOT NULL,
  
  Licitator INT,
  Autor INT NOT NULL,

  Pravidlo PravidloAukce NOT NULL,
  Typ TypAukce NOT NULL,
  MinPocetUcastniku INT DEFAULT 1,

  Stav StavAukce NOT NULL,
  DelkaAukce INTERVAL DEFAULT '1 week',

  ZacatekAukce TIMESTAMP,
  KonecAukce TIMESTAMP,

  Vitez INT DEFAULT NULL,

  CONSTRAINT VitezFK FOREIGN KEY(Vitez) REFERENCES uzivatel (id) ON DELETE CASCADE,
  CONSTRAINT LicitatorFK FOREIGN KEY(Licitator) REFERENCES uzivatel (id) ON DELETE CASCADE,
  CONSTRAINT AutorFK FOREIGN KEY(Autor) REFERENCES uzivatel (id) ON DELETE CASCADE,
  CONSTRAINT ObjektFK FOREIGN KEY(objekt) REFERENCES objekt (IDobjektu) ON DELETE CASCADE
);

CREATE TABLE tag(
  IDTag INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('tag_seq'),
  nazev VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE aukce_tag(
  IDaukce INT NOT NULL,
  IDTag INT NOT NULL,

  UNIQUE (IDaukce, IDTag), -- dvojce je unikatni

  CONSTRAINT IDAukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE CASCADE,
  CONSTRAINT IDTagFK FOREIGN KEY(IDTag) REFERENCES tag (IDTag) ON DELETE CASCADE
);

CREATE TABLE ucastnik(
  IDaukce INT NOT NULL,
  IDUzivatele INT NOT NULL,
  Schvalen BOOLEAN DEFAULT FALSE,

  UNIQUE (IDaukce, IDUzivatele), -- dvojce je unikatni

  CONSTRAINT IDAukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE CASCADE,
  CONSTRAINT IDUcastnikFK FOREIGN KEY(IDUzivatele) REFERENCES uzivatel (id) ON DELETE CASCADE
);

CREATE TABLE prihoz(
    Ucastnik INT NOT NULL,
    IDaukce INT NOT NULL,
    Castka INT NOT NULL,

    objekt INT DEFAULT NULL, -- poptavkova aukce má příhozy s nabízenými objekty

    CONSTRAINT AukceFK FOREIGN KEY(IDaukce) REFERENCES aukce (CisloAukce) ON DELETE CASCADE,
    CONSTRAINT PrihodilFK FOREIGN KEY(Ucastnik) REFERENCES uzivatel (id) ON DELETE CASCADE,
    CONSTRAINT ObjektFK FOREIGN KEY(objekt) REFERENCES objekt (IDobjektu) ON DELETE CASCADE
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

--------------------------------------     FUNCTIONS      ----------------------------------------

-- todo test and integrate
CREATE OR REPLACE FUNCTION public.can_join(IN user_id integer, IN auction_id integer)
    RETURNS BOOLEAN
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
DECLARE

BEGIN

RETURN (SELECT NOT EXISTS (SELECT * FROM ucastnik WHERE IDUzivatele = user_id AND IDaukce = auction_id) 
        AND NOT EXISTS (SELECT * FROM aukce WHERE CisloAukce = auction_id AND (Licitator = user_id OR Autor = user_id))
        AND (get_auction_status(auction_id) = 'schvalena' OR get_auction_status(auction_id) = 'probihajici'));

END;
$BODY$;

CREATE OR REPLACE FUNCTION public.get_username(IN user_id integer)
    RETURNS VARCHAR(32)
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
DECLARE

BEGIN

RETURN (SELECT Username from uzivatel WHERE id = user_id);

END;
$BODY$;

CREATE OR REPLACE FUNCTION public.tag_name_get_id(IN name VARCHAR(30))
    RETURNS INT
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
DECLARE

BEGIN

RETURN (SELECT IDTag from tag WHERE nazev = name);

END;
$BODY$;

DROP FUNCTION IF EXISTS number_of_checked_participants(integer);
CREATE OR REPLACE FUNCTION public.number_of_checked_participants(IN auction_id integer)
    RETURNS INT
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
DECLARE

BEGIN

RETURN (SELECT COUNT(*) from ucastnik WHERE IDaukce = auction_id AND Schvalen = TRUE);

END;
$BODY$;

CREATE OR REPLACE FUNCTION public.get_auction_status(IN id_aukce integer)
    RETURNS stavaukce
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
DECLARE
stav_var stavaukce;
end_var timestamp;
BEGIN

stav_var := (SELECT aukce.stav from aukce where aukce.CisloAukce = id_aukce);
IF stav_var = 'neschvalena' OR stav_var = 'zamitnuta' OR stav_var = 'schvalena' OR stav_var = 'vyhodnocena' OR stav_var = 'ukoncena' THEN
    RETURN stav_var;
END IF;
IF stav_var = 'probihajici' THEN
    end_var := (SELECT aukce.KonecAukce from aukce where aukce.CisloAukce = id_aukce);
    IF end_var > NOW() THEN
        RETURN 'probihajici';
    ELSE
        RETURN 'ukoncena';
    END IF;
END IF;
RETURN 'ukoncena';
END;
$BODY$;
