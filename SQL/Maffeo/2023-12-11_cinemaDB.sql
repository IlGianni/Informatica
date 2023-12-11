/*
ATTORE (CodiceAttore, Cognome, Nome, Sesso, AnnoNascita, Nazionalita)
FILM (CodiceFilm, Titolo, AnnoProduzione, LuogoProduzione, CognomeRegista, Genere)
CINEMA (CodiceCinema, Nome, Posti, Citta)
INTERPRETA (CodiceAttore *, CodiceFilm*, Personaggio)
PROGRAMMATO (CodiceFilm*, CodiceCinema*, Incasso, DataProiezione)
*/

-- 1. Seleziona i Film in cui recitano sia Clooney sia Pitt
SELECT DISTINCT F.Titolo
FROM FILM F, INTERPRETA I1, INTERPRETA I2, ATTORE A1, ATTORE A2
WHERE F.CodiceFilm = I1.CodiceFilm AND F.CodiceFilm = I2.CodiceFilm
AND I1.CodiceAttore = A1.CodiceAttore AND I2.CodiceAttore = A2.CodiceAttore
AND A1.Cognome = 'Clooney' AND A2.Cognome = 'Pitt';

-- 2. Seleziona i titoli dei film dove recita Clooney
SELECT DISTINCT F.Titolo
FROM FILM F, INTERPRETA I, ATTORE A
WHERE F.CodiceFilm = I.CodiceFilm AND I.CodiceAttore = A.CodiceAttore
AND A.Cognome = 'Clooney';

-- 3. Seleziona i titoli dei film dove recitano o Clooney o Pitt
SELECT DISTINCT F.Titolo
FROM FILM F, INTERPRETA I, ATTORE A
WHERE F.CodiceFilm = I.CodiceFilm AND I.CodiceAttore = A.CodiceAttore
AND (A.Cognome = 'Clooney' OR A.Cognome = 'Pitt');

-- 4. Seleziona i titoli dei film che non sono mai stati proiettati a Bologna
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE F.`CodiceFilm` NOT IN (
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna');

-- 5. Seleziona i titoli dei film che sono stati proiettati a Bologna
SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna';

-- 6. Seleziona tutti i titoli e le città in cui sono stati proiettati i film NON proiettati a Bologna
SELECT DISTINCT F.Titolo, C.Citta FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE F.`CodiceFilm` NOT IN (
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna');

-- 7. Seleziona i titoli di tutti i film proiettati SOLO a Bologna
SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE F.`CodiceFilm` NOT IN (
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta <> 'Bologna') AND F.`CodiceFilm` NOT IN (
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
INNER JOIN Cinema C ON P.CodiceCinema = C.CodiceCinema
WHERE C.Citta = 'Bologna');

-- 8. Seleziona i titoli dei film (e il loro incasso) Che hanno avuto un incasso > media degli incassi
SELECT DISTINCT F.Titolo, P.Incasso FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
WHERE P.Incasso > (
SELECT AVG(P.Incasso) FROM Programmato P);

-- 9. Seleziona i film cha hanno avuto un incasso inferiore a 1000€
SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
GROUP BY F.Titolo
WHERE P.Incasso < 1000;

-- 10. Seleziona i titoli dei film che non hanno mai avuto una proiezione con incasso inferiore a 1000€
SELECT DISTINCT F.Titolo FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
WHERE F.`CodiceFilm` NOT IN (
SELECT DISTINCT F.`CodiceFilm` FROM Film F
INNER JOIN Programmato P ON F.CodiceFilm = P.CodiceFilm
WHERE P.Incasso < 1000);

-- 11. Seleziona il nome e il cognome di tutti gli attori di nazionalità INGLESE che non hanno mai interpretato ruoli nei film di Kubrick
SELECT DISTINCT A.Nome, A.Cognome FROM Attore A
INNER JOIN Interpreta I ON A.CodiceAttore = I.CodiceAttore
INNER JOIN Film F ON I.CodiceFilm = F.CodiceFilm
WHERE A.Nazionalita = 'Inglese' AND F.CognomeRegista <> 'Kubrick';