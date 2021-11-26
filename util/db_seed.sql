--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

-- Started on 2021-11-26 22:12:33 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3055 (class 0 OID 53436)
-- Dependencies: 208
-- Data for Name: aukce; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.aukce VALUES (1, 'Rodinný dům, Praha', NULL, 7504000, 7504000, 20000, 106, 2, 'otevrena', 'poptavkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (2, 'Starý sklad 1500m^2', 2, 3000000, 3620000, 8500, 106, 3, 'otevrena', 'nabidkova', 5, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (3, 'Vyhořelá vila Černošice', 3, 57620000, 65200000, 16000, 106, 4, 'otevrena', 'nabidkova', 5, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (4, 'Kancelářské prostory', 4, 2000000, 3500000, 150000, 108, 10, 'otevrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-21 01:09:30', '2021-12-30 01:09:30', NULL);
INSERT INTO public.aukce VALUES (5, 'Horská chata', 5, 7700000, 8000000, 100000, 107, 11, 'otevrena', 'nabidkova', 1, 'probihajici', NULL, '2021-11-10 01:16:30', '2021-12-30 01:16:30', NULL);
INSERT INTO public.aukce VALUES (6, 'Byt 3+kk', NULL, 3484000, 5000000, 11000, 107, 12, 'uzavrena', 'poptavkova', 1, 'schvalena', NULL, '2021-10-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (7, 'Rodinný dům, Brno', 7, 12000000, 1500000, 8000, 106, 13, 'otevrena', 'nabidkova', 3, 'probihajici', NULL, '2021-10-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (8, 'Pozemek 560m^2', NULL, 938000, 938000, 17000, NULL, 14, 'otevrena', 'poptavkova', 4, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (9, 'Vila na kraji města', 9, 4450000, 4450000, 95000, 107, 15, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (10, 'Prodej komerčního prostoru', 10, 10184000, 5360000, 17000, 108, 16, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (11, 'Prodej domu na klíč', NULL, 5494000, 8174000, 12000, 106, 17, 'otevrena', 'poptavkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (12, 'Prodej garáže', 12, 9648000, 3216000, 13000, 108, 18, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (13, 'Prodej pole 5000m^2', NULL, 1206000, 8844000, 5000, 108, 19, 'uzavrena', 'poptavkova', 4, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (14, 'Prodávám byt v Ostravě', NULL, 850000, 850000, 10000, 108, 20, 'otevrena', 'nabidkova', 2, 'zamitnuta', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (15, 'Prodej domu na klíč', NULL, 5494000, 8174000, 12000, 107, 22, 'otevrena', 'poptavkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (16, 'Skladovací prostor', 16, 4824000, 7236000, 9000, 108, 23, 'uzavrena', 'nabidkova', 5, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (17, 'Kancelářský prostor', 17, 2412000, 10184000, 14000, NULL, 23, 'otevrena', 'nabidkova', 3, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (18, 'byt 5+kk', 18, 4824000, 6968000, 15000, 108, 24, 'otevrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (19, 'Sklad', NULL, 1206000, 6566000, 14000, NULL, 25, 'uzavrena', 'poptavkova', 5, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (20, 'Prodej části lesa', 20, 1340000, 938000, 13000, 108, 26, 'otevrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (21, 'Prodej bytu 3+1', 21, 6566000, 8308000, 5000, 107, 27, 'uzavrena', 'nabidkova', 1, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (22, 'Garáž', 22, 3752000, 10318000, 8000, NULL, 28, 'uzavrena', 'nabidkova', 4, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (23, 'RD, Plzeň', NULL, 9782000, 13618000, 9000, 106, 70, 'uzavrena', 'poptavkova', 2, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (24, 'Restaurace', 24, 4288000, 10050000, 8000, 9, 71, 'otevrena', 'nabidkova', 1, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (25, 'byt 1+kk', 25, 9916000, 9380000, 14000, NULL, 74, 'uzavrena', 'nabidkova', 1, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (26, 'byt 2+kk', 26, 7638000, 6432000, 19000, 106, 80, 'uzavrena', 'nabidkova', 5, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (27, 'Zámek', 27, 90000000, 150000000, 100000, 9, 81, 'uzavrena', 'nabidkova', 10, 'probihajici', NULL, '2021-09-01 04:08:48', '2021-09-08 04:08:48', NULL);
INSERT INTO public.aukce VALUES (28, 'LG televize', 28, 15000, 15000, 19000, 107, 83, 'otevrena', 'nabidkova', 1, 'zamitnuta', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (29, 'Rybníček za hubičku', 29, 150000, 150000, 5000, 108, 84, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (30, 'Krásná louka', 30, 500000, 900000, 5000, 106, 85, 'uzavrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-21 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (31, 'Zahradní domek', 31, 25000, 25000, 2000, 108, 86, 'uzavrena', 'nabidkova', 1, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (32, 'Dům pro developerské projekty', 32, 3500000, 3500000, 100000, 108, 87, 'otevrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (33, 'Studentský byt', 33, 900000, 900000, 10000, NULL, 88, 'otevrena', 'nabidkova', 1, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (34, 'Hospoda U Velké cedule', 34, 8000000, 8000000, 100000, 107, 92, 'otevrena', 'nabidkova', 4, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (35, 'Secondhand na ulici Palackého', 35, 2500000, 2500000, 80000, 108, 50, 'otevrena', 'nabidkova', 3, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (36, 'Půda po rekonstrukci', 36, 225000, 400000, 8000, 108, 51, 'otevrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-11-25 01:01:18', NULL);
INSERT INTO public.aukce VALUES (37, 'Zahrada se studnou', NULL, 450000, 1250000, 15000, 106, 111, 'otevrena', 'poptavkova', 3, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 01:01:18', NULL);


--
-- TOC entry 3057 (class 0 OID 53472)
-- Dependencies: 210
-- Data for Name: aukce_tag; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.aukce_tag VALUES (1, 2);
INSERT INTO public.aukce_tag VALUES (1, 22);
INSERT INTO public.aukce_tag VALUES (1, 26);
INSERT INTO public.aukce_tag VALUES (2, 43);
INSERT INTO public.aukce_tag VALUES (2, 5);
INSERT INTO public.aukce_tag VALUES (2, 60);
INSERT INTO public.aukce_tag VALUES (3, 2);
INSERT INTO public.aukce_tag VALUES (3, 36);
INSERT INTO public.aukce_tag VALUES (3, 26);
INSERT INTO public.aukce_tag VALUES (4, 47);
INSERT INTO public.aukce_tag VALUES (4, 5);
INSERT INTO public.aukce_tag VALUES (5, 53);
INSERT INTO public.aukce_tag VALUES (6, 1);
INSERT INTO public.aukce_tag VALUES (6, 10);
INSERT INTO public.aukce_tag VALUES (6, 57);
INSERT INTO public.aukce_tag VALUES (6, 33);
INSERT INTO public.aukce_tag VALUES (7, 2);
INSERT INTO public.aukce_tag VALUES (7, 20);
INSERT INTO public.aukce_tag VALUES (7, 27);
INSERT INTO public.aukce_tag VALUES (7, 37);
INSERT INTO public.aukce_tag VALUES (8, 4);
INSERT INTO public.aukce_tag VALUES (8, 60);
INSERT INTO public.aukce_tag VALUES (9, 2);
INSERT INTO public.aukce_tag VALUES (9, 36);
INSERT INTO public.aukce_tag VALUES (9, 23);
INSERT INTO public.aukce_tag VALUES (9, 24);
INSERT INTO public.aukce_tag VALUES (9, 16);
INSERT INTO public.aukce_tag VALUES (9, 35);
INSERT INTO public.aukce_tag VALUES (9, 32);
INSERT INTO public.aukce_tag VALUES (10, 5);
INSERT INTO public.aukce_tag VALUES (10, 60);
INSERT INTO public.aukce_tag VALUES (11, 2);
INSERT INTO public.aukce_tag VALUES (11, 17);
INSERT INTO public.aukce_tag VALUES (11, 28);
INSERT INTO public.aukce_tag VALUES (12, 32);
INSERT INTO public.aukce_tag VALUES (12, 56);
INSERT INTO public.aukce_tag VALUES (13, 39);
INSERT INTO public.aukce_tag VALUES (13, 4);
INSERT INTO public.aukce_tag VALUES (13, 60);
INSERT INTO public.aukce_tag VALUES (14, 1);
INSERT INTO public.aukce_tag VALUES (14, 12);
INSERT INTO public.aukce_tag VALUES (14, 58);
INSERT INTO public.aukce_tag VALUES (15, 2);
INSERT INTO public.aukce_tag VALUES (15, 18);
INSERT INTO public.aukce_tag VALUES (15, 29);
INSERT INTO public.aukce_tag VALUES (16, 43);
INSERT INTO public.aukce_tag VALUES (16, 60);
INSERT INTO public.aukce_tag VALUES (17, 47);
INSERT INTO public.aukce_tag VALUES (17, 4);
INSERT INTO public.aukce_tag VALUES (17, 58);
INSERT INTO public.aukce_tag VALUES (18, 1);
INSERT INTO public.aukce_tag VALUES (18, 33);
INSERT INTO public.aukce_tag VALUES (18, 36);
INSERT INTO public.aukce_tag VALUES (18, 14);
INSERT INTO public.aukce_tag VALUES (18, 23);
INSERT INTO public.aukce_tag VALUES (19, 43);
INSERT INTO public.aukce_tag VALUES (20, 41);
INSERT INTO public.aukce_tag VALUES (20, 4);
INSERT INTO public.aukce_tag VALUES (21, 1);
INSERT INTO public.aukce_tag VALUES (21, 11);
INSERT INTO public.aukce_tag VALUES (21, 28);
INSERT INTO public.aukce_tag VALUES (22, 32);
INSERT INTO public.aukce_tag VALUES (23, 2);
INSERT INTO public.aukce_tag VALUES (23, 32);
INSERT INTO public.aukce_tag VALUES (23, 13);
INSERT INTO public.aukce_tag VALUES (23, 24);
INSERT INTO public.aukce_tag VALUES (23, 33);
INSERT INTO public.aukce_tag VALUES (23, 36);
INSERT INTO public.aukce_tag VALUES (23, 35);
INSERT INTO public.aukce_tag VALUES (24, 44);
INSERT INTO public.aukce_tag VALUES (24, 5);
INSERT INTO public.aukce_tag VALUES (24, 60);
INSERT INTO public.aukce_tag VALUES (25, 1);
INSERT INTO public.aukce_tag VALUES (25, 6);
INSERT INTO public.aukce_tag VALUES (26, 1);
INSERT INTO public.aukce_tag VALUES (26, 8);
INSERT INTO public.aukce_tag VALUES (26, 29);
INSERT INTO public.aukce_tag VALUES (27, 54);
INSERT INTO public.aukce_tag VALUES (28, 31);
INSERT INTO public.aukce_tag VALUES (29, 4);
INSERT INTO public.aukce_tag VALUES (29, 42);
INSERT INTO public.aukce_tag VALUES (29, 60);
INSERT INTO public.aukce_tag VALUES (30, 4);
INSERT INTO public.aukce_tag VALUES (30, 40);
INSERT INTO public.aukce_tag VALUES (30, 60);
INSERT INTO public.aukce_tag VALUES (31, 3);
INSERT INTO public.aukce_tag VALUES (31, 30);
INSERT INTO public.aukce_tag VALUES (32, 2);
INSERT INTO public.aukce_tag VALUES (32, 25);
INSERT INTO public.aukce_tag VALUES (32, 32);
INSERT INTO public.aukce_tag VALUES (32, 1);
INSERT INTO public.aukce_tag VALUES (33, 6);
INSERT INTO public.aukce_tag VALUES (33, 33);
INSERT INTO public.aukce_tag VALUES (34, 5);
INSERT INTO public.aukce_tag VALUES (34, 44);
INSERT INTO public.aukce_tag VALUES (34, 59);
INSERT INTO public.aukce_tag VALUES (35, 5);
INSERT INTO public.aukce_tag VALUES (35, 59);
INSERT INTO public.aukce_tag VALUES (36, 49);
INSERT INTO public.aukce_tag VALUES (36, 28);
INSERT INTO public.aukce_tag VALUES (36, 57);
INSERT INTO public.aukce_tag VALUES (37, 3);
INSERT INTO public.aukce_tag VALUES (37, 30);
INSERT INTO public.aukce_tag VALUES (37, 31);
INSERT INTO public.aukce_tag VALUES (37, 59);
INSERT INTO public.aukce_tag VALUES (37, 36);
INSERT INTO public.aukce_tag VALUES (5, 420);
INSERT INTO public.aukce_tag VALUES (6, 420);


--
-- TOC entry 3054 (class 0 OID 53427)
-- Dependencies: 207
-- Data for Name: objekt; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.objekt VALUES (1, 'Rodinný dům, Praha', 'Hlavní 164, Praha 6', 'Krásný dům v klidné ulici', NULL);
INSERT INTO public.objekt VALUES (2, 'Starý sklad 1500m^2', 'Božetěchova 19, Brno Královo Pole', 'Sklad vhodný k rekonstrukci', NULL);
INSERT INTO public.objekt VALUES (3, 'Vyhořelá vila Černošice', 'Božetěchova 19, Brno Královo Pole', 'Vila je aktuálně zabezpečená a kvůli incidentům z minulosti, je každý den hlídána policií. Znalci v roce 2017 ohodnotili cenu vily na 97 290 000 Kč', NULL);
INSERT INTO public.objekt VALUES (4, 'Kancelářské prostory', 'Božetěchova 19, Brno Královo Pole', 'Kancelářský prostor v rámci Fakulty informačních tenchnologií', NULL);
INSERT INTO public.objekt VALUES (5, 'Horská chata', 'Božetěchova 19, Brno Královo Pole', 'Horská chata v přírodě na kraji Brna', NULL);
INSERT INTO public.objekt VALUES (6, 'Byt 3+kk', 'Božetěchova 19, Brno Královo Pole', 'Byt po rekonstrukci', NULL);
INSERT INTO public.objekt VALUES (7, 'Rodinný dům, Brno', 'Božetěchova 19, Brno Královo Polev', 'RD', NULL);
INSERT INTO public.objekt VALUES (8, 'Pozemek 560m^2', 'Božetěchova 19, Brno Královo Pole', 'Vhodný ke stavbě', NULL);
INSERT INTO public.objekt VALUES (9, 'Vila na kraji města', 'Božetěchova 19, Brno Královo Pole', 'Krásná prvorepubliková vila', NULL);
INSERT INTO public.objekt VALUES (10, 'Prodej komerčního prostoru', 'Božetěchova 19, Brno Královo Pole', 'Komerční prostor', NULL);
INSERT INTO public.objekt VALUES (11, 'Prodej domu na klíč', 'Božetěchova 19, Brno Královo Pole', 'Prodej projektu domu', NULL);
INSERT INTO public.objekt VALUES (12, 'Prodej garáže', 'Božetěchova 19, Brno Královo Pole', 'Prodej garáže velikost 3mx6,5m', NULL);
INSERT INTO public.objekt VALUES (13, 'Prodej pole 5000m^2', 'Božetěchova, Brno Královo Pole', 'Pole', NULL);
INSERT INTO public.objekt VALUES (14, 'Prodávám byt v Ostravě', 'Ostravská 20, Ostrava', 'Prodám dům v Ostravě na ulici Ostravská', NULL);
INSERT INTO public.objekt VALUES (15, 'Prodej domu na klíč', 'Božetěchova 19, Brno Královo Pole', 'Výstavba domu na místě bývalého kostela', NULL);
INSERT INTO public.objekt VALUES (16, 'Skladovací prostor', 'Božetěchova 19, Brno Královo Pole', 'Skladovací prostor s klimatizací a sociálním zařízením', NULL);
INSERT INTO public.objekt VALUES (17, 'Kancelářský prostor', 'Božetěchova 19, Brno Královo Pole', 'Kancelářský prostor v Brně', NULL);
INSERT INTO public.objekt VALUES (18, 'byt 5+kk', 'Božetěchova 29, Brno Královo Pole', 'byt v brně 5+kk', NULL);
INSERT INTO public.objekt VALUES (19, 'Sklad', 'Božetěchova 19, Brno Královo Pole', 'Sklad na ulici Božetěchova', NULL);
INSERT INTO public.objekt VALUES (20, 'Prodej části lesa', 'Božetěchova 19, Brno Královo Pole', 'Prodám les v Brně', NULL);
INSERT INTO public.objekt VALUES (21, 'Prodej bytu 3+1', 'Božetěchova 19, Brno Královo Pole', 'Byt na ulici Božetěchova', NULL);
INSERT INTO public.objekt VALUES (22, 'Garáž', 'Božetěchova 19, Brno Královo Pole', 'Garáž o rozměrech 5x7m', NULL);
INSERT INTO public.objekt VALUES (23, 'RD, Plzeň', 'Pivovarská 20, Plzeň', 'Prodám rodinný byt v Plzni.', NULL);
INSERT INTO public.objekt VALUES (24, 'Restaurace', 'Božetěchova 19, Brno Královo Pole', 'Prodám zavedenou restauraci v Brně.', NULL);
INSERT INTO public.objekt VALUES (25, 'byt 1+kk', 'Božetěchova 19, Brno Královo Pole', 'Byt 1+kk', NULL);
INSERT INTO public.objekt VALUES (26, 'byt 2+kk', 'Božetěchova 19, Brno Královo Pole', 'Byt k prodeji, první majitel', NULL);
INSERT INTO public.objekt VALUES (27, 'Zámek', '115 rue Reine Elisabeth, Francie,Lorraine', 'Prodám chȃteau na jihu Francie, spěchám', NULL);
INSERT INTO public.objekt VALUES (28, 'LG televize', 'Božetěchova 19, Brno Královo Pole', 'Nefunkkční televize značky LG', NULL);
INSERT INTO public.objekt VALUES (29, 'Rybníček za hubičku', 'Božetěchova 19, Brno Královo Pole', 'Prodám rybník v brně', NULL);
INSERT INTO public.objekt VALUES (30, 'Krásná louka', 'Božetěchova 19, Brno Královo Pole', 'Louka vedle Fakulty infromačních tenchologií', NULL);
INSERT INTO public.objekt VALUES (31, 'Zahradní domek', 'Božetěchova 19, Brno Královo Pole', 'Prodám zahradní domek na ulici Božetěchova', NULL);
INSERT INTO public.objekt VALUES (32, 'Dům pro developerské projekty', 'Božetěchova 19, Brno Královo Pole', 'Dům vhodný k dlouhodobé investici', NULL);
INSERT INTO public.objekt VALUES (33, 'Studentský byt', 'Božetěchova 19, Brno Královo Pole', 'Byt vhodný k pronajímání ', NULL);
INSERT INTO public.objekt VALUES (34, 'Hospoda U Velké cedule', 'Božetěchova 29, Brno Královo Pole', 'Velmi úspěšná restaurace, cedule v ceně', NULL);
INSERT INTO public.objekt VALUES (35, 'Secondhand na ulici Palackého', 'Palackého 19, Brno Královo Pole', 'Prodám second hand z rodinných důvodů.', NULL);
INSERT INTO public.objekt VALUES (36, 'Půda po rekonstrukci', 'Božetěchova 19, Brno Královo Pole', 'Zrekontruovaná půda, v nabídce i místnost ve sklepě.', NULL);
INSERT INTO public.objekt VALUES (37, 'Zahrada se studnou', 'Božetěchova 19, Brno Královo Pole', 'Zahrada se zdrojem pitné vody.', NULL);
INSERT INTO public.objekt VALUES (200, 'Malá zahrada', 'Božetěchova 19, Brno Královo Pole', 'Zahrada se zdrojem pitné vody.', NULL);
INSERT INTO public.objekt VALUES (201, 'Zahrada za městem', 'Božetěchova 19, Brno Královo Pole', 'Zahrada se zdrojem pitné vody.', NULL);
INSERT INTO public.objekt VALUES (202, 'Zahrada v kolonii', 'Božetěchova 19, Brno Královo Pole', 'Zahrada se zdrojem pitné vody a zahradním domkem.', NULL);
INSERT INTO public.objekt VALUES (203, 'Velká zahrada', 'Božetěchova 19, Brno Královo Pole', 'Zahrada s velkým záhonem', NULL);


--
-- TOC entry 3059 (class 0 OID 53503)
-- Dependencies: 212
-- Data for Name: prihoz; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.prihoz VALUES (110, 2, 3320000, NULL);
INSERT INTO public.prihoz VALUES (93, 2, 3425000, NULL);
INSERT INTO public.prihoz VALUES (94, 2, 3525000, NULL);
INSERT INTO public.prihoz VALUES (57, 2, 3600000, NULL);
INSERT INTO public.prihoz VALUES (40, 3, 57620000, NULL);
INSERT INTO public.prihoz VALUES (1, 3, 58620000, NULL);
INSERT INTO public.prihoz VALUES (40, 3, 59000000, NULL);
INSERT INTO public.prihoz VALUES (7, 3, 64000000, NULL);
INSERT INTO public.prihoz VALUES (40, 3, 6520000, NULL);
INSERT INTO public.prihoz VALUES (109, 4, 2500000, NULL);
INSERT INTO public.prihoz VALUES (91, 4, 3000000, NULL);
INSERT INTO public.prihoz VALUES (73, 4, 3200000, NULL);
INSERT INTO public.prihoz VALUES (57, 5, 7800000, NULL);
INSERT INTO public.prihoz VALUES (93, 5, 7900000, NULL);
INSERT INTO public.prihoz VALUES (94, 5, 8000000, NULL);
INSERT INTO public.prihoz VALUES (21, 7, 122000000, NULL);
INSERT INTO public.prihoz VALUES (60, 7, 13000000, NULL);
INSERT INTO public.prihoz VALUES (40, 7, 13100000, NULL);
INSERT INTO public.prihoz VALUES (21, 7, 14000000, NULL);
INSERT INTO public.prihoz VALUES (7, 7, 15000000, NULL);
INSERT INTO public.prihoz VALUES (5, 23, 9782000, NULL);
INSERT INTO public.prihoz VALUES (91, 23, 9882000, NULL);
INSERT INTO public.prihoz VALUES (8, 23, 10000000, NULL);
INSERT INTO public.prihoz VALUES (91, 23, 10100000, NULL);
INSERT INTO public.prihoz VALUES (73, 23, 11000000, NULL);
INSERT INTO public.prihoz VALUES (109, 23, 11500000, NULL);
INSERT INTO public.prihoz VALUES (91, 23, 12000000, NULL);
INSERT INTO public.prihoz VALUES (5, 23, 13500000, NULL);
INSERT INTO public.prihoz VALUES (8, 23, 13618000, NULL);
INSERT INTO public.prihoz VALUES (21, 27, 90000000, NULL);
INSERT INTO public.prihoz VALUES (7, 27, 95000000, NULL);
INSERT INTO public.prihoz VALUES (1, 27, 100000000, NULL);
INSERT INTO public.prihoz VALUES (40, 27, 101000000, NULL);
INSERT INTO public.prihoz VALUES (60, 27, 105000000, NULL);
INSERT INTO public.prihoz VALUES (21, 27, 110000000, NULL);
INSERT INTO public.prihoz VALUES (1, 27, 120000000, NULL);
INSERT INTO public.prihoz VALUES (7, 27, 125000000, NULL);
INSERT INTO public.prihoz VALUES (40, 27, 130000000, NULL);
INSERT INTO public.prihoz VALUES (1, 27, 140000000, NULL);
INSERT INTO public.prihoz VALUES (11, 27, 150000000, NULL);
INSERT INTO public.prihoz VALUES (5, 30, 500000, NULL);
INSERT INTO public.prihoz VALUES (109, 30, 550000, NULL);
INSERT INTO public.prihoz VALUES (91, 30, 550000, NULL);
INSERT INTO public.prihoz VALUES (8, 30, 560000, NULL);
INSERT INTO public.prihoz VALUES (73, 30, 600000, NULL);
INSERT INTO public.prihoz VALUES (109, 30, 700000, NULL);
INSERT INTO public.prihoz VALUES (8, 30, 750000, NULL);
INSERT INTO public.prihoz VALUES (5, 30, 800000, NULL);
INSERT INTO public.prihoz VALUES (8, 30, 900000, NULL);
INSERT INTO public.prihoz VALUES (110, 36, 240000, NULL);
INSERT INTO public.prihoz VALUES (93, 36, 270000, NULL);
INSERT INTO public.prihoz VALUES (57, 36, 290000, NULL);
INSERT INTO public.prihoz VALUES (33, 36, 305000, NULL);
INSERT INTO public.prihoz VALUES (94, 36, 350000, NULL);
INSERT INTO public.prihoz VALUES (110, 36, 380000, NULL);
INSERT INTO public.prihoz VALUES (33, 36, 400000, NULL);
INSERT INTO public.prihoz VALUES (60, 37, 500000, 200);
INSERT INTO public.prihoz VALUES (1, 37, 550000, 201);
INSERT INTO public.prihoz VALUES (40, 37, 570000, 202);
INSERT INTO public.prihoz VALUES (7, 37, 600000, 203);
INSERT INTO public.prihoz VALUES (21, 37, 630000, NULL);
INSERT INTO public.prihoz VALUES (7, 37, 700000, 203);
INSERT INTO public.prihoz VALUES (60, 37, 800000, 200);
INSERT INTO public.prihoz VALUES (40, 37, 850000, 202);
INSERT INTO public.prihoz VALUES (60, 37, 1000000, 200);
INSERT INTO public.prihoz VALUES (1, 37, 1200000, 201);


--
-- TOC entry 3056 (class 0 OID 53464)
-- Dependencies: 209
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.tag VALUES (1, 'Byt');
INSERT INTO public.tag VALUES (2, 'Dům');
INSERT INTO public.tag VALUES (3, 'Zahrada');
INSERT INTO public.tag VALUES (4, 'Pozemek');
INSERT INTO public.tag VALUES (5, 'Komerční');
INSERT INTO public.tag VALUES (6, '1+kk');
INSERT INTO public.tag VALUES (7, '1+1');
INSERT INTO public.tag VALUES (8, '2+kk');
INSERT INTO public.tag VALUES (9, '2+1');
INSERT INTO public.tag VALUES (10, '3+kk');
INSERT INTO public.tag VALUES (11, '3+1');
INSERT INTO public.tag VALUES (12, '4+kk');
INSERT INTO public.tag VALUES (13, '4+1');
INSERT INTO public.tag VALUES (14, '5+kk');
INSERT INTO public.tag VALUES (15, '5+1');
INSERT INTO public.tag VALUES (16, '6 a více');
INSERT INTO public.tag VALUES (17, '1 pokoj');
INSERT INTO public.tag VALUES (18, '2 pokoje');
INSERT INTO public.tag VALUES (19, '3 pokoje');
INSERT INTO public.tag VALUES (20, '4 pokoje');
INSERT INTO public.tag VALUES (21, '5 pokojů');
INSERT INTO public.tag VALUES (22, '6 pokojů');
INSERT INTO public.tag VALUES (23, 'Atypický');
INSERT INTO public.tag VALUES (24, 'Ve výstavbě');
INSERT INTO public.tag VALUES (25, 'Developerské projekty');
INSERT INTO public.tag VALUES (26, 'Novostavba');
INSERT INTO public.tag VALUES (27, 'K demolici');
INSERT INTO public.tag VALUES (28, 'Po rekonstrukci');
INSERT INTO public.tag VALUES (29, 'V rekonstrukci');
INSERT INTO public.tag VALUES (30, 'Zahradní domek');
INSERT INTO public.tag VALUES (31, 'Studna');
INSERT INTO public.tag VALUES (32, 'Garáž');
INSERT INTO public.tag VALUES (33, 'Balkon');
INSERT INTO public.tag VALUES (34, 'Parkování');
INSERT INTO public.tag VALUES (35, 'Výtah');
INSERT INTO public.tag VALUES (36, 'Sklep');
INSERT INTO public.tag VALUES (37, 'Bezbariérový');
INSERT INTO public.tag VALUES (38, 'Kolonie');
INSERT INTO public.tag VALUES (39, 'Pole');
INSERT INTO public.tag VALUES (40, 'Louka');
INSERT INTO public.tag VALUES (41, 'Les');
INSERT INTO public.tag VALUES (42, 'Rybník');
INSERT INTO public.tag VALUES (43, 'Sklad');
INSERT INTO public.tag VALUES (44, 'Restaurace');
INSERT INTO public.tag VALUES (45, 'Ubytování');
INSERT INTO public.tag VALUES (46, 'Prodejní prostor');
INSERT INTO public.tag VALUES (47, 'Kanceláře');
INSERT INTO public.tag VALUES (49, 'Půda');
INSERT INTO public.tag VALUES (53, 'Chata');
INSERT INTO public.tag VALUES (54, 'Zámek');
INSERT INTO public.tag VALUES (55, 'Hrad');
INSERT INTO public.tag VALUES (56, '<60m^2');
INSERT INTO public.tag VALUES (57, '60-80 m^2');
INSERT INTO public.tag VALUES (58, '80m^2 - 200m^2');
INSERT INTO public.tag VALUES (59, '200m^2 - 400m^2');
INSERT INTO public.tag VALUES (60, '> 400m^2');
INSERT INTO public.tag VALUES (61, 'Se zahradou');
INSERT INTO public.tag VALUES (62, 'S garáží');
INSERT INTO public.tag VALUES (420, 'AKČNÍ');


--
-- TOC entry 3058 (class 0 OID 53487)
-- Dependencies: 211
-- Data for Name: ucastnik; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.ucastnik VALUES (1, 109, true);
INSERT INTO public.ucastnik VALUES (1, 5, true);
INSERT INTO public.ucastnik VALUES (1, 8, true);
INSERT INTO public.ucastnik VALUES (1, 73, true);
INSERT INTO public.ucastnik VALUES (1, 91, true);
INSERT INTO public.ucastnik VALUES (2, 110, true);
INSERT INTO public.ucastnik VALUES (2, 93, true);
INSERT INTO public.ucastnik VALUES (2, 94, true);
INSERT INTO public.ucastnik VALUES (2, 57, true);
INSERT INTO public.ucastnik VALUES (2, 33, true);
INSERT INTO public.ucastnik VALUES (3, 40, true);
INSERT INTO public.ucastnik VALUES (3, 1, true);
INSERT INTO public.ucastnik VALUES (3, 7, true);
INSERT INTO public.ucastnik VALUES (3, 21, true);
INSERT INTO public.ucastnik VALUES (3, 60, true);
INSERT INTO public.ucastnik VALUES (4, 109, true);
INSERT INTO public.ucastnik VALUES (4, 5, true);
INSERT INTO public.ucastnik VALUES (4, 8, true);
INSERT INTO public.ucastnik VALUES (4, 73, true);
INSERT INTO public.ucastnik VALUES (4, 91, true);
INSERT INTO public.ucastnik VALUES (5, 109, true);
INSERT INTO public.ucastnik VALUES (5, 5, true);
INSERT INTO public.ucastnik VALUES (5, 8, true);
INSERT INTO public.ucastnik VALUES (5, 73, true);
INSERT INTO public.ucastnik VALUES (5, 91, true);
INSERT INTO public.ucastnik VALUES (6, 110, true);
INSERT INTO public.ucastnik VALUES (6, 93, true);
INSERT INTO public.ucastnik VALUES (6, 94, true);
INSERT INTO public.ucastnik VALUES (6, 57, true);
INSERT INTO public.ucastnik VALUES (6, 33, true);
INSERT INTO public.ucastnik VALUES (7, 40, true);
INSERT INTO public.ucastnik VALUES (7, 1, true);
INSERT INTO public.ucastnik VALUES (7, 7, true);
INSERT INTO public.ucastnik VALUES (7, 21, true);
INSERT INTO public.ucastnik VALUES (7, 60, true);
INSERT INTO public.ucastnik VALUES (9, 109, true);
INSERT INTO public.ucastnik VALUES (9, 5, true);
INSERT INTO public.ucastnik VALUES (9, 8, true);
INSERT INTO public.ucastnik VALUES (9, 73, true);
INSERT INTO public.ucastnik VALUES (9, 91, true);
INSERT INTO public.ucastnik VALUES (10, 109, true);
INSERT INTO public.ucastnik VALUES (10, 5, true);
INSERT INTO public.ucastnik VALUES (10, 8, true);
INSERT INTO public.ucastnik VALUES (10, 73, true);
INSERT INTO public.ucastnik VALUES (10, 91, true);
INSERT INTO public.ucastnik VALUES (11, 110, true);
INSERT INTO public.ucastnik VALUES (11, 93, true);
INSERT INTO public.ucastnik VALUES (11, 94, true);
INSERT INTO public.ucastnik VALUES (11, 57, true);
INSERT INTO public.ucastnik VALUES (11, 33, true);
INSERT INTO public.ucastnik VALUES (12, 40, true);
INSERT INTO public.ucastnik VALUES (12, 1, true);
INSERT INTO public.ucastnik VALUES (12, 7, true);
INSERT INTO public.ucastnik VALUES (12, 21, true);
INSERT INTO public.ucastnik VALUES (12, 60, true);
INSERT INTO public.ucastnik VALUES (13, 109, true);
INSERT INTO public.ucastnik VALUES (13, 5, true);
INSERT INTO public.ucastnik VALUES (13, 8, true);
INSERT INTO public.ucastnik VALUES (13, 73, true);
INSERT INTO public.ucastnik VALUES (13, 91, true);
INSERT INTO public.ucastnik VALUES (15, 109, true);
INSERT INTO public.ucastnik VALUES (15, 5, true);
INSERT INTO public.ucastnik VALUES (15, 8, true);
INSERT INTO public.ucastnik VALUES (15, 73, true);
INSERT INTO public.ucastnik VALUES (15, 91, true);
INSERT INTO public.ucastnik VALUES (16, 110, true);
INSERT INTO public.ucastnik VALUES (16, 93, true);
INSERT INTO public.ucastnik VALUES (16, 94, true);
INSERT INTO public.ucastnik VALUES (16, 57, true);
INSERT INTO public.ucastnik VALUES (16, 33, true);
INSERT INTO public.ucastnik VALUES (17, 40, true);
INSERT INTO public.ucastnik VALUES (17, 1, true);
INSERT INTO public.ucastnik VALUES (17, 7, true);
INSERT INTO public.ucastnik VALUES (17, 21, true);
INSERT INTO public.ucastnik VALUES (17, 60, true);
INSERT INTO public.ucastnik VALUES (18, 109, true);
INSERT INTO public.ucastnik VALUES (18, 5, true);
INSERT INTO public.ucastnik VALUES (18, 8, true);
INSERT INTO public.ucastnik VALUES (18, 73, true);
INSERT INTO public.ucastnik VALUES (18, 91, true);
INSERT INTO public.ucastnik VALUES (20, 110, true);
INSERT INTO public.ucastnik VALUES (20, 93, true);
INSERT INTO public.ucastnik VALUES (20, 94, true);
INSERT INTO public.ucastnik VALUES (20, 57, true);
INSERT INTO public.ucastnik VALUES (20, 33, true);
INSERT INTO public.ucastnik VALUES (21, 40, true);
INSERT INTO public.ucastnik VALUES (21, 1, true);
INSERT INTO public.ucastnik VALUES (21, 7, true);
INSERT INTO public.ucastnik VALUES (21, 21, true);
INSERT INTO public.ucastnik VALUES (21, 60, true);
INSERT INTO public.ucastnik VALUES (23, 109, true);
INSERT INTO public.ucastnik VALUES (23, 5, true);
INSERT INTO public.ucastnik VALUES (23, 8, true);
INSERT INTO public.ucastnik VALUES (23, 73, true);
INSERT INTO public.ucastnik VALUES (23, 91, true);
INSERT INTO public.ucastnik VALUES (24, 109, true);
INSERT INTO public.ucastnik VALUES (24, 5, true);
INSERT INTO public.ucastnik VALUES (24, 8, true);
INSERT INTO public.ucastnik VALUES (24, 73, true);
INSERT INTO public.ucastnik VALUES (24, 91, true);
INSERT INTO public.ucastnik VALUES (26, 110, true);
INSERT INTO public.ucastnik VALUES (26, 93, true);
INSERT INTO public.ucastnik VALUES (26, 94, true);
INSERT INTO public.ucastnik VALUES (26, 57, true);
INSERT INTO public.ucastnik VALUES (26, 33, true);
INSERT INTO public.ucastnik VALUES (27, 40, true);
INSERT INTO public.ucastnik VALUES (27, 1, true);
INSERT INTO public.ucastnik VALUES (27, 7, true);
INSERT INTO public.ucastnik VALUES (27, 21, true);
INSERT INTO public.ucastnik VALUES (27, 60, true);
INSERT INTO public.ucastnik VALUES (29, 109, true);
INSERT INTO public.ucastnik VALUES (29, 5, true);
INSERT INTO public.ucastnik VALUES (29, 8, true);
INSERT INTO public.ucastnik VALUES (29, 73, true);
INSERT INTO public.ucastnik VALUES (29, 91, true);
INSERT INTO public.ucastnik VALUES (30, 109, true);
INSERT INTO public.ucastnik VALUES (30, 5, true);
INSERT INTO public.ucastnik VALUES (30, 8, true);
INSERT INTO public.ucastnik VALUES (30, 73, true);
INSERT INTO public.ucastnik VALUES (30, 91, true);
INSERT INTO public.ucastnik VALUES (31, 110, true);
INSERT INTO public.ucastnik VALUES (31, 93, true);
INSERT INTO public.ucastnik VALUES (31, 94, true);
INSERT INTO public.ucastnik VALUES (31, 57, true);
INSERT INTO public.ucastnik VALUES (31, 33, true);
INSERT INTO public.ucastnik VALUES (32, 40, true);
INSERT INTO public.ucastnik VALUES (32, 1, true);
INSERT INTO public.ucastnik VALUES (32, 7, true);
INSERT INTO public.ucastnik VALUES (32, 21, true);
INSERT INTO public.ucastnik VALUES (32, 60, true);
INSERT INTO public.ucastnik VALUES (34, 109, true);
INSERT INTO public.ucastnik VALUES (34, 5, true);
INSERT INTO public.ucastnik VALUES (34, 8, true);
INSERT INTO public.ucastnik VALUES (34, 73, true);
INSERT INTO public.ucastnik VALUES (34, 91, true);
INSERT INTO public.ucastnik VALUES (35, 109, true);
INSERT INTO public.ucastnik VALUES (35, 5, true);
INSERT INTO public.ucastnik VALUES (35, 8, true);
INSERT INTO public.ucastnik VALUES (35, 73, true);
INSERT INTO public.ucastnik VALUES (35, 91, true);
INSERT INTO public.ucastnik VALUES (36, 110, true);
INSERT INTO public.ucastnik VALUES (36, 93, true);
INSERT INTO public.ucastnik VALUES (36, 94, true);
INSERT INTO public.ucastnik VALUES (36, 57, true);
INSERT INTO public.ucastnik VALUES (36, 33, true);
INSERT INTO public.ucastnik VALUES (37, 40, true);
INSERT INTO public.ucastnik VALUES (37, 1, true);
INSERT INTO public.ucastnik VALUES (37, 7, true);
INSERT INTO public.ucastnik VALUES (37, 21, true);
INSERT INTO public.ucastnik VALUES (37, 60, true);


--
-- TOC entry 3053 (class 0 OID 53417)
-- Dependencies: 206
-- Data for Name: uzivatel; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.uzivatel VALUES (1, 'lschutze0', '$2b$12$bomwuRdtCcpbmMG8AmQC1ugaYGBLzIzmM0CHKc5cQbs5U8KcYDCCm', 'Luella', 'Schutze', 'lschutze0@arizona.edu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (2, 'aemanulsson1', '$2b$12$70uaN2WoIco.2XIoVVIdHeSR3c092bkwqSST/.3hGn6eVugBSfRh2', 'Amy', 'Emanulsson', 'aemanulsson1@bravesites.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (3, 'tberresford2', '$2b$12$19fUEPXKBfX0X2IoKytJPOzUUwVfLWzHBtWt9/IEfiQxYR2m01FtC', 'Tedda', 'Berresford', 'tberresford2@cbslocal.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (4, 'mspurling3', '$2b$12$BLBlwgi42sEEaEvEDOmwLu.YpDwfRpAKC95yi4iS/XidogVcfVROC', 'Millie', 'Spurling', 'mspurling3@de.vu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (5, 'jleyland4', '$2b$12$cH6XbnJOTIC8L1aNJ6xQ0uTlKv3asgvhZDfrd1xnj6c0aRD24hCle', 'Jude', 'Leyland', 'jleyland4@telegraph.co.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (6, 'gbellham5', '$2b$12$e3/kHdUTQukLgveknJzMteaiMg61/VMM788E4PFD.ZqN9gsZoKqgS', 'Gavin', 'Bellham', 'gbellham5@tripadvisor.com', 'licitator');
INSERT INTO public.uzivatel VALUES (7, 'cgaythwaite6', '$2b$12$X3BxC73I/kRbyJknWjHM/ebR6gTebKemGeQ1dHViZhJnX1Ir0.k1u', 'Charyl', 'Gaythwaite', 'cgaythwaite6@miitbeian.gov.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (8, 'dbawcock7', '$2b$12$00Qwff4AwBsydE4dpu5yUe2VOYxsKGQzgEHYFuSCP0A54ifoBTRS.', 'Derick', 'Bawcock', 'dbawcock7@w3.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (9, 'gslowley8', '$2b$12$X.kip1gf6QDL2XyKdiwCquVj.wshOJzMvKUXxaUxughaLnos10scy', 'Giraldo', 'Slowley', 'gslowley8@linkedin.com', 'licitator');
INSERT INTO public.uzivatel VALUES (10, 'tcayser9', '$2b$12$2D4x.90W47WwgA52KM1a8ukUldS69ueuyNLBjERFYwfj.aGpKCaUC', 'Trent', 'Cayser', 'tcayser9@nymag.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (11, 'nmallana', '$2b$12$EvslKQtC1Ty0/TQjcAQbUe.9bSywebpFMDi2VoGVx8hzc1jtVufbi', 'Nicolle', 'Mallan', 'nmallana@tuttocitta.it', 'uzivatel');
INSERT INTO public.uzivatel VALUES (12, 'jblackmoorb', '$2b$12$JJL1Eq526Ey9MA5KmhaEwONOJVAgXtgZLuSddHlOGQ1unPHVsNgwq', 'Jarad', 'Blackmoor', 'jblackmoorb@technorati.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (13, 'aropkingc', '$2b$12$SEEdlx3EytKdQ6qyB0pK3eQg2BWVkYSvw/edkdY4MHFCIiOxJchZa', 'Avril', 'Ropking', 'aropkingc@ted.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (14, 'cbredgelandd', '$2b$12$JkOkZwyYnd/g58IaCi5eluqagP1QXk8I64k7E5XxzDrrAwLx8X.xu', 'Consolata', 'Bredgeland', 'cbredgelandd@statcounter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (15, 'mgavaghane', '$2b$12$NRyKZN72z6QUwkDxJTprrOYGcRFfvQoS7gvyRuPfFChL8ic17HjMu', 'Maryrose', 'Gavaghan', 'mgavaghane@vkontakte.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (16, 'chansfordf', '$2b$12$ysJxY9xa4UABa6q6DR6SIuPHIDuPbAmdYQCne/pR/ugAeELfb0Ks2', 'Corrianne', 'Hansford', 'chansfordf@ucoz.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (17, 'hrainsburyg', '$2b$12$oA./lZORwabjy2WH3Y6L0eQ67SoWV0Hu8y83FuyFckUDlGbjYi1Nu', 'Hendrick', 'Rainsbury', 'hrainsburyg@senate.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (18, 'ptrenearh', '$2b$12$IwmRwYrGltYj58tBt8M.7.JAvLmWY5gNhb3RWaSpdWXPjvDqELYN6', 'Priscilla', 'Trenear', 'ptrenearh@simplemachines.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (19, 'rstandleyi', '$2b$12$sxlrN.L/9OWlnz921D.w4OWnw1yOgoOZJvRu9tStZmmx6AzzhvE9O', 'Ruby', 'Standley', 'rstandleyi@webeden.co.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (20, 'kwaterdrinkerj', '$2b$12$q4c1yz0oiYhDAbgLqoN1iOasAef4H.EWhiLShsm1GoTdc0LWz1Dqm', 'Korey', 'Waterdrinker', 'kwaterdrinkerj@home.pl', 'uzivatel');
INSERT INTO public.uzivatel VALUES (21, 'skoppenk', '$2b$12$al7ZWMg.rArbbwh6EPQCjuN4Ry.hNCxDnpkStD5KAoa.h2omYRATG', 'Shandy', 'Koppen', 'skoppenk@plala.or.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (22, 'cshawell', '$2b$12$ZSDxAgJEm09Eew72s0Z1D.8mJItAPs3DE7T3jdxwXvB7fv8dPVwGq', 'Culley', 'Shawel', 'cshawell@sciencedaily.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (23, 'mskusem', '$2b$12$ov88RfaaG.aBdDV4l3pl3O.nyoHiA4CBUeUrXOXrKSqwvcZaWo3B6', 'Morna', 'Skuse', 'mskusem@vimeo.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (24, 'jpourvoieurn', '$2b$12$5ZkByuAKQuEAVFbE9EmDw.gUaxm4hy/wVV45Nj7KIGZEYr4t/E8hS', 'Jephthah', 'Pourvoieur', 'jpourvoieurn@sbwire.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (25, 'cgoneauo', '$2b$12$G1cxjf98xaI4Bom5MlHFTO7hg.gh9sotfTI2IGqAquzRlgoCFOLCu', 'Corette', 'Goneau', 'cgoneauo@rakuten.co.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (26, 'wportmanp', '$2b$12$/4ozYU9COvNezrZofOqr9ecyvN6960sf2F2TXRsBId1qO5MSfH0fC', 'Webster', 'Portman', 'wportmanp@cam.ac.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (27, 'dbrideq', '$2b$12$fcXeJ15k0DGjTz7PM5uZPeoqkStxrz1xwpvI8eNSusXWXoVzQ9FAa', 'Demetra', 'Bride', 'dbrideq@nifty.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (28, 'cburthomr', '$2b$12$AKCapYQlHYhM.Ag2JjrlLOT2nWHBBv1LyWlt011wgPZ/RN2058hdS', 'Chloe', 'Burthom', 'cburthomr@live.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (29, 'kblinmans', '$2b$12$.RepL27o46C.1ye5BgQIgOEqAc5f.Ss8d3bVz2GFTt3G9vmz6QlNW', 'Kristo', 'Blinman', 'kblinmans@nba.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (30, 'jeastwoodt', '$2b$12$yRytl8isFuYNDs0y.gqFaOqleV8EI9I4V9dXR39CMvP3N6IfuVKma', 'Jermaine', 'Eastwood', 'jeastwoodt@accuweather.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (31, 'ncaushu', '$2b$12$/qFdb9auSI2pFV0yPIEMOu/Cf1MQMmisszbaV3ujJtMHTziZhP01a', 'Natalee', 'Caush', 'ncaushu@illinois.edu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (32, 'mbrockelsbyv', '$2b$12$zHKaAvT5MH9KqhUoxA2fguDCsDwh7LLoAo.KPWsUMoWR03dPU1XL6', 'May', 'Brockelsby', 'mbrockelsbyv@edublogs.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (33, 'ipolsinw', '$2b$12$EgkriWIcl1OsjyUo9RQy/.kZTilB7xuLGtnvNQ9lWiX5BPaGUvteO', 'Imogene', 'Polsin', 'ipolsinw@ustream.tv', 'uzivatel');
INSERT INTO public.uzivatel VALUES (34, 'bbeelx', '$2b$12$/MAmNBYWEL/PUPFSg87.o.xSbBvEytbPSd15nc8bWuc6vbCkSBYmi', 'Bennett', 'Beel', 'bbeelx@hatena.ne.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (35, 'gdoddrelly', '$2b$12$.vidBNmE5si8HVMC21KdoO3XkcwXXl.xrWCPzEdLXs9OjGK6qz8yq', 'Gardie', 'Doddrell', 'gdoddrelly@google.pl', 'uzivatel');
INSERT INTO public.uzivatel VALUES (36, 'tparmeterz', '$2b$12$s0e.cEXI0PpSAN/Lmnm.GOEII/abx3OIvuSCqvMqzmEovrdcnP0PS', 'Tybi', 'Parmeter', 'tparmeterz@people.com.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (37, 'ktoma10', '$2b$12$otWDX/Wrlmv4N6O5INZ2/OTr6LHAU0qe9rhAlrkYGU4Xfz8qFdVzi', 'Kerr', 'Toma', 'ktoma10@buzzfeed.com', 'licitator');
INSERT INTO public.uzivatel VALUES (38, 'vframmingham11', '$2b$12$COfYQcD6TMDqpnX59mIsruwd0isJ.MXDwEGjXc1QVrlWY.1bV0RkC', 'Vivyanne', 'Frammingham', 'vframmingham11@smh.com.au', 'uzivatel');
INSERT INTO public.uzivatel VALUES (39, 'jjenckes12', '$2b$12$zwz97ZyfQdhpZCR3Dlbi6O0YerN7i5cqG.O/RQiUeE0hvejO6bdOq', 'Joanna', 'Jenckes', 'jjenckes12@telegraph.co.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (40, 'ryegorchenkov13', '$2b$12$xN6.QzAt2WACkvR64p9yCeVYTbebLcysyEOKI/qAGeV1v3ra.DUOS', 'Renato', 'Yegorchenkov', 'ryegorchenkov13@moonfruit.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (41, 'dcaswill14', '$2b$12$8PlJExPB94fno3uYqEDSa.U.o/3prXRde9dciZibU1lIDlA7oTUZO', 'Devlen', 'Caswill', 'dcaswill14@mtv.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (42, 'hderrell15', '$2b$12$5NquhhsRe/1ExSEeFxOr8uK/eFGDHAUPQKUnrQ35ioVSFTb0Wr81W', 'Hallsy', 'Derrell', 'hderrell15@whitehouse.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (43, 'rammer16', '$2b$12$Ln97Nvp9bAxOEAEe5x/gN.tvWRaP1EYtJOQ734yiqOLC5KXBlS4rO', 'Rebeka', 'Ammer', 'rammer16@wikipedia.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (44, 'aprovost17', '$2b$12$nG/HcSZ2kfTn2hNq06JKou3OzG5uqEqHNu2cs9O0Djs0x5IrMOj/u', 'Alfredo', 'Provost', 'aprovost17@google.com.br', 'uzivatel');
INSERT INTO public.uzivatel VALUES (45, 'bcrone18', '$2b$12$FCOEk13jVQJg1ZvBkkXpautQv3fG9JoWvVhDzEvs4hff8PKU2IL5e', 'Benedikt', 'Crone', 'bcrone18@cnet.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (46, 'dkilalea19', '$2b$12$uEHkGXjaZsq79sGEjSGAfu0KC2ZKJ9Nf2siAwtNJqrV1z0.15Tx6u', 'Der', 'Kilalea', 'dkilalea19@abc.net.au', 'uzivatel');
INSERT INTO public.uzivatel VALUES (47, 'gcharity1a', '$2b$12$B9NOkqtNGOqCMPf044OISeJvqAr1f6JmrrZEb.kUySHGYeUbDSspK', 'Giffard', 'Charity', 'gcharity1a@usatoday.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (48, 'zbuske1b', '$2b$12$Jp3irXH3hXRVDqBSA0tBeudbUSL9uATb2IUcq49pgHHhBIYEus3KG', 'Zechariah', 'Buske', 'zbuske1b@ask.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (49, 'aadamowicz1c', '$2b$12$ywlr56dNGVNnC4xbV7ur2OkS/4gBt1Hb4SK3LEfH1GcBrpD72gJve', 'Alyce', 'Adamowicz', 'aadamowicz1c@e-recht24.de', 'uzivatel');
INSERT INTO public.uzivatel VALUES (50, 'ebecken1d', '$2b$12$QobqtBVwjmR5hKvgG3N6EuY2kCBt5OIcdDOoSGWvClDuQNGswrFqG', 'Evelyn', 'Becken', 'ebecken1d@narod.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (51, 'kkeitch1e', '$2b$12$AVGAVa6MHWpo2PC7po5UKOUb8kJtB2a6cNKy5n4WgyBKXdtF/1gty', 'Kyrstin', 'Keitch', 'kkeitch1e@people.com.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (52, 'ghowieson1f', '$2b$12$fZTCX8gFktfA9Gk29EjdMeJ/F1cdkmSp3e8K0Su3LCMWHAm52Bhdq', 'Goldi', 'Howieson', 'ghowieson1f@twitter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (53, 'tweaver1g', '$2b$12$nnhx9HVSVKiIL8t.nmKHqul.EzDcGloIg.dK3CMeRQ5Wh0bgJJD12', 'Talya', 'Weaver', 'tweaver1g@icq.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (54, 'irustadge1h', '$2b$12$3/7PmEd2rkvIttRP.SaNcuKYYnNAxvqnyALEwm8zkJpGkaXF6NxaO', 'Isabelita', 'Rustadge', 'irustadge1h@cafepress.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (55, 'ctreweek1i', '$2b$12$igbtosmpYKfehpdvBvkBxeN8rGgb01urq.lgqxRPlISkUWB59FLZS', 'Caleb', 'Treweek', 'ctreweek1i@cnn.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (56, 'jwimms1j', '$2b$12$UVaBkserusqn/fm8fVyToeSrzKjUl.LQwzMk5ldo3QmZ.UB2tTvG.', 'Jaimie', 'Wimms', 'jwimms1j@aol.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (57, 'sscamadine1k', '$2b$12$LfVEU.aMuxWICmYVzFLXqOYOeGQ28wiCq83FCQlPeeyY0wgSXyncK', 'Skyler', 'Scamadine', 'sscamadine1k@qq.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (58, 'ebansal1l', '$2b$12$URQKUD3QBFpHASWGfDAtKOoZYkgVZ57V82XoNd2tsWcQhydYeohjm', 'Eddie', 'Bansal', 'ebansal1l@prweb.com', 'licitator');
INSERT INTO public.uzivatel VALUES (59, 'gcannings1m', '$2b$12$gbZ.38UpODk7BfGu.XRzY.ARcyw0a3q2/kaUtzHgI.xbgd.t.d1I.', 'Geoffry', 'Cannings', 'gcannings1m@i2i.jp', 'licitator');
INSERT INTO public.uzivatel VALUES (60, 'tralfe1n', '$2b$12$mcMiHKEUcs/hmKLALOolGOafBLchdG3cba/qVEdoRxcomcakRZm4y', 'Tabbie', 'Ralfe', 'tralfe1n@army.mil', 'uzivatel');
INSERT INTO public.uzivatel VALUES (61, 'rtow1o', '$2b$12$VPlwpNZX/7TYHpH/U3m4cevmzqJAUq/eSEkWXBrOb5/O9YazTunQe', 'Roslyn', 'Tow', 'rtow1o@studiopress.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (62, 'aweagener1p', '$2b$12$RndLjv2N/S.q2ZB8uCZhJ.JjocgPPmsx9siL4/0bgPJTTfDpDkUqK', 'Arabella', 'Weagener', 'aweagener1p@shutterfly.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (63, 'ksouttar1q', '$2b$12$k2dIHXK1ffSf/UpOmKvPqu.wh7s5xRHZgK/wZJ441z7/HfNT54Phe', 'Kellsie', 'Souttar', 'ksouttar1q@sphinn.com', 'licitator');
INSERT INTO public.uzivatel VALUES (64, 'cflorio1r', '$2b$12$TTRvWdE2eaSy1N/T/j4WgezO8wIAF4URhZuj3Xj47i93ou1SshOXm', 'Craggie', 'Florio', 'cflorio1r@macromedia.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (65, 'frangle1s', '$2b$12$wlP/5B8u/lIVxdTHH.Dc/OJIgeF8QiDbhR4NOZ9BhiXcC1O752zBa', 'Franciskus', 'Rangle', 'frangle1s@bizjournals.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (66, 'afardy1t', '$2b$12$TqiZQ.g8iy8cOyicp9aZGOltThVhA21zEI4lfJGilQc/j6biekyO6', 'Alan', 'Fardy', 'afardy1t@disqus.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (67, 'msturt1u', '$2b$12$bct1mT8Uv6wjqAoJnnaPj.RpTXgJH/VtpRBkBg3PCqJ3dwYpZDDCq', 'Meghan', 'Sturt', 'msturt1u@cargocollective.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (68, 'kmacgettigen1v', '$2b$12$xPylFxjW9bsAwK3I5LMHveTgZHdo3D2fn0.KtNpZxP3tYB7XU/puO', 'Kirby', 'MacGettigen', 'kmacgettigen1v@microsoft.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (69, 'pconeley1w', '$2b$12$sNAYKdCOIGV7Ti/95p3YueaZmxAcLOMsmgAo3zrc/Y4FAc3LR0f9e', 'Philbert', 'Coneley', 'pconeley1w@acquirethisname.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (70, 'mhouseley1x', '$2b$12$IipAGP5V4ZAfMWqH.tBBzOLw2uaHKTZf9cDH6wwbBXxWC9IQdQyB2', 'Mollie', 'Houseley', 'mhouseley1x@hao123.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (71, 'tnoone1y', '$2b$12$8KwJjgJ78KxpA2wViwhjoO6bQHsE1HkMJDEOlRJq38P8ciE0dI3PK', 'Tedmund', 'Noone', 'tnoone1y@so-net.ne.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (72, 'mshillabeare1z', '$2b$12$Gr7XfTzR76cYtOaiiFEpUuxF0blBxXe8FdTQPjtLcH5pGdNXUq2s6', 'Meta', 'Shillabeare', 'mshillabeare1z@cargocollective.com', 'licitator');
INSERT INTO public.uzivatel VALUES (73, 'mpendrich20', '$2b$12$BtZ2qEjSe2Dn0s06KRGXe.lNVI9S2j8PCAcIqGm8r2BfLGb0zG.dW', 'Marysa', 'Pendrich', 'mpendrich20@google.pl', 'uzivatel');
INSERT INTO public.uzivatel VALUES (74, 'bbagniuk21', '$2b$12$KTBFGmVon5B3D1GRfg3ib.VnN2V6NNLeh12KvhiQzO4AyhJLGtQbq', 'Byram', 'Bagniuk', 'bbagniuk21@reddit.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (75, 'sovington22', '$2b$12$Cj4hgNIH5oSNixXm41DJKOgqwu1.7MJjTX7aTPg0jxa3Cfob9xHUu', 'Sheila-kathryn', 'Ovington', 'sovington22@livejournal.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (76, 'lnassi23', '$2b$12$7Ror.qY0oQPHXDjleIvfHeTjBtikGk6iCyYjCQN0tc404IioSAHdy', 'Louie', 'Nassi', 'lnassi23@4shared.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (77, 'charnett24', '$2b$12$fLwik0Ddj9ICflLyVYY8t.GAlCwc3VqpI19V1PtJFpgw0EfhuwwiS', 'Courtney', 'Harnett', 'charnett24@ow.ly', 'uzivatel');
INSERT INTO public.uzivatel VALUES (78, 'gciardo25', '$2b$12$epCjpvOFxHyJylJRTG9ZJ.Cg3fjRCUoTntNIw3I1nLlw9/czdBPh6', 'Gail', 'Ciardo', 'gciardo25@ovh.net', 'uzivatel');
INSERT INTO public.uzivatel VALUES (79, 'lcrossman26', '$2b$12$FNWZIVEBdhWXpTTSyjVVa.y1tMKRclpth1JTfwU9cAIbn6WiuIuji', 'Lucretia', 'Crossman', 'lcrossman26@miibeian.gov.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (80, 'tmcandie27', '$2b$12$j5uANLpn6roB5TEKVrjVHOSs5hq1ojmJEm1PUWYcOIS5v4vT9OLY.', 'Thorsten', 'McAndie', 'tmcandie27@ifeng.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (81, 'tnorthill28', '$2b$12$W3SDhGkWr1ymdEMClKCwSufa6BuZTFosnkI1Dt9pUT0mBcJAse6l6', 'Tracy', 'Northill', 'tnorthill28@wordpress.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (82, 'tcowland29', '$2b$12$.uU02Bk1Mcp7st58BZjU2Ox0JczVSsY5uuMrydfTvfKYng4WaaIdy', 'Tessi', 'Cowland', 'tcowland29@lycos.com', 'licitator');
INSERT INTO public.uzivatel VALUES (83, 'eheskin2a', '$2b$12$h6CtRlwWp2Rb6FQuCfG0jeS8nBQDMq..fEg5ye41xCN8b/sZyv8Ym', 'Evangelina', 'Heskin', 'eheskin2a@ucla.edu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (84, 'sdolling2b', '$2b$12$404m5tEFKk//0KB38ydn9ODsLOkfAG84fOvLlfqEzsxeWN.qfeh2y', 'Stevy', 'Dolling', 'sdolling2b@java.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (85, 'kbartoszewski2c', '$2b$12$gP.yldULJchi4E.B0QSObuP8ZBak6.Eb1p0CKbB0eGC4Bx82WVsoG', 'Karie', 'Bartoszewski', 'kbartoszewski2c@ox.ac.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (86, 'rchampken2d', '$2b$12$ILGmMSBvWyGMKEGyf2pN7up89fp0JP8tcmm8ZH9xttBNSuDcOAD6C', 'Rob', 'Champken', 'rchampken2d@usatoday.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (87, 'jmallock2e', '$2b$12$P6ek1ooVIsdox7oGiT0p0.DYlD.HT3GMoRRusqUAixtC5RG6Ucb2S', 'Jefferey', 'Mallock', 'jmallock2e@exblog.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (88, 'acholmondeley2f', '$2b$12$V7ocD155tMnLELZa3pH03us4cdRvB.Ha2I1Rmo.5v6iUU8ScFAPGi', 'Alvin', 'Cholmondeley', 'acholmondeley2f@examiner.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (89, 'pgotter2g', '$2b$12$Ozjpxbk1Gww0IMbi9vn1Pe3UItTFsPZ7O9RlKuC4g4v/RnZ5ebcL6', 'Parrnell', 'Gotter', 'pgotter2g@kickstarter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (90, 'acapron2h', '$2b$12$wSPZxcKKyKbFTsL25uqbNu9nI94NTyEJC2jq3XxcrANNT5BPJ3WIm', 'Alia', 'Capron', 'acapron2h@flickr.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (91, 'gnairn2i', '$2b$12$.b3AGpc9EcDbWGHHI7bnCejAMvx52j72le6IBm5BHVIM1U8cr.cRy', 'Geraldine', 'Nairn', 'gnairn2i@noaa.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (92, 'lklosterman2j', '$2b$12$XSrCRPYf6VjAsYcI2Qrc4uC3ankPgY18gmsEgXwBGYS2Q/r0C8J5m', 'Lisetta', 'Klosterman', 'lklosterman2j@ucoz.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (93, 'jworters2k', '$2b$12$JJFAqF0l/SsmnH.8syVPgONXnh7AHUwenc1gH1KF85sDwjBo9zAD6', 'Jory', 'Worters', 'jworters2k@chicagotribune.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (94, 'tdunstall2l', '$2b$12$M0W6uIexsr08R3OMpN9P9ubG2swhSMhsHZfXsOOJNF2FQxmCXioVy', 'Timmi', 'Dunstall', 'tdunstall2l@twitter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (95, 'dspurling2m', '$2b$12$ULruL7X1lbxERZC5Tq8JXuPgFbMthF/TRaueiMm0jJ0Yayqz0HfUe', 'Denna', 'Spurling', 'dspurling2m@clickbank.net', 'uzivatel');
INSERT INTO public.uzivatel VALUES (96, 'aheigl2n', '$2b$12$58.Qg6myFbWnJ7/UH3EXcu64XvirFeMSgKLQadf4NUylPJPntskhC', 'Archer', 'Heigl', 'aheigl2n@alibaba.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (97, 'gwashtell2o', '$2b$12$XDd69tdhEOAf6IIzIJGrROTX8YUx0D.hoGjSITPlAglikV91ADpsG', 'Guido', 'Washtell', 'gwashtell2o@usda.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (98, 'imalitrott2p', '$2b$12$1jRFzjHNAuvStASGRihMEeXNqt/6iONhA85fX/EfHtmEmN4vY.f5a', 'Iseabal', 'Malitrott', 'imalitrott2p@tripadvisor.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (99, 'pknighton2q', '$2b$12$VFxKVuR4suVqZbFVe1r5oOr0t5mzXM3zUBmCGsxbxcrqCrhoAWlRq', 'Polly', 'Knighton', 'pknighton2q@hhs.gov', 'licitator');
INSERT INTO public.uzivatel VALUES (100, 'tbrookwood2r', '$2b$12$eq2Nc9wsObSc2kMvtUenHuWYLonQmVLKwe7d/NuiJo3gDk8wtGMey', 'Tammy', 'Brookwood', 'tbrookwood2r@dropbox.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (101, 'admin1', '$2b$12$Vz/roa8UQOksyVA9po1vDeRAfTUYCW2N96MdK/TeCOGhW6VNWa3ju', 'Admin', '1', 'admin1@iis.com', 'admin');
INSERT INTO public.uzivatel VALUES (102, 'admin2', '$2b$12$lLnGfkKpwU3T6azpCc.NbOMylFBj468pcFcHjhpVirmJu4D1iDPcO', 'Admin', '2', 'admin2@iis.com', 'admin');
INSERT INTO public.uzivatel VALUES (103, 'admin3', '$2b$12$Ff2qprUoaKH/zda/BJyywuU9Ao6cd/haAPYgECMPX5hr/PtEEvSQK', 'Admin', '3', 'admin3@iis.com', 'admin');
INSERT INTO public.uzivatel VALUES (106, 'licitator1', '$2b$12$3inl9LhloWBeG9ytCRtzAOaezkoepx7d8YKsCn0yBnrxlFYkoFv7C', 'licitator', '1', 'licitator1@iis.com', 'licitator');
INSERT INTO public.uzivatel VALUES (107, 'licitator2', '$2b$12$9jsEIiLi69DRtJF6Tyi/veKTJVXg59yR/8sAtjaQh6l8vIMxgnQRy', 'licitator', '2', 'licitator2@iis.com', 'licitator');
INSERT INTO public.uzivatel VALUES (108, 'licitator3', '$2b$12$3a7qkXmR8ym2Li1VjBgDjODs7coKQGzCEZ3S4w.I744q/zz18ZQ5y', 'licitator', '3', 'licitator3@iis.com', 'licitator');
INSERT INTO public.uzivatel VALUES (109, 'user1', '$2b$12$m.mzePCuc.qXZ5g8eqKsFudvfwCXzTL2AU641GCyyB0zi1oCM3MiG', 'User', '1', 'user1@iis.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (110, 'user2', '$2b$12$85qVPgiS6xAT1Wne8t3C5uFkFB2q64c9FlX5BDtKWKF24wsZtEjFi', 'User', '2', 'user2@iis.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (111, 'user3', '$2b$12$Cs4GGyaMOmWaOXt3D9aO0eN3m8ijCuft36VS.iKxKElU8DjT8RtjO', 'User', '3', 'user3@iis.com', 'uzivatel');


--
-- TOC entry 3060 (class 0 OID 53521)
-- Dependencies: 213
-- Data for Name: web_session; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.web_session VALUES ('R-HJfClh9XldcE5QVMpAAy_u_qXaIA6O', '{"cookie":{"originalMaxAge":86400000,"expires":"2021-11-27T16:37:50.939Z","httpOnly":true,"path":"/"},"uid":109}', '2021-11-27 19:53:51');
INSERT INTO public.web_session VALUES ('NQIy180u1FjWqIVOOAqN6kVtd3A1xDRJ', '{"cookie":{"originalMaxAge":86400000,"expires":"2021-11-27T16:35:06.311Z","httpOnly":true,"path":"/"}}', '2021-11-27 17:35:07');
INSERT INTO public.web_session VALUES ('0ETeATkqCbDUD3YG4SmZJ5LkNGk1ttfq', '{"cookie":{"originalMaxAge":86400000,"expires":"2021-11-27T16:33:21.690Z","httpOnly":true,"path":"/"}}', '2021-11-27 17:33:22');
INSERT INTO public.web_session VALUES ('nmBlwSgtUYSVtlN9fxYgNMn2wKXgGiBi', '{"cookie":{"originalMaxAge":86400000,"expires":"2021-11-27T16:35:14.251Z","httpOnly":true,"path":"/"}}', '2021-11-27 17:35:15');
INSERT INTO public.web_session VALUES ('FJJhGe_dLOSQin5I3NxZf6XeEy4jq6Ue', '{"cookie":{"originalMaxAge":86400000,"expires":"2021-11-27T16:18:27.636Z","httpOnly":true,"path":"/"}}', '2021-11-27 17:26:23');
INSERT INTO public.web_session VALUES ('Qd08LR6VhNKH_O5trL98PX15DrrA2zEC', '{"cookie":{"originalMaxAge":86400000,"expires":"2021-11-27T16:37:50.690Z","httpOnly":true,"path":"/"}}', '2021-11-27 17:37:51');


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 203
-- Name: auction_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.auction_seq', 2000, false);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 205
-- Name: object_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.object_seq', 4000, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 204
-- Name: tag_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.tag_seq', 3000, false);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.user_seq', 1000, false);


-- Completed on 2021-11-26 22:12:33 CET

--
-- PostgreSQL database dump complete
--

