-- Creo il database fatturazione
CREATE DATABASE IF NOT EXISTS `fatturazione`;
USE `fatturazione`;

-- Creo la tabella articoli
CREATE TABLE IF NOT EXISTS `articoli` (
  `ID_articolo` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(17) DEFAULT NULL,
  `prezzo_unitario` float DEFAULT NULL,
  `id_fattura` int(11) DEFAULT NULL,
  `importo` varchar(6) DEFAULT NULL,
  `evaso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_articolo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Popolo la tabella articoli
REPLACE INTO `articoli` (`ID_articolo`, `descrizione`, `prezzo_unitario`, `id_fattura`, `importo`, `evaso`) VALUES
	(1, 'penna biro', 2.2, NULL, NULL, NULL),
	(2, 'stilografica', 1.9, NULL, NULL, NULL),
	(3, 'gomma', 0.9, NULL, NULL, NULL),
	(4, 'busta trasparente', 2.5, NULL, NULL, NULL),
	(5, 'risma A4', 9.6, NULL, NULL, NULL);

-- Creo la tabella clienti
CREATE TABLE IF NOT EXISTS `clienti` (
  `ID_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `ragione_sociale` varchar(22) DEFAULT NULL,
  `indirizzo` varchar(22) DEFAULT NULL,
  `citta` varchar(7) DEFAULT NULL,
  `cod_fiscale` varchar(17) DEFAULT NULL,
  `partita_iva` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Popolo la tabella clienti
REPLACE INTO `clienti` (`ID_cliente`, `ragione_sociale`, `indirizzo`, `citta`, `cod_fiscale`, `partita_iva`) VALUES
	(1, 'La casa del pc', 'via mazzini 3', 'Milano', '1002003001', '1002003001'),
	(2, 'Nobis', 'via verdi 121', 'Torino', '1002003011', '1002003011'),
	(3, 'computer compound 3', 'via colombo 98', 'Genova', '1004003011', '1004003011'),
	(4, 'computer compound 1', 'via benbelli 45', 'Como', '1052003011', '1052003011'),
	(5, 'Nobis BIS', 'via cortini 678', 'Milano', '1032003011', '1032003011'),
	(6, 'il computer', 'p.zza grande 1', 'Bologna', '1012003011', '1012003011'),
	(7, 'Rossi Gino', 'Via Roma,33', 'Como', 'RSSGNN68H111C933T', 'NULL');

-- Creo la tabella fatture
CREATE TABLE IF NOT EXISTS `fatture` (
  `ID_fattura` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `pagata` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_fattura`),
  KEY `a_fatture_FK` (`id_cliente`),
  CONSTRAINT `a_fatture_FK` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`ID_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Popolo la tabella fatture
REPLACE INTO `fatture` (`ID_fattura`, `numero`, `data`, `id_cliente`, `pagata`) VALUES
	(1, 11, '12/07/2013', 1, NULL),
	(2, 12, '01/08/2013', 2, NULL),
	(3, 13, '20/12/2013', 1, NULL),
	(4, 1, '29/05/2014', 1, NULL),
	(5, 2, '03/11/2014', 2, NULL),
	(6, 1, '21/02/2015', 3, NULL),
	(7, 2, '22/04/2015', 3, NULL),
	(8, 100, '28/01/2016', 5, NULL),
	(9, 101, '22/06/2016', 5, NULL),
	(10, 1, '09/04/2017', 5, NULL),
	(11, 2, '11/11/2017', 5, NULL),
	(12, 3, '02/04/2017', 5, NULL),
	(13, 10, '05/09/2019', 5, NULL),
	(14, 12, '10/10/2019', 1, NULL),
	(15, 55, '01/10/2020', 2, NULL),
	(16, 54, '10/10/2021', 2, NULL),
	(17, 56, '15/10/2021', 6, NULL),
	(18, 78, '16/10/2021', 6, NULL);

-- Creo la tabella fatture_articoli
CREATE TABLE IF NOT EXISTS `fatture_articoli` (
  `id_fattura` int(11) NOT NULL,
  `id_articolo` int(11) NOT NULL,
  `quantita` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fattura`,`id_articolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Popolo la tabella fatture_articoli
REPLACE INTO `fatture_articoli` (`id_fattura`, `id_articolo`, `quantita`) VALUES
	(1, 2, 1),
	(1, 3, 5),
	(1, 4, 2),
	(1, 14, 2),
	(1, 16, 14),
	(2, 1, 6),
	(2, 2, 6),
	(2, 12, 1),
	(3, 13, 10),
	(3, 14, 25),
	(4, 2, 1),
	(4, 3, 1),
	(5, 15, 1),
	(5, 16, 2),
	(6, 12, 10),
	(7, 1, 9),
	(8, 1, 1),
	(9, 2, 1),
	(10, 4, 10),
	(11, 2, 1),
	(12, 3, 23),
	(13, 1, 1),
	(13, 2, 1),
	(14, 15, 2),
	(15, 14, 3),
	(16, 3, 5),
	(16, 4, 3);

-- Creo la tabella ordini
CREATE TABLE IF NOT EXISTS `ordinativi` (
  `ID_ordine` int(11) NOT NULL AUTO_INCREMENT,
  `data_ordine` varchar(10) DEFAULT NULL,
  `importo` int(11) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `evaso` tinyint(1) DEFAULT 0,
  `id_venditore` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`ID_ordine`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Popolo la tabella ordini
REPLACE INTO `ordinativi` (`ID_ordine`, `data_ordine`, `importo`, `id_cliente`, `evaso`, `id_venditore`) VALUES
	(1, '03/03/2021', 125, 1, 1, 0),
	(2, '03/04/2021', 150, 1, 0, 0),
	(3, '03/04/2021', 12, 1, 1, 0),
	(4, '04/04/2021', 6, 1, 0, 0),
	(5, '05/04/2021', 18, 2, 1, 0),
	(6, '06/04/2021', 63, 3, 0, 0),
	(7, '13/04/2011', 12, 3, 1, 0),
	(8, '14/04/2021', 25, 1, 0, 0),
	(9, '03/05/2021', 30, 3, 0, 0),
	(10, '11/05/2021', 35, 4, 1, 0),
	(11, '13/05/2021', 15, 4, 0, 0),
	(12, '22/06/2021', 25, 1, 0, 0);

-- Creo la tabella venditori
CREATE TABLE IF NOT EXISTS `venditori` (
  `ID_venditore` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `qualifica` varchar(50) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_venditore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Elenco di tutti gli articoli fatturati nell'anno 2013
SELECT articoli.descrizione, articoli.prezzo_unitario, articoli.importo, articoli.evaso, fatture.data
FROM articoli
INNER JOIN fatture ON articoli.id_fattura = fatture.ID_fattura
WHERE fatture.data LIKE '%2013%';

-- Elenco di tutte le fatture emesse per clienti di Como e Milano
SELECT clienti.ragione_sociale, clienti.citta, fatture.numero, fatture.data
FROM clienti
INNER JOIN fatture ON clienti.ID_cliente = fatture.id_cliente
WHERE clienti.citta = 'Como' OR clienti.citta = 'Milano';

-- Elenco dei prezzi unitari degli articoli che sono stati venduti in più di 5 pezzi allo stessa cliente
SELECT articoli.prezzo_unitario, fatture_articoli.quantita, clienti.ragione_sociale
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
WHERE fatture_articoli.quantita > 5;

-- Conteggio degli articoli venduti nelle fatture del mese ottobre
SELECT articoli.descrizione, articoli.prezzo_unitario, fatture_articoli.quantita, fatture.data
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
WHERE MONTH(fatture.data) = 10;

-- Calcolo del prezzo massimo e minimo per cliente, per i soli clienti di Bologna, Como e Milano.
SELECT articoli.prezzo_unitario, clienti.ragione_sociale, clienti.citta
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
WHERE clienti.citta = 'Bologna' OR clienti.citta = 'Como' OR clienti.citta = 'Milano';

-- Conteggio di quanti articoli sono stati venduti a ciascun cliente
SELECT articoli.descrizione, articoli.prezzo_unitario, fatture_articoli.quantita, clienti.ragione_sociale
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente;

-- Calcolo del rapporto tra prezzo massimo e minimo per ciascun articolo
SELECT articoli.descrizione, articoli.prezzo_unitario, fatture_articoli.quantita, clienti.ragione_sociale
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente;

-- Calcolo della media del prezzo unitario degli articoli venduti al cliente "nobis"
SELECT articoli.descrizione, articoli.prezzo_unitario, fatture_articoli.quantita, clienti.ragione_sociale
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
WHERE clienti.ragione_sociale = 'Nobis';

-- Elenco, per ogni articolo di prezzo unitario compreso tra 180 e 350 euro, del cliente e della data in cui è stato venduto, anche per prodotti mai venduti, usando quindi una congiunzione sinistra.
SELECT articoli.descrizione, articoli.prezzo_unitario, fatture_articoli.quantita, clienti.ragione_sociale
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
WHERE articoli.prezzo_unitario BETWEEN 180 AND 350;

-- Elenco, per ogni articolo di prezzo unitario compreso tra 180 e 350 euro, del cliente e della data in cui è stato venduto, ma per i soli articoli che sono stati effettivamente fatturati
SELECT articoli.descrizione, articoli.prezzo_unitario, fatture_articoli.quantita, clienti.ragione_sociale
FROM articoli
INNER JOIN fatture_articoli ON articoli.ID_articolo = fatture_articoli.id_articolo
INNER JOIN fatture ON fatture_articoli.id_fattura = fatture.ID_fattura
INNER JOIN clienti ON fatture.id_cliente = clienti.ID_cliente
WHERE articoli.prezzo_unitario BETWEEN 180 AND 350;