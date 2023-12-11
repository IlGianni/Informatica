-- Active: 1698495665559@@127.0.0.1@3306@fatturazione
-- Calcolo del rapporto tra importyo massimo e importo minimo per ciscun cliente
SELECT ragione_sociale, MAX(importo) AS max, MIN(importo) AS min, MAX(importo)/MIN(importo) AS rapporto FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente;

-- Conteggio degli ordini effettuati da ciscun cliente
SELECT ragione_sociale, COUNT(*) AS numero_ordini FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente;

-- Calcolo della media degli importi per cliente e per data
SELECT ragione_sociale, data_ordine, AVG(importo) AS media FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente, data_ordine;

-- Calcolo della media degli importi per cliente
SELECT ragione_sociale, AVG(importo) AS media FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente;

-- Calcolo dell'importo massimo per gli ordini evasi e non evasi
SELECT ID_ordine, MAX(importo) AS massimo FROM ordinativi
    WHERE evaso = 1;
SELECT ID_ordine, MAX(importo) AS massimo FROM ordinativi
    WHERE evaso = 0;

-- Conteggio di quanti ordinativi ci sono per ciascun cliente
SELECT ragione_sociale, COUNT(*) AS numero_ordinativi FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente;

-- Calcolo della media degli importi per ciascun cliente, solo per gli importi maggiori di 50
SELECT ragione_sociale, AVG(importo) AS media FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    WHERE importo > 50
    GROUP BY clienti.ID_cliente;

-- Calcolo dell'importo massimo e minimo per data, solo se l'importo minimo calcolato è maggiore di 20
SELECT data_ordine, MAX(importo) AS massimo, MIN(importo) AS minimo FROM ordinativi
    GROUP BY data_ordine
    HAVING minimo > 20;

-- Calcolo per ogni cliente, dell'importo minimo, solo se è minore di 50
SELECT ragione_sociale, MIN(importo) AS minimo FROM ordinativi
    INNER JOIN clienti ON ordinativi.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente
    HAVING minimo < 50;
