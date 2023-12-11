-- Active: 1698495665559@@127.0.0.1@3306@fatturazione
-- Elenco di tutti gli articoli fatturati nell'anno 2013
SELECT descrizione FROM articoli
    INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    WHERE fatture.data LIKE '%2013';

-- Elenco di tutte le fatture emesse per i clienti di Como o Milano
SELECT numero FROM fatture
    INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    WHERE clienti.citta = 'Como' OR clienti.citta = 'Milano';
    
-- Elenco dei prezzi unitari degli articoli che sono stati venduti in più di 5 pezzi allo stesso cliente
SELECT prezzo_unitario FROM articoli
    INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    WHERE clienti.ID_cliente = fatture.id_cliente AND fatture_articoli.id_articolo = articoli.ID_articolo
    GROUP BY articoli.ID_articolo
    HAVING COUNT(articoli.ID_articolo) > 5;

-- Conteggio degli articoli venduti (SUM(quantità)) nelle fatture del mese ottobre (usa la funzione MONTH(10)).
SELECT SUM(quantita), fatture_articoli.id_fattura FROM fatture_articoli
    INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    WHERE fatture.data LIKE '%/10/%';

-- Calcolo del prezzo massimo e minimo per cliente, per i soli clienti di Bologna, Como e Milano
SELECT clienti.ragione_sociale, MAX(prezzo_unitario), MIN(prezzo_unitario) FROM articoli
    INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    WHERE clienti.citta = 'Bologna' OR clienti.citta = 'Como' OR clienti.citta = 'Milano'
    GROUP BY clienti.ID_cliente;

-- Conteggio di quanti articoli sono stati venduti a ciascun cliente
SELECT clienti.ragione_sociale, COUNT(articoli.ID_articolo) AS numero_articoli FROM articoli
    INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    GROUP BY clienti.ID_cliente;

-- Calcolo del rapporto tra prezzo massimo e minimo per ciascun articolo
SELECT descrizione, MAX(prezzo_unitario*quantita)/MIN(prezzo_unitario*quantita) AS rapporto FROM articoli, fatture_articoli
    WHERE articoli.ID_articolo = fatture_articoli.id_articolo
    GROUP BY articoli.ID_articolo;

-- Calcolo della media del prezzo unitario degli articoli venduti al cliente “nobis”
SELECT AVG(prezzo_unitario) as media_prezzo FROM articoli
    INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    WHERE clienti.ragione_sociale = 'Nobis';

-- Elenco, per ogni articolo di prezzo unitario compreso tra 180 e 350 euro, del cliente e della data in cui è stato venduto, anche per prodotti mai venduti, usando quindi una congiunzione sinistra
SELECT descrizione, clienti.ragione_sociale, fatture.data FROM articoli
    LEFT JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    LEFT JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    LEFT JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    WHERE prezzo_unitario BETWEEN 180 AND 350;

-- Elenco, per ogni articolo di prezzo unitario compreso tra 180 e 350 euro, del cliente e della data in cui è stato venduto, ma per i soli articoli che sono stati effettivamente fatturati
SELECT descrizione, clienti.ragione_sociale, fatture.data FROM articoli
    LEFT JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
    LEFT JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
    LEFT JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
    WHERE ragione_sociale IS NOT NULL AND data IS  NOT NULL AND prezzo_unitario BETWEEN 180 AND 350;
