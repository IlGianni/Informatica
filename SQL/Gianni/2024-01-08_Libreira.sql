USE Libreria

-- 1] Elencare i clienti che hanno ordinato il libro più costoso.
SELECT Nome, Cognome, Titolo, Prezzo FROM Clienti
INNER JOIN Ordini ON Ordini.ID_Cliente = Clienti.ID_Cliente
INNER JOIN Dettagli_Ordini ON Dettagli_Ordini.ID_Ordine = Ordini.ID_Ordine
INNER JOIN Libri ON Libri.ID_Libro = Dettagli_Ordini.ID_Libro
WHERE Prezzo = (SELECT MAX(Prezzo) FROM Libri)

-- 2] Trovare i libri il cui prezzo è superiore alla media del prezzo dei libri.
SELECT Titolo, Prezzo FROM Libri
WHERE Prezzo > (SELECT AVG(Prezzo) FROM Libri)

-- 3] Elencare i titoli dei libri che non sono mai stati ordinati.
SELECT Titolo FROM Libri
WHERE ID_Libro NOT IN (SELECT ID_Libro FROM Dettagli_Ordini)

-- 4] Elencare i libri che sono stati ordinati esattamente due volte
SELECT Titolo From libri
WHERE ID_Libro IN (SELECT ID_Libro FROM Dettagli_Ordini
GROUP BY ID_Libro
HAVING COUNT(ID_Libro) = 2)

-- 5] Trovare i clienti che hanno ordinato solo libri pubblicati dopo il 1850
SELECT Nome, Cognome FROM Clienti
WHERE ID_Cliente IN (SELECT ID_Cliente FROM Ordini
INNER JOIN Dettagli_Ordini ON Dettagli_Ordini.ID_Ordine = Ordini.ID_Ordine
INNER JOIN Libri ON Libri.ID_Libro = Dettagli_Ordini.ID_Libro
WHERE Anno_Pubblicazione > 1850)
AND ID_Cliente NOT IN (SELECT ID_Cliente FROM Ordini
INNER JOIN Dettagli_Ordini ON Dettagli_Ordini.ID_Ordine = Ordini.ID_Ordine
INNER JOIN Libri ON Libri.ID_Libro = Dettagli_Ordini.ID_Libro
WHERE Anno_Pubblicazione < 1850)

-- 6] Identificare i clienti che non hanno mai ordinato un libro pubblicato prima del 1850
SELECT Nome, Cognome FROM Clienti
WHERE ID_Cliente NOT IN (SELECT ID_Cliente FROM Ordini
INNER JOIN Dettagli_Ordini ON Dettagli_Ordini.ID_Ordine = Ordini.ID_Ordine
INNER JOIN Libri ON Libri.ID_Libro = Dettagli_Ordini.ID_Libro
WHERE Anno_Pubblicazione < 1850)

-- 7] Trovare il titolo del libro più recente ordinato da ogni cliente-- 
SELECT Nome, Cognome, Titolo, Anno_Pubblicazione FROM Clienti
INNER JOIN Ordini ON Ordini.ID_Cliente = Clienti.ID_Cliente
INNER JOIN Dettagli_Ordini ON Dettagli_Ordini.ID_Ordine = Ordini.ID_Ordine
INNER JOIN Libri ON Libri.ID_Libro = Dettagli_Ordini.ID_Libro
WHERE Ordini.Data_Ordine IN (
    SELECT MAX(Data_Ordine) FROM Ordini
    GROUP BY ID_Cliente
)
