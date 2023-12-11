-- 1] Seleziona i Film in cui recitano sia Clooney sia Pitt
SELECT DISTINCT F.Titolo FROM Film F 
INNER JOIN interpreta I ON F.CodiceFilm = I.CodiceFilm
INNER JOIN Attore A ON I.CodiceAttore = A.CodiceAttore
WHERE A.Nome = 'George' AND A.Cognome = 'Clooney' 
AND F.Titolo IN (SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN interpreta I ON F.CodiceFilm = I.CodiceFilm
INNER JOIN Attore A ON I.CodiceAttore = A.CodiceAttore
WHERE A.Nome = 'Brad' AND A.Cognome = 'Pitt')

-- 2] Seleziona i titoli dei film dove recita Clooney
SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN interpreta I ON F.CodiceFilm = I.CodiceFilm
INNER JOIN Attore A ON I.CodiceAttore = A.CodiceAttore
WHERE A.Nome = 'George' AND A.Cognome = 'Clooney'

-- 3] Seleziona i titoli dei film dove recitano o Clooney o Pitt
SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN interpreta I ON F.CodiceFilm = I.CodiceFilm
INNER JOIN Attore A ON I.CodiceAttore = A.CodiceAttore
WHERE A.Nome = 'George' AND A.Cognome = 'Clooney'
OR A.Nome = 'Brad' AND A.Cognome = 'Pitt'

-- 4] Seleziona i titoli dei film che non sono mai stati proiettati a Bologna
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE F.`CodiceFilm` NOT IN (SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna')

-- 5] Seleziona i titoli dei film che sono stati proiettati a Bologna
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.`Citta` = 'Bologna'

-- 6] Seleziona tutti i titoli e le città in cui sono stati proiettati i film NON proiettati a Bologna
SELECT DISTINCT F.Titolo, C.Citta FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE F.`CodiceFilm` NOT IN (SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna')

-- 7] Seleziona i titoli di tutti i film proiettati SOLO a Bologna
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE F.`CodiceFilm` IN (SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna') AND F.`CodiceFilm` NOT IN (SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta <> 'Bologna')

-- 8] Seleziona i titoli dei film (e il loro incasso) Che hanno avuto un incasso > media degli incassi
SELECT DISTINCT F.Titolo, SUM(P.incasso) AS SommaIncassi FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
GROUP BY F.Titolo
HAVING SommaIncassi > (SELECT AVG(P.incasso) FROM programmato P)

-- 9] Seleziona i film cha hanno avuto un incasso inferiore a 1000€
SELECT DISTINCT F.Titolo, SUM(P.incasso) AS SommaIncassi FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
GROUP BY F.Titolo
HAVING SommaIncassi < 1000

-- 10] Seleziona i titoli dei film che non hanno mai avuto una proiezione con incasso inferiore a 1000€
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
WHERE F.CodiceFilm IN (SELECT DISTINCT F.CodiceFilm FROM Film F
INNER JOIN programmato P ON F.CodiceFilm = P.CodiceFilm
WHERE P.incasso < 1000)

-- 11] Seleziona il nome e il cognome di tutti gli attori di nazionalità INGLESE che non hanno mai interpretato ruoli nei film di Kubrick
SELECT DISTINCT A.Nome, A.Cognome FROM Attore A
INNER JOIN interpreta I ON A.CodiceAttore = I.CodiceAttore
INNER JOIN Film F ON I.CodiceFilm = F.CodiceFilm
WHERE A.Nazionalita = 'Inglese' AND F.CognomeRegista <> 'Kubrick'
