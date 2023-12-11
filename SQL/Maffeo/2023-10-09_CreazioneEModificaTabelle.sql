CREATE DATABASE BUZZI;

USE BUZZI;

CREATE TABLE IF NOT EXISTS Studenti (
    CodFisc VARCHAR(16) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    data_nascita DATE NOT NULL,
    via VARCHAR(100) NOT NULL,
    num_civico VARCHAR(10) NOT NULL,
    città VARCHAR(50) NOT NULL
);

INSERT INTO Studenti (CodFisc, Nome, Cognome, data_nascita, via, num_civico, città)
VALUES
    ('CF1', 'Nome1', 'Cognome1', '2000-01-01', 'Via1', '1', 'Città1'),
    ('CF2', 'Nome2', 'Cognome2', '2001-02-02', 'Via2', '2', 'Città2'),
    ('CF3', 'Nome3', 'Cognome3', '2002-03-03', 'Via3', '3', 'Città3'),
    ('CF4', 'Nome4', 'Cognome4', '2003-04-04', 'Via4', '4', 'Città4');

ALTER TABLE Studenti
ADD classe VARCHAR(10);

INSERT INTO Studenti (CodFisc, Nome, Cognome, data_nascita, via, num_civico, città, classe)
VALUES
    ('CF5', 'Nome5', 'Cognome5', '2004-05-05', 'Via5', '5', 'Città5', '4Q'),
    ('CF6', 'Nome6', 'Cognome6', '2005-06-06', 'Via6', '6', 'Città6', '3Q');

ALTER TABLE Studenti
ALTER COLUMN classe SET DEFAULT '5Q';

INSERT INTO Studenti (CodFisc, Nome, Cognome, data_nascita, via, num_civico, città)
VALUES
    ('CF7', 'Nome7', 'Cognome7', '2006-07-07', 'Via7', '7', 'Città7'),
    ('CF8', 'Nome8', 'Cognome8', '2007-08-08', 'Via8', '8', 'Città8'),
    ('CF9', 'Nome9', 'Cognome9', '2008-09-09', 'Via9', '9', 'Città9');
