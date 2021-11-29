--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

-- Started on 2021-11-29 18:27:45 CET

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
-- TOC entry 3054 (class 0 OID 58791)
-- Dependencies: 206
-- Data for Name: uzivatel; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.uzivatel VALUES (1, 'lschutze0', '$2b$12$0ABeUmIYrhp1FfC.An1O/eDgJP0BYYh.cztw14t2v7R.Q85cMqZl6', 'Luella', 'Schutze', 'lschutze0@arizona.edu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (2, 'aemanulsson1', '$2b$12$.lm/eoK9YDxSIdgk1M73teHqtfxOjFsBnCkf95i1ryI8GNTgVWtAO', 'Amy', 'Emanulsson', 'aemanulsson1@bravesites.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (3, 'tberresford2', '$2b$12$LbhpSXS5Mz3cCU/s2pxume3cRYthCjHxxFTvnKBfN82dkRz66BMIi', 'Tedda', 'Berresford', 'tberresford2@cbslocal.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (4, 'mspurling3', '$2b$12$xbMwZ8sSqEM3Wn6xFIS8IONpvz35/3dOsb5fUD.tVcnD9CeQAOB6O', 'Millie', 'Spurling', 'mspurling3@de.vu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (5, 'jleyland4', '$2b$12$7P0Q0UB2fD4WmLDr65f5iudf.n1KKJ4xHXTmHFRea6VopXeX.qc4.', 'Jude', 'Leyland', 'jleyland4@telegraph.co.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (6, 'gbellham5', '$2b$12$D2Zjk34yOct.9F1UpJpBgOdkScWsq4zFHB8mtkjXCe6Om/ISbU39a', 'Gavin', 'Bellham', 'gbellham5@tripadvisor.com', 'licitator');
INSERT INTO public.uzivatel VALUES (7, 'cgaythwaite6', '$2b$12$xK9VXZ82.rPJlObPhU8r0.jZe.2l4bK7BrCNaGYmRRO.g75tUUMh.', 'Charyl', 'Gaythwaite', 'cgaythwaite6@miitbeian.gov.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (8, 'dbawcock7', '$2b$12$SN/7cuixKzwqejHpmZDJlO4bt9p59rsidxs4Aua9Cv6xIMIq4uNgW', 'Derick', 'Bawcock', 'dbawcock7@w3.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (9, 'gslowley8', '$2b$12$5jYxZrmNzzmYlNumDduatuwcw5j4RIEk2DC4tL.nKRk34J/gbwp0q', 'Giraldo', 'Slowley', 'gslowley8@linkedin.com', 'licitator');
INSERT INTO public.uzivatel VALUES (10, 'tcayser9', '$2b$12$bwbZul0NjyXYuACFwm9BjeRrLCZ9vh74bNupk9/oBzThM1vnXABe6', 'Trent', 'Cayser', 'tcayser9@nymag.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (11, 'nmallana', '$2b$12$t.DvbbfbbJRev.d9TVWPYeeqKsNH6Vrs4at100QnrGFV0kSl4x9em', 'Nicolle', 'Mallan', 'nmallana@tuttocitta.it', 'uzivatel');
INSERT INTO public.uzivatel VALUES (12, 'jblackmoorb', '$2b$12$FF4x4xcVC8rgQYVlPXF0PON0/XDXrGJBplRI6RNKgwFQZ2aVfD32i', 'Jarad', 'Blackmoor', 'jblackmoorb@technorati.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (13, 'aropkingc', '$2b$12$U60Pk2MQwbXWi6TYqVat1.N4bHG5d7JPzx.7BlYbNK9mP5OlasQC6', 'Avril', 'Ropking', 'aropkingc@ted.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (14, 'cbredgelandd', '$2b$12$oMIwlRLpJEO8wtOjoc59NeOGNdgg9XxXvIZfaE/nGC3NEFW5dSJlm', 'Consolata', 'Bredgeland', 'cbredgelandd@statcounter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (15, 'mgavaghane', '$2b$12$kBmor17s3EfzCjbNXDWeiusIPK4EmpCUs8Lph7Wtle0tbrxAWKIQG', 'Maryrose', 'Gavaghan', 'mgavaghane@vkontakte.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (16, 'chansfordf', '$2b$12$gnf2U.oVPgukKmVGmOGCLuDeqiY7aSECiRiJ3ea275Tzrl8gqnZDi', 'Corrianne', 'Hansford', 'chansfordf@ucoz.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (17, 'hrainsburyg', '$2b$12$6vPchNac0tH7ukOLq9W9p.ZtNfwJcFbg7edfBZc8xBI.sCTtzj0wW', 'Hendrick', 'Rainsbury', 'hrainsburyg@senate.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (18, 'ptrenearh', '$2b$12$bE4unZjh872bTIp82sWWu.WCBzVNKHksN0aYL0Weyb.kPiVSdf8dy', 'Priscilla', 'Trenear', 'ptrenearh@simplemachines.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (19, 'rstandleyi', '$2b$12$yqHVirxEwBRcP4k.kzs.2O1TYa4Y/2fuqldx/YIHDBNFn9ATbGcmW', 'Ruby', 'Standley', 'rstandleyi@webeden.co.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (20, 'kwaterdrinkerj', '$2b$12$zDBPowqEQwPF7RDZaa9v9uIo5YrkT24xjspCUOFNNIkaHYjM7q9Oq', 'Korey', 'Waterdrinker', 'kwaterdrinkerj@home.pl', 'uzivatel');
INSERT INTO public.uzivatel VALUES (21, 'skoppenk', '$2b$12$0trJEourIdTgRfwpBC35SOI6RiCFWGwT2QAIPjb0NY/k.LQ1kUQh2', 'Shandy', 'Koppen', 'skoppenk@plala.or.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (22, 'cshawell', '$2b$12$XoWoXo/MDjrig/nXNcWykea9KRPDZg.JAw/mEDI7N/EDYuQnC4C9.', 'Culley', 'Shawel', 'cshawell@sciencedaily.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (23, 'mskusem', '$2b$12$RHTPZOYJY9BvuWdn0BAMYO7Gbgq.wOvdA8dgY9Y6ZV2Ktp4uhjGpW', 'Morna', 'Skuse', 'mskusem@vimeo.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (24, 'jpourvoieurn', '$2b$12$SZLhnz.Jn.8ldAKqMN4M4OakmJPZgwc.itnHv8zEBHn3YwX7.jGw.', 'Jephthah', 'Pourvoieur', 'jpourvoieurn@sbwire.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (25, 'cgoneauo', '$2b$12$3CvJyr5gClt30AFkIVh9fOEaHreNAxVLGypXR9PJn9xE3cEOrbiNm', 'Corette', 'Goneau', 'cgoneauo@rakuten.co.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (26, 'wportmanp', '$2b$12$b8..9/MX3XVdCKRT3ZCboOQWINAVYZuXnw1iOBrEQxKXcFO3FW7g6', 'Webster', 'Portman', 'wportmanp@cam.ac.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (27, 'dbrideq', '$2b$12$Gkin15HKYwM/IH1cLcyHVOJjkGgZNkgMVkn0GiyKsAsLFo99hsKSe', 'Demetra', 'Bride', 'dbrideq@nifty.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (28, 'cburthomr', '$2b$12$1wWfsB5OLxF2D0LWukuoKuSOhhxI0Pm.r.B5u19KfRUQmZ9GfK8XC', 'Chloe', 'Burthom', 'cburthomr@live.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (29, 'kblinmans', '$2b$12$FULZj5JFwh3t7bNAAm3tyeqc4JgQ3hoQxih4MDd/DZ5a3HNKFMsBW', 'Kristo', 'Blinman', 'kblinmans@nba.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (30, 'jeastwoodt', '$2b$12$KjGN5aazEEBmL1/ipJPdpuIpLO4WUsRZ7bCAVvhBONBfWBP5DE7SS', 'Jermaine', 'Eastwood', 'jeastwoodt@accuweather.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (31, 'ncaushu', '$2b$12$9vDrzSGr78uFSVUw8BaUSOv6TUFgiRxJviN3nxPzJrj8ncSymXw7u', 'Natalee', 'Caush', 'ncaushu@illinois.edu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (32, 'mbrockelsbyv', '$2b$12$VzNyrlVxnWwaAAEdlmf/f.s1eVGNHlztTnuByhzEtY6rJwWKp9Hwa', 'May', 'Brockelsby', 'mbrockelsbyv@edublogs.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (33, 'ipolsinw', '$2b$12$aXejy17Qzr1ckcRMzfuOteEFKuoa9/DqqHMGSL2FyB2oQ1HIQwO3m', 'Imogene', 'Polsin', 'ipolsinw@ustream.tv', 'uzivatel');
INSERT INTO public.uzivatel VALUES (34, 'bbeelx', '$2b$12$RtVdBtzfPBFHrCjXnI1VfevFVkBglgqqwo8FmQidMimtkyp1I1FdO', 'Bennett', 'Beel', 'bbeelx@hatena.ne.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (35, 'gdoddrelly', '$2b$12$OyMBDp.UbsBMv3fpqmnndOGLrwILWBbMcvuCg8JaTKGmhhKVEPwim', 'Gardie', 'Doddrell', 'gdoddrelly@google.pl', 'uzivatel');
INSERT INTO public.uzivatel VALUES (36, 'tparmeterz', '$2b$12$qcv9ief8fb/t.GGHr2si4uCp3yyB03.KoMc5rHZ0B38AV63k/3sH.', 'Tybi', 'Parmeter', 'tparmeterz@people.com.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (37, 'ktoma10', '$2b$12$hH5tN0XEEjh9H2vaZVCif.PehN6Vm9Xemh420MsbG0UUEwEYqK5Je', 'Kerr', 'Toma', 'ktoma10@buzzfeed.com', 'licitator');
INSERT INTO public.uzivatel VALUES (38, 'vframmingham11', '$2b$12$5jg8YVq4c5Dnrma7TIQgheISiChGdsi6RC.dAVqEgBpd62hCGDZOq', 'Vivyanne', 'Frammingham', 'vframmingham11@smh.com.au', 'uzivatel');
INSERT INTO public.uzivatel VALUES (39, 'jjenckes12', '$2b$12$yO7jDExiCZHwhJFuroLVfuwPP.bApWdurjFlQMtoxfDZMNLr8mA6K', 'Joanna', 'Jenckes', 'jjenckes12@telegraph.co.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (40, 'ryegorchenkov13', '$2b$12$qkr7xZT3FDvqvXb1FMWCg.9Dq3gqAxZ/BhvXIiM7kD0K/1X1tfo1S', 'Renato', 'Yegorchenkov', 'ryegorchenkov13@moonfruit.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (41, 'dcaswill14', '$2b$12$wjPqrxLIBVKMZF0QYQpbd.6aqGHROR3kN5w6wze8uw04dBo9uzgVi', 'Devlen', 'Caswill', 'dcaswill14@mtv.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (42, 'hderrell15', '$2b$12$xAY9KqleFsN4bR2SZoVYBehjfp1ghHJpmDcsrfvBT1c477tyNWEGq', 'Hallsy', 'Derrell', 'hderrell15@whitehouse.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (43, 'rammer16', '$2b$12$gnqsfTCPJxCwrPFxKg77S.ZlwcKr0xG2Y0UqKbHSSQIqfWAU/rhFG', 'Rebeka', 'Ammer', 'rammer16@wikipedia.org', 'uzivatel');
INSERT INTO public.uzivatel VALUES (44, 'aprovost17', '$2b$12$6wMObhYkHbPNnhpk032l/euNksZ07pWfkhgUdfJ4kqiq.73Y.Qo7W', 'Alfredo', 'Provost', 'aprovost17@google.com.br', 'uzivatel');
INSERT INTO public.uzivatel VALUES (45, 'bcrone18', '$2b$12$dokANeLeTo1X0qnO69qzpO45RsMCCK6v3Ryh1zNM/CC7AvdRTtaB6', 'Benedikt', 'Crone', 'bcrone18@cnet.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (46, 'dkilalea19', '$2b$12$g1IqItPBtJ37HC84SLOYLeMD4JBCk34EbJ8Q9quHPOVOLpB68cJ4W', 'Der', 'Kilalea', 'dkilalea19@abc.net.au', 'uzivatel');
INSERT INTO public.uzivatel VALUES (47, 'gcharity1a', '$2b$12$ikI8j23n7tcXuswwKSkZiuPti4nrakBJZJ710NpfYElN8nIr5PK4e', 'Giffard', 'Charity', 'gcharity1a@usatoday.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (48, 'zbuske1b', '$2b$12$Xr.owZNttn8VtmHLW1jlx.nP.cM6MNJMSG9LTaCCYRcz3EgbMLE5q', 'Zechariah', 'Buske', 'zbuske1b@ask.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (49, 'aadamowicz1c', '$2b$12$oNVWulQRNe1U57XHbSIV/.d0UFjaaMj53L7vipro9uHRjZO0y2bb2', 'Alyce', 'Adamowicz', 'aadamowicz1c@e-recht24.de', 'uzivatel');
INSERT INTO public.uzivatel VALUES (50, 'ebecken1d', '$2b$12$QB1ElDFmvXllOuKomTPeceaMPwTTdI8XIA8H3R1uqpjZofo491/Iu', 'Evelyn', 'Becken', 'ebecken1d@narod.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (51, 'kkeitch1e', '$2b$12$s7Ch.uXHRRritg87b7PQAu9n6VL63JQiuV.2UvUQyai9rZPRNQjxy', 'Kyrstin', 'Keitch', 'kkeitch1e@people.com.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (52, 'ghowieson1f', '$2b$12$DFKWKx1q3AAYC/77W2lUbeMZWq52NrDorgWFa8Envm9yiIQyobxlq', 'Goldi', 'Howieson', 'ghowieson1f@twitter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (53, 'tweaver1g', '$2b$12$QJM12ZyBsvhWZir51nulE.r.3iXyXVpS6SnU4s8BTIuixHpT2siF2', 'Talya', 'Weaver', 'tweaver1g@icq.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (54, 'irustadge1h', '$2b$12$UXJEmpiLIxrLNDnFDeADSe.ggHBOE8A1VZyOjh0vwOe9uZhj/ctVa', 'Isabelita', 'Rustadge', 'irustadge1h@cafepress.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (55, 'ctreweek1i', '$2b$12$XOI0kmaphyap64kmUn15Y.teQ.RQdpoDL4fI5X3wbSW37IxjTBsuK', 'Caleb', 'Treweek', 'ctreweek1i@cnn.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (56, 'jwimms1j', '$2b$12$7VWU0BEvjLLcULuX6YHq2uOWn4e4dS/MEh8KSEAr7ecLdNZf3LXaG', 'Jaimie', 'Wimms', 'jwimms1j@aol.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (57, 'sscamadine1k', '$2b$12$GbAExhzreYSSuHGYdTls5.uFhVcjY49yiyv83LZlYTpqx7aft8BTa', 'Skyler', 'Scamadine', 'sscamadine1k@qq.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (58, 'ebansal1l', '$2b$12$QxwpWGyOVcStENhYLj07uefg6NbH2Q69AZjMM4cgLLPMDdGKRtMmi', 'Eddie', 'Bansal', 'ebansal1l@prweb.com', 'licitator');
INSERT INTO public.uzivatel VALUES (59, 'gcannings1m', '$2b$12$Z.TLp0AXowc9nntMR/18NOmmq8jTbK6ZbLrX72MPOpSxhgJw.zOn.', 'Geoffry', 'Cannings', 'gcannings1m@i2i.jp', 'licitator');
INSERT INTO public.uzivatel VALUES (60, 'tralfe1n', '$2b$12$FsY1Vove8Y5u7DyBjEX4TOTp9meNn2i/eSc9OzUiG7U6hGwuwKh2y', 'Tabbie', 'Ralfe', 'tralfe1n@army.mil', 'uzivatel');
INSERT INTO public.uzivatel VALUES (61, 'rtow1o', '$2b$12$shF3hDR7O.5YrxKccvYCOufQJdPgB9iDrM4Z9CxxcYmGeuCmy65Oy', 'Roslyn', 'Tow', 'rtow1o@studiopress.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (62, 'aweagener1p', '$2b$12$g9rq/JHfZbvSKNVcpBa27eKGF0DIrpFJDBMQ0Bv0psm/AhRIQxe4G', 'Arabella', 'Weagener', 'aweagener1p@shutterfly.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (63, 'ksouttar1q', '$2b$12$ls2cqf5e99o0d9VTp80rruocgA6f51pt3fQLJUR/Qgj3YtelzjEI.', 'Kellsie', 'Souttar', 'ksouttar1q@sphinn.com', 'licitator');
INSERT INTO public.uzivatel VALUES (64, 'cflorio1r', '$2b$12$poV2EcKMz9tJVQkvr80CtuTJTKb9yBxfJVFX4cibbDoLyroL6P3dq', 'Craggie', 'Florio', 'cflorio1r@macromedia.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (65, 'frangle1s', '$2b$12$meYmTJYKyjqXTAtkha4enuB3if/p.XsD6HlSiA5/Dva7uK7Hu1xEy', 'Franciskus', 'Rangle', 'frangle1s@bizjournals.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (66, 'afardy1t', '$2b$12$QXmaPq6a5BG2YY2GDPLTu.Q2Mcl5z6o5jMopJtXShE3tjoT2x3CW2', 'Alan', 'Fardy', 'afardy1t@disqus.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (67, 'msturt1u', '$2b$12$f/32I3BNO4sscLz3/Q7oHeNzG29K4UeVXujcp0cy5yes03lNs6tia', 'Meghan', 'Sturt', 'msturt1u@cargocollective.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (68, 'kmacgettigen1v', '$2b$12$XF/lUGrghfHsYdiWxnGpT.0dGe.dTayYSJn1bI3gwOxo.9qD4cTdS', 'Kirby', 'MacGettigen', 'kmacgettigen1v@microsoft.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (69, 'pconeley1w', '$2b$12$ugZkvL39ylA8dsxsNKLFyOHErX5.k55Y7N0UMw5UOpnn6sF0U0rLe', 'Philbert', 'Coneley', 'pconeley1w@acquirethisname.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (70, 'mhouseley1x', '$2b$12$25X0Tw9HvNv9LfelRYqkv.xCWVuEG7efoVukekjXJ8iqND7DS8VYW', 'Mollie', 'Houseley', 'mhouseley1x@hao123.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (71, 'tnoone1y', '$2b$12$T7mnCkLrNdDx21hMpI4ZO.uyaq5gUtekftG7qA9VMnaswQgrysN8.', 'Tedmund', 'Noone', 'tnoone1y@so-net.ne.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (72, 'mshillabeare1z', '$2b$12$TXIGL5ND36b5Lggfa6SD9.RQVRfR/CClvrF0wlmOsL/pIdzaJYJpO', 'Meta', 'Shillabeare', 'mshillabeare1z@cargocollective.com', 'licitator');
INSERT INTO public.uzivatel VALUES (73, 'mpendrich20', '$2b$12$RWAHboJcGK7pXJfQDhEJEueZeoiCdrXoP15iVOS.bRbY9wbroVj..', 'Marysa', 'Pendrich', 'mpendrich20@google.pl', 'uzivatel');
INSERT INTO public.uzivatel VALUES (74, 'bbagniuk21', '$2b$12$5bUQv3QobPXOjRKR4p7t.eAk4D3KZH7xGscXdgSrjl/U0X1TMMxAW', 'Byram', 'Bagniuk', 'bbagniuk21@reddit.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (75, 'sovington22', '$2b$12$eZV0PrZlasaF4x9E/BKC2ejnKonFQH7YbybqU2S.eAK3nD1LfEhkm', 'Sheila-kathryn', 'Ovington', 'sovington22@livejournal.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (76, 'lnassi23', '$2b$12$NncUxXUSXICWqRwlXcwoS.jKQ85bpDssvMeZXHwoKrb0rL7woxsrm', 'Louie', 'Nassi', 'lnassi23@4shared.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (77, 'charnett24', '$2b$12$LLIW3PzedNMwynybItOOF.M64MeqYONnTO2DQ0J1DTsVlqRFz6CGy', 'Courtney', 'Harnett', 'charnett24@ow.ly', 'uzivatel');
INSERT INTO public.uzivatel VALUES (78, 'gciardo25', '$2b$12$HoPq1RUN25RQ2Avxwb4mB.qtwO6USBpSC9ANM85NekHTUvM2BxOHe', 'Gail', 'Ciardo', 'gciardo25@ovh.net', 'uzivatel');
INSERT INTO public.uzivatel VALUES (79, 'lcrossman26', '$2b$12$JMGu7FXTKdC/4oTFr0fbxeDsnx/TsFFk0RZW.pa58EOMuq/GcYPkK', 'Lucretia', 'Crossman', 'lcrossman26@miibeian.gov.cn', 'uzivatel');
INSERT INTO public.uzivatel VALUES (80, 'tmcandie27', '$2b$12$u0WIpK.T8m7bycDsCVZXJ.9euV2l5OeQH2jHBMWjrmcYkQN4Y471O', 'Thorsten', 'McAndie', 'tmcandie27@ifeng.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (81, 'tnorthill28', '$2b$12$rDfrOKjox3PBH3MTjxLl4OE4jRE1GIuz765Y59GcSxje/4gIUlc3a', 'Tracy', 'Northill', 'tnorthill28@wordpress.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (82, 'tcowland29', '$2b$12$BccisLTAT6n3hqMYXGhaKuU6vDtAaNHSptJtRlvC5XsAPi5cQO.4.', 'Tessi', 'Cowland', 'tcowland29@lycos.com', 'licitator');
INSERT INTO public.uzivatel VALUES (83, 'eheskin2a', '$2b$12$VvP1rFrZHW/vEB32qN4rEOhEa8dxYbbXiGs2pa6fw8.4f4CI8FI0C', 'Evangelina', 'Heskin', 'eheskin2a@ucla.edu', 'uzivatel');
INSERT INTO public.uzivatel VALUES (84, 'sdolling2b', '$2b$12$O3eE.i1BNmX7hOJyuWwqu.T32iK1wGni443.1EFo5G5FKJtkwDt9e', 'Stevy', 'Dolling', 'sdolling2b@java.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (85, 'kbartoszewski2c', '$2b$12$NR4.xs3w/EMwU1JuYpu5YuDjuJjNJSQfp8YME80Srlgsplhh8yZ7O', 'Karie', 'Bartoszewski', 'kbartoszewski2c@ox.ac.uk', 'uzivatel');
INSERT INTO public.uzivatel VALUES (86, 'rchampken2d', '$2b$12$AVJvEISy.h9GpfDQeH52sObjKvp14gJgG7loj.iNAZGuVWafyq5q.', 'Rob', 'Champken', 'rchampken2d@usatoday.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (87, 'jmallock2e', '$2b$12$qTJ3FMk6nhzdJS/qGF7FcO/lNGt.8OWmT5pUoMSewZPrCM4ciQtvG', 'Jefferey', 'Mallock', 'jmallock2e@exblog.jp', 'uzivatel');
INSERT INTO public.uzivatel VALUES (88, 'acholmondeley2f', '$2b$12$JVBA6vuVzepDR6X1u0fV1OFvo7oT4ryBnK0YtsWNQALzXTHTbnKc6', 'Alvin', 'Cholmondeley', 'acholmondeley2f@examiner.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (89, 'pgotter2g', '$2b$12$Jd.IskqrXRB3DUUOCZQg.Os2BvVAMky95K1u.1ytqppnMQj1NSscG', 'Parrnell', 'Gotter', 'pgotter2g@kickstarter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (90, 'acapron2h', '$2b$12$YsB1poS6YnkFzHMoYEXQ7Ok97n5acJqAdW1TA3bxeu2y0SkdcEkt.', 'Alia', 'Capron', 'acapron2h@flickr.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (91, 'gnairn2i', '$2b$12$pvs7yFjyQDuHJwWqHsKAmegtAgoSfQBH35mmyHa34JG64DrMw9s/2', 'Geraldine', 'Nairn', 'gnairn2i@noaa.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (92, 'lklosterman2j', '$2b$12$Mgg1XrVJuy7TBO3QzSPAQuQChaBmNO4d//9PfVmAxSOJOddoT3q1C', 'Lisetta', 'Klosterman', 'lklosterman2j@ucoz.ru', 'uzivatel');
INSERT INTO public.uzivatel VALUES (93, 'jworters2k', '$2b$12$Q2hudMXvLPcmfpiiiUaQ2uJDCZ0kHciOoH6Xuwx6nBKq2CkBkjRGK', 'Jory', 'Worters', 'jworters2k@chicagotribune.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (94, 'tdunstall2l', '$2b$12$DfeSzUSONtUTDjVrMUX3auy6iH2Yd27yUVS0cN0b71Yh4YmNaJqpu', 'Timmi', 'Dunstall', 'tdunstall2l@twitter.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (95, 'dspurling2m', '$2b$12$PfeWgbghsRTz.1d5kJx9mOB74m0Z3wepVvicej1w2sZPSjdUZucvO', 'Denna', 'Spurling', 'dspurling2m@clickbank.net', 'uzivatel');
INSERT INTO public.uzivatel VALUES (96, 'aheigl2n', '$2b$12$DCDzpoFMOOqRxIgsQ2bgR.O3DNX5yunqnKBNC703qeYPkQC8VtL6i', 'Archer', 'Heigl', 'aheigl2n@alibaba.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (97, 'gwashtell2o', '$2b$12$p6aH9TLaz6PcfxQIKvmRDO6tjWIMCDzyyhQmjX15k99LRdJNhZmrS', 'Guido', 'Washtell', 'gwashtell2o@usda.gov', 'uzivatel');
INSERT INTO public.uzivatel VALUES (98, 'imalitrott2p', '$2b$12$ONB0Kgd13uLVw3NMDUKas.nn7g/cyXuK57vlIZkSqtiBw5MIDMVhK', 'Iseabal', 'Malitrott', 'imalitrott2p@tripadvisor.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (99, 'pknighton2q', '$2b$12$H3LEQsXvqqRnE1aoUb/dSe04SC5MPxYsS7eQeVVZGz2v.qTnYkqDm', 'Polly', 'Knighton', 'pknighton2q@hhs.gov', 'licitator');
INSERT INTO public.uzivatel VALUES (100, 'tbrookwood2r', '$2b$12$QaT4QgUeab0zi9YRaW0dq.U0ir7YmzaIDhSkfDPxUiWr8K/0G5oIK', 'Tammy', 'Brookwood', 'tbrookwood2r@dropbox.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (101, 'admin1', '$2b$12$bMCt3XUroCLFdQuz0mdEFuPR/NttpxR5KEYvDmvrC17ZvnhOaJtaq', 'Admin', '1', 'admin1@iis.com', 'admin');
INSERT INTO public.uzivatel VALUES (102, 'admin2', '$2b$12$hSf7kuFBYybFHFgOp2mMFel4mWhw8y4nQsKbr/tUhFEW4q7ibeqOK', 'Admin', '2', 'admin2@iis.com', 'admin');
INSERT INTO public.uzivatel VALUES (103, 'admin3', '$2b$12$.nw6LsMKkEz7vsiDg1J0Ke69gISnBQsxvKL31oAlKllpWipYMgs6G', 'Admin', '3', 'admin3@iis.com', 'admin');
INSERT INTO public.uzivatel VALUES (106, 'licitator1', '$2b$12$KISYaVLWFZ9sCNXji5xOHu51xxU7m8Xl9D9WwPNDVtt0jxX29gvly', 'licitator', '1', 'licitator1@iis.com', 'licitator');
INSERT INTO public.uzivatel VALUES (107, 'licitator2', '$2b$12$jpNupLWmC0m43wODmfxP1ez7iH8HGFsGBpUXBmVLmNAMmsDq4hnQ2', 'licitator', '2', 'licitator2@iis.com', 'licitator');
INSERT INTO public.uzivatel VALUES (108, 'licitator3', '$2b$12$vw.rdrXCtKjd0dJcHmozhOd8hInAJdnTXlbkYUnfGcnPRyK8zFKQW', 'licitator', '3', 'licitator3@iis.com', 'licitator');
INSERT INTO public.uzivatel VALUES (109, 'user1', '$2b$12$L/bZcdKqEY17oSNw4BRNx./GVf32jWiANTvOd3z6PIS0WcbpMeOo.', 'User', '1', 'user1@iis.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (110, 'user2', '$2b$12$cD/VccRX.dIhbkScjsocUeYobmWQqFTReCB9hRHgbiV35j/XNyQYa', 'User', '2', 'user2@iis.com', 'uzivatel');
INSERT INTO public.uzivatel VALUES (111, 'user3', '$2b$12$vqtNRrxaAzMQd3rwnm3fduFfvXYnYlIs612KrdeY/HNgN3ZUo4Uza', 'User', '3', 'user3@iis.com', 'uzivatel');


--
-- TOC entry 3055 (class 0 OID 58801)
-- Dependencies: 207
-- Data for Name: objekt; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.objekt VALUES (1, 'Rodinný dům, Praha', 'Hlavní 164, Praha 6', 'Krásný dům v klidné ulici', NULL, 2);
INSERT INTO public.objekt VALUES (2, 'Starý sklad 1500m^2', 'Božetěchova 19, Brno Královo Pole', 'Sklad vhodný k rekonstrukci', NULL, 3);
INSERT INTO public.objekt VALUES (3, 'Vyhořelá vila Černošice', 'Božetěchova 19, Brno Královo Pole', 'Vila je aktuálně zabezpečená a kvůli incidentům z minulosti, je každý den hlídána policií. Znalci v roce 2017 ohodnotili cenu vily na 97 290 000 Kč', NULL, 4);
INSERT INTO public.objekt VALUES (4, 'Kancelářské prostory', 'Božetěchova 19, Brno Královo Pole', 'Kancelářský prostor v rámci Fakulty informačních tenchnologií', NULL, 10);
INSERT INTO public.objekt VALUES (5, 'Horská chata', 'Dolní Morava', 'Krásná dřevěná chata, nacházející v Jeseníku. Chata je velice zachovalá', 'photos/vila.jpg', 11);
INSERT INTO public.objekt VALUES (6, 'Byt 3+kk', 'Božetěchova 19, Brno Královo Pole', 'Byt po rekonstrukci. Důvodem prodeje jsou hluční sousedi.', NULL, 12);
INSERT INTO public.objekt VALUES (7, 'Rodinný dům, Brno', 'Božetěchova 19, Brno Královo Pole', 'Rodinný dům v klidné lokaci. Dům je v zachovalém stavu, vhodný pro rodinu s dětmi.', NULL, 13);
INSERT INTO public.objekt VALUES (8, 'Pozemek 560m^2', 'Božetěchova 19, Brno Královo Pole', 'Prodávám rozsáhlý pozemek, tento pozemek je vhodný pro stavbu rodinného domu. Nachází se zde úrodná půda, takže je pozemek vhodný i pro pěstování domácích mrkviček.', NULL, 14);
INSERT INTO public.objekt VALUES (9, 'Vila na kraji města', 'Božetěchova 19, Brno Královo Pole', 'Prodávám krásnou prvorepublikovou vilu. Vila je prostorná, ve výborném stavu. ', NULL, 15);
INSERT INTO public.objekt VALUES (10, 'Prodej komerčního prostoru', 'Božetěchova 19, Brno Královo Pole', 'Komerční prostor. Prob ližší informace mne kontaktujte pomocí emailu.', NULL, 16);
INSERT INTO public.objekt VALUES (11, 'Prodej domu na klíč', 'Božetěchova 19, Brno Královo Pole', 'Prodej projektu domu', NULL, 17);
INSERT INTO public.objekt VALUES (12, 'Prodej garáže', 'Božetěchova 19, Brno Královo Pole', 'Prodej garáže velikost 3mx6,5m. Pro více informací neváhejte kontaktovat.', 'photos/garáž.jpg', 18);
INSERT INTO public.objekt VALUES (13, 'Prodej pole 5000m^2', 'Božetěchova, Brno Královo Pole', 'Prodávám pole. Vhodné pro pěstování brambor a kukuřice.', NULL, 19);
INSERT INTO public.objekt VALUES (14, 'Prodávám byt v Ostravě', 'Ostravská 20, Ostrava', 'Prodám dům v Ostravě na ulici Ostravská', NULL, 20);
INSERT INTO public.objekt VALUES (15, 'Prodej domu na klíč', 'Božetěchova 19, Brno Královo Pole', 'Výstavba domu na místě bývalého kostela', NULL, 22);
INSERT INTO public.objekt VALUES (16, 'Skladovací prostor', 'Božetěchova 19, Brno Královo Pole', 'Skladovací prostor s klimatizací a sociálním zařízením', NULL, 23);
INSERT INTO public.objekt VALUES (17, 'Kancelářský prostor', 'Božetěchova 19, Brno Královo Pole', 'Kancelářský prostor v Brně', NULL, 23);
INSERT INTO public.objekt VALUES (18, 'byt 5+kk', 'Božetěchova 29, Brno Královo Pole', 'byt v brně 5+kk. Pro více infa pište.', NULL, 24);
INSERT INTO public.objekt VALUES (19, 'Sklad', 'Božetěchova 19, Brno Královo Pole', 'Sklad na ulici Božetěchova', NULL, 25);
INSERT INTO public.objekt VALUES (20, 'Prodej části lesa Rajnochovice', 'Rajnochovice', 'Prodám les v klidné lokalitě. Nedaleko je dětský tábor', 'photos/les.jpg', 26);
INSERT INTO public.objekt VALUES (21, 'Prodej bytu 3+1', 'Božetěchova 19, Brno Královo Pole', 'Byt na ulici Božetěchova. Důvodem prodeje jsou hluční studenti a šalina', NULL, 27);
INSERT INTO public.objekt VALUES (22, 'Garáž', 'Božetěchova 19, Brno Královo Pole', 'Garáž o rozměrech 5x7m', NULL, 28);
INSERT INTO public.objekt VALUES (23, 'RD, Plzeň', 'Pivovarská 20, Plzeň', 'Prodám rodinný byt v Plzni. Byt prodávám včetně nabýtku. Pro více informací/fotek pište na mail.', NULL, 70);
INSERT INTO public.objekt VALUES (24, 'Restaurace', 'nám. Svobody 9, 602 00 Brno-střed', 'Prodám zavedenou restauraci v Brně. Restaurace je hojně navštěvovaná a mezi místními oblíbená. Důvodem prodeje je nedostatek financí v této covid době.', 'photos/restaurace1.jpg', 71);
INSERT INTO public.objekt VALUES (25, 'byt 1+kk', 'Božetěchova 19, Brno Královo Pole', 'Byt 1+kk', NULL, 74);
INSERT INTO public.objekt VALUES (26, 'byt 2+kk', 'Božetěchova 19, Brno Královo Pole', 'Byt k prodeji, první majitel', NULL, 80);
INSERT INTO public.objekt VALUES (27, 'Zámek', '115 rue Reine Elisabeth, Francie,Lorraine', 'Prodám chȃteau na jihu Francie, spěchám.', 'photos/zámek2.jpg', 81);
INSERT INTO public.objekt VALUES (28, 'LG televize', 'Božetěchova 19, Brno Královo Pole', 'Nefunkkční televize značky LG', NULL, 83);
INSERT INTO public.objekt VALUES (29, 'Rybníček za hubičku', 'Božetěchova 19, Brno Královo Pole', 'Prodám rybník v brně', NULL, 84);
INSERT INTO public.objekt VALUES (30, 'Krásná louka', 'Nádražní 42, Brno Královo Pole', 'Louka vedle poblíž nadráží Královo Pole.', NULL, 85);
INSERT INTO public.objekt VALUES (31, 'Zahradní domek', 'Božetěchova 19, Brno Královo Pole', 'Prodám zahradní domek na ulici Božetěchova', NULL, 86);
INSERT INTO public.objekt VALUES (32, 'Dům pro developerské projekty', 'Božetěchova 19, Brno Královo Pole', 'Dům vhodný k dlouhodobé investici', NULL, 87);
INSERT INTO public.objekt VALUES (33, 'Studentský byt', 'Božetěchova 19, Brno Královo Pole', 'Byt vhodný k pronajímání. Zájemci pište na email', NULL, 88);
INSERT INTO public.objekt VALUES (34, 'Hospoda U Velké cedule', 'U Velké cedule 32, Brno Královo Pole', 'Velmi úspěšná restaurace, cedule v ceně', 'photos/restaurace2.jpg', 92);
INSERT INTO public.objekt VALUES (35, 'Secondhand na ulici Palackého', 'Palackého 19, Brno Královo Pole', 'Prodám second hand z rodinných důvodů.', NULL, 50);
INSERT INTO public.objekt VALUES (36, 'Půda po rekonstrukci', 'Božetěchova 19, Brno Královo Pole', 'Zrekontruovaná půda, v nabídce i místnost ve sklepě.', NULL, 51);
INSERT INTO public.objekt VALUES (37, 'Zahrada se studnou', 'Božetěchova 19, Brno Královo Pole', 'Zahrada se zdrojem pitné vody.', 'photos/zahrada.jpg', 111);
INSERT INTO public.objekt VALUES (38, 'Hrad Špilberk', 'Špilberk 210, Brno', 'Dominanta města Brno, nacházející se v městské části Brno-střed. Hrád krásný, zachovalý, nádherný výhled na Brno.', 'photos/hrad.jpg', 110);
INSERT INTO public.objekt VALUES (39, 'Dřevěná chatka', 'Někde v lese 223, Špindlerův Mlýn', 'Starší chatka se dvěmi lůžky', 'photos/chatka.jpg', 109);
INSERT INTO public.objekt VALUES (40, 'Betonový bunkr', 'Zlaté Návrší, Krkonoše', 'Bunkr, zachovalý, perfektní stav. P.S. bacha na hlavu, já se křápl.', 'photos/bunkr.jpg', 110);
INSERT INTO public.objekt VALUES (41, 'Vinný sklípek', ' 696 65 Petrov', 'Vinný sklípek na krásné Moravě.', 'photos/sklípek1.jpg', 107);
INSERT INTO public.objekt VALUES (42, 'Dětské hřiště', 'Jasínkova 25, Přerov', 'Menší dětské hřiště, vynikající stav. Hřiště obsahuje novou zelenou skluzavku, prolézačky a hrad pro malé děti.', 'photos/hřiště.jpg', 108);
INSERT INTO public.objekt VALUES (43, 'Vinotéka', 'U cesty 25, Královo Pole', 'Prodávám krásnou vinotéku. Vinotéka je prostorná a po renovaci. Důvodem prodeje jsou nízké tržby', 'photos/hřiště.jpg', 110);
INSERT INTO public.objekt VALUES (44, 'Kostel', 'Božetěchova, Královo Pole', 'Kostel nedaleko nádraží Královo pole. Opravdový skvost. Kostel hojně navštěvují studenti z nedaleké školy, předvším během zkouškového období.', 'photos/kostel.jpg', 109);
INSERT INTO public.objekt VALUES (200, 'Malá zahrada', 'U Kolonie 225, Brno', 'Prodávám zahradu v zahrádkářské kolonii. Klidné prostředí, příjemní sousedé', NULL, 60);
INSERT INTO public.objekt VALUES (201, 'Zahrada za městem', 'Za Městem 12. Brno-Žabovřesky', 'Prodávám zahradu za městem, mimo veškerý hluk velkoměsta. Pro více infa pište na mail', NULL, 1);
INSERT INTO public.objekt VALUES (202, 'Zahrada v kolonii', 'Božetěchova 19, Brno Královo Pole', 'Zahrada se zdrojem pitné vody a zahradním domkem.', NULL, 40);
INSERT INTO public.objekt VALUES (203, 'Velká zahrada', 'U Žabičky 413, Brno Královo Pole', 'Zahrada s velkým záhonem', NULL, 7);


--
-- TOC entry 3056 (class 0 OID 58815)
-- Dependencies: 208
-- Data for Name: aukce; Type: TABLE DATA; Schema: public; Owner: majer
--

INSERT INTO public.aukce VALUES (1, 'Rodinný dům, Praha', 1, 7504000, 7504000, 20000, 106, 2, 'otevrena', 'poptavkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (2, 'Starý sklad 1500m^2', 2, 3000000, 3620000, 8500, 106, 3, 'otevrena', 'nabidkova', 5, 'probihajici', NULL, '2021-11-18 01:01:18', '2022-01-01 01:01:18', NULL);
INSERT INTO public.aukce VALUES (3, 'Vyhořelá vila Černošice', 3, 57620000, 65200000, 16000, 106, 4, 'otevrena', 'nabidkova', 5, 'probihajici', NULL, '2021-11-18 01:01:18', '2022-01-02 01:01:18', NULL);
INSERT INTO public.aukce VALUES (4, 'Kancelářské prostory', 4, 2000000, 3500000, 150000, 108, 10, 'otevrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-21 01:09:30', '2022-01-02 07:09:30', NULL);
INSERT INTO public.aukce VALUES (5, 'Horská chata', 5, 7700000, 8000000, 100000, 107, 11, 'otevrena', 'nabidkova', 1, 'probihajici', NULL, '2021-11-10 01:16:30', '2022-01-02 11:16:30', NULL);
INSERT INTO public.aukce VALUES (6, 'Byt 3+kk', 6, 3484000, 5000000, 11000, 107, 12, 'otevrena', 'poptavkova', 1, 'probihajici', NULL, '2021-10-18 01:01:18', '2022-01-03 01:01:18', NULL);
INSERT INTO public.aukce VALUES (7, 'Rodinný dům, Brno', 7, 12000000, 1500000, 8000, 106, 13, 'otevrena', 'nabidkova', 3, 'probihajici', NULL, '2021-10-18 01:01:18', '2022-01-03 05:01:18', NULL);
INSERT INTO public.aukce VALUES (8, 'Pozemek 560m^2', 8, 938000, 938000, 17000, NULL, 14, 'otevrena', 'poptavkova', 4, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (9, 'Vila na kraji města', 9, 4450000, 4450000, 95000, 107, 15, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (10, 'Prodej komerčního prostoru', 10, 10184000, 5360000, 17000, 108, 16, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (11, 'Prodej domu na klíč', 11, 5494000, 8174000, 12000, 106, 17, 'otevrena', 'poptavkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (12, 'Prodej garáže', 12, 9648000, 3216000, 13000, 108, 18, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (13, 'Prodej pole 5000m^2', 13, 1206000, 8844000, 5000, 108, 19, 'uzavrena', 'poptavkova', 4, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (14, 'Prodávám byt v Ostravě', 14, 850000, 850000, 10000, 108, 20, 'otevrena', 'nabidkova', 2, 'zamitnuta', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (15, 'Prodej domu na klíč', 15, 5494000, 8174000, 12000, 107, 22, 'otevrena', 'poptavkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (16, 'Skladovací prostor', 16, 4824000, 7236000, 9000, 108, 23, 'uzavrena', 'nabidkova', 5, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (17, 'Kancelářský prostor', 17, 2412000, 10184000, 14000, NULL, 23, 'otevrena', 'nabidkova', 3, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (18, 'byt 5+kk', 18, 4824000, 6968000, 15000, 108, 24, 'otevrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (19, 'Sklad', 19, 1206000, 6566000, 14000, NULL, 25, 'uzavrena', 'poptavkova', 5, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (20, 'Prodej části lesa', 20, 1340000, 938000, 13000, 108, 26, 'otevrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (21, 'Prodej bytu 3+1', 21, 6566000, 8308000, 5000, 107, 27, 'uzavrena', 'nabidkova', 1, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (22, 'Garáž', 22, 3752000, 10318000, 8000, NULL, 106, 'uzavrena', 'nabidkova', 4, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (23, 'RD, Plzeň', 23, 9782000, 13618000, 9000, 106, 70, 'uzavrena', 'poptavkova', 2, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (24, 'Restaurace', 24, 4288000, 10050000, 8000, 9, 71, 'otevrena', 'nabidkova', 1, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (25, 'byt 1+kk', 25, 9916000, 9380000, 14000, NULL, 74, 'uzavrena', 'nabidkova', 1, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (26, 'byt 2+kk', 26, 7638000, 6432000, 19000, 106, 80, 'uzavrena', 'nabidkova', 5, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (27, 'Zámek', 27, 90000000, 150000000, 100000, 9, 81, 'uzavrena', 'nabidkova', 10, 'probihajici', NULL, '2021-09-01 04:08:48', '2021-09-08 04:08:48', NULL);
INSERT INTO public.aukce VALUES (28, 'LG televize', 28, 15000, 15000, 19000, 107, 83, 'otevrena', 'nabidkova', 1, 'zamitnuta', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (29, 'Rybníček za hubičku', 29, 150000, 150000, 5000, 108, 84, 'uzavrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (30, 'Krásná louka', 30, 500000, 900000, 5000, 106, 85, 'uzavrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-21 01:01:18', '2022-01-03 15:01:18', NULL);
INSERT INTO public.aukce VALUES (31, 'Zahradní domek', 31, 25000, 25000, 2000, 108, 86, 'uzavrena', 'nabidkova', 1, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (32, 'Dům pro developerské projekty', 32, 3500000, 3500000, 100000, 108, 87, 'otevrena', 'nabidkova', 2, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (33, 'Studentský byt', 33, 900000, 900000, 10000, NULL, 88, 'otevrena', 'nabidkova', 1, 'neschvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (34, 'Hospoda U Velké cedule', 34, 8000000, 8000000, 100000, 107, 92, 'otevrena', 'nabidkova', 4, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (35, 'Secondhand na ulici Palackého', 35, 2500000, 2500000, 80000, 108, 50, 'otevrena', 'nabidkova', 3, 'schvalena', NULL, NULL, NULL, NULL);
INSERT INTO public.aukce VALUES (36, 'Půda po rekonstrukci', 36, 225000, 400000, 8000, 108, 51, 'otevrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-11-25 01:01:18', NULL);
INSERT INTO public.aukce VALUES (37, 'Zahrada se studnou', 37, 450000, 1250000, 15000, 106, 111, 'otevrena', 'poptavkova', 3, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 02:01:18', NULL);
INSERT INTO public.aukce VALUES (38, 'Hrad Špilberk', 38, 150000000, 150000000, 5000000, 106, 110, 'otevrena', 'nabidkova', 8, 'probihajici', NULL, '2021-11-18 01:01:18', '2022-01-05 01:01:18', NULL);
INSERT INTO public.aukce VALUES (39, 'Dřevěná chatka', 39, 120000, 120000, 5000, 106, 109, 'otevrena', 'nabidkova', 1, 'probihajici', NULL, '2021-11-18 01:01:18', '2022-01-05 04:01:18', NULL);
INSERT INTO public.aukce VALUES (40, 'Betonový bunkr', 40, 350000, 350000, 10000, 106, 110, 'otevrena', 'nabidkova', 1, 'probihajici', NULL, '2021-11-20 01:01:18', '2022-01-09 04:01:18', NULL);
INSERT INTO public.aukce VALUES (41, 'Vinný sklípek', 41, 200000, 200000, 15000, 106, 107, 'otevrena', 'nabidkova', 2, 'probihajici', NULL, '2021-11-18 01:01:18', '2021-12-30 01:01:18', NULL);
INSERT INTO public.aukce VALUES (42, 'Dětské hřiště', 42, 650000, 650000, 15000, 106, 108, 'otevrena', 'nabidkova', 3, 'probihajici', NULL, '2021-10-06 01:01:18', '2021-10-20 01:01:18', NULL);
INSERT INTO public.aukce VALUES (43, 'Vinotéka', 43, 1800000, 1800000, 20000, 108, 110, 'otevrena', 'nabidkova', 3, 'probihajici', NULL, '2021-10-06 01:06:25', '2021-10-20 01:06:25', NULL);
INSERT INTO public.aukce VALUES (44, 'Kostel', 44, 3500000, 3500000, 150000, 108, 109, 'otevrena', 'nabidkova', 1, 'probihajici', NULL, '2021-10-06 01:06:25', '2021-10-20 01:06:25', NULL);


--
-- TOC entry 3057 (class 0 OID 58843)
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
INSERT INTO public.tag VALUES (63, 'Vinný sklep');
INSERT INTO public.tag VALUES (64, 'Hřiště');
INSERT INTO public.tag VALUES (67, 'Vinotéka');
INSERT INTO public.tag VALUES (68, 'Kostel');


--
-- TOC entry 3058 (class 0 OID 58851)
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
INSERT INTO public.aukce_tag VALUES (38, 55);
INSERT INTO public.aukce_tag VALUES (38, 60);
INSERT INTO public.aukce_tag VALUES (38, 34);
INSERT INTO public.aukce_tag VALUES (38, 4);
INSERT INTO public.aukce_tag VALUES (39, 53);
INSERT INTO public.aukce_tag VALUES (39, 56);
INSERT INTO public.aukce_tag VALUES (40, 57);
INSERT INTO public.aukce_tag VALUES (41, 36);
INSERT INTO public.aukce_tag VALUES (41, 63);
INSERT INTO public.aukce_tag VALUES (42, 64);
INSERT INTO public.aukce_tag VALUES (42, 59);
INSERT INTO public.aukce_tag VALUES (43, 67);
INSERT INTO public.aukce_tag VALUES (43, 58);
INSERT INTO public.aukce_tag VALUES (43, 28);
INSERT INTO public.aukce_tag VALUES (43, 68);
INSERT INTO public.aukce_tag VALUES (44, 68);
INSERT INTO public.aukce_tag VALUES (44, 60);


--
-- TOC entry 3060 (class 0 OID 58882)
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
INSERT INTO public.prihoz VALUES (107, 40, 350000, NULL);
INSERT INTO public.prihoz VALUES (100, 40, 362000, NULL);
INSERT INTO public.prihoz VALUES (101, 41, 200000, NULL);
INSERT INTO public.prihoz VALUES (103, 41, 215000, NULL);
INSERT INTO public.prihoz VALUES (103, 41, 230000, NULL);
INSERT INTO public.prihoz VALUES (111, 41, 250000, NULL);
INSERT INTO public.prihoz VALUES (106, 43, 1800000, NULL);
INSERT INTO public.prihoz VALUES (110, 43, 1900000, NULL);
INSERT INTO public.prihoz VALUES (111, 43, 1920000, NULL);
INSERT INTO public.prihoz VALUES (102, 43, 1960000, NULL);
INSERT INTO public.prihoz VALUES (101, 40, 350000, NULL);
INSERT INTO public.prihoz VALUES (111, 40, 370000, NULL);
INSERT INTO public.prihoz VALUES (102, 42, 650000, NULL);
INSERT INTO public.prihoz VALUES (72, 42, 675000, NULL);
INSERT INTO public.prihoz VALUES (107, 42, 700000, NULL);


--
-- TOC entry 3059 (class 0 OID 58866)
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
INSERT INTO public.ucastnik VALUES (37, 109, true);
INSERT INTO public.ucastnik VALUES (37, 1, true);
INSERT INTO public.ucastnik VALUES (37, 7, true);
INSERT INTO public.ucastnik VALUES (37, 21, true);
INSERT INTO public.ucastnik VALUES (37, 60, true);
INSERT INTO public.ucastnik VALUES (38, 60, true);
INSERT INTO public.ucastnik VALUES (38, 40, true);
INSERT INTO public.ucastnik VALUES (38, 1, true);
INSERT INTO public.ucastnik VALUES (38, 7, true);
INSERT INTO public.ucastnik VALUES (38, 21, true);
INSERT INTO public.ucastnik VALUES (38, 61, true);
INSERT INTO public.ucastnik VALUES (38, 62, true);
INSERT INTO public.ucastnik VALUES (38, 63, true);
INSERT INTO public.ucastnik VALUES (39, 7, true);
INSERT INTO public.ucastnik VALUES (39, 108, true);
INSERT INTO public.ucastnik VALUES (1, 108, true);
INSERT INTO public.ucastnik VALUES (6, 108, true);


--
-- TOC entry 3061 (class 0 OID 58900)
-- Dependencies: 213
-- Data for Name: web_session; Type: TABLE DATA; Schema: public; Owner: majer
--



--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 203
-- Name: auction_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.auction_seq', 2000, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 205
-- Name: object_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.object_seq', 4000, false);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 204
-- Name: tag_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.tag_seq', 3000, false);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_seq; Type: SEQUENCE SET; Schema: public; Owner: majer
--

SELECT pg_catalog.setval('public.user_seq', 1000, false);


-- Completed on 2021-11-29 18:27:45 CET

--
-- PostgreSQL database dump complete
--

