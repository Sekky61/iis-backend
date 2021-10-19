---------------------------------------------------------
-- Projekt - ISS -- Aukce: prodej a nákup zboží a majetku prostřednictvím dražby
---------------------------------------------------------

------- CLEAR TABLES -------  
DROP INDEX IF EXISTS "IDX_session_expire";

DROP TABLE IF EXISTS "Prihoz";
DROP TABLE IF EXISTS "Aukce";
DROP TABLE IF EXISTS "Objekt";
DROP TABLE IF EXISTS "Licitator";
DROP TABLE IF EXISTS "Zakaznik";
DROP TABLE IF EXISTS "Osoba";
DROP TABLE IF EXISTS "Session";



--------------------------------------     CREATING TABLES      ----------------------------------------

CREATE TABLE "Osoba"(
  "IDUzivatele" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "Jmeno" VARCHAR(32) NOT NULL,
  "Prijmeni" VARCHAR(32) NOT NULL,
  "StavKonta" INTEGER,
  "DatumNarozeni" DATE NOT NULL,
  "Bydliste" VARCHAR(100) NOT NULL,
  "TelCislo" INTEGER NOT NULL,
  "Email" VARCHAR(32) NOT NULL 
);

CREATE TABLE "Zakaznik"(
  "IDZakaznika" INT NOT NULL,

  CONSTRAINT "ZakaznikFK" FOREIGN KEY("IDZakaznika") REFERENCES "Osoba" ("IDUzivatele") ON DELETE CASCADE
);

CREATE TABLE "Licitator"(
  "RodneCislo" INTEGER NOT NULL,
  "IDLicitator" INT NOT NULL,

  CONSTRAINT "LicitatorFK" FOREIGN KEY("IDLicitator") REFERENCES "Osoba" ("IDUzivatele") ON DELETE CASCADE
);

CREATE TABLE "Objekt"(
  "IDobjektu" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "Adresa" VARCHAR(100) NOT NULL,
  "DatumStavby" DATE NOT NULL,
  "Stav" VARCHAR(20) NOT NULL,
  "OdhadovanaCena" INTEGER
);

CREATE TABLE "Aukce"(
  "CisloAukce" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "Datum" DATE NOT NULL,
  "Nazev"  VARCHAR(100) NOT NULL,
  "VyvolavaciCena" INTEGER,
  "MinPrihoz" INTEGER NOT NULL,
  "Licitator" INT NOT NULL,
  "Autor" INT NOT NULL,
  "IDobject" INT NOT NULL,

  CONSTRAINT "LicitatorFK" FOREIGN KEY("Licitator") REFERENCES "Osoba" ("IDUzivatele") ON DELETE SET NULL,
  CONSTRAINT "AutorFK" FOREIGN KEY("Autor") REFERENCES "Osoba" ("IDUzivatele") ON DELETE SET NULL,
  CONSTRAINT "IDObjectFK" FOREIGN KEY("IDobject") REFERENCES "Objekt" ("IDobjektu") ON DELETE SET NULL

);

CREATE TABLE "Prihoz"(
    "Zakaznik" INT NOT NULL,
    "Licitator" INT NOT NULL,
    "IDaukce" INT NOT NULL,

    CONSTRAINT "AukceFK" FOREIGN KEY("IDaukce") REFERENCES "Aukce" ("CisloAukce") ON DELETE SET NULL,
    CONSTRAINT "PrihodilFK" FOREIGN KEY("Zakaznik") REFERENCES "Osoba" ("IDUzivatele") ON DELETE SET NULL,
    CONSTRAINT "ZaznamenalFK" FOREIGN KEY("Licitator") REFERENCES "Osoba" ("IDUzivatele") ON DELETE SET NULL
);

--------------------------------------     SESSION TABLE      ----------------------------------------

CREATE TABLE "Session"(
  "sid" varchar NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" timestamp(6) NOT NULL,
  "uid" INT,

  CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE
);

-- todo if exists
--ALTER TABLE "Session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;

CREATE INDEX "IDX_session_expire" ON "Session" ("expire");
