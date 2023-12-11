USE classicmodels;

-- 1)Per ogni linea prodotto, trovare quanti prodotti diversi ci sono
SELECT productLine, COUNT(DISTINCT productCode) AS differentProducts
FROM products
GROUP BY productLine;

-- 2)Per ogni linea prodotto, contare il numero totale di prodotti presenti
SELECT productLine, COUNT(productCode) AS totalProducts
FROM products
GROUP BY productLine;

-- 3)Trovare il totale pagato da ciascun cliente
SELECT customerName, SUM(amount) FROM customers
INNER JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customerName;

-- 4)Trovare il totale pagato da ciascun cliente ogni anno
SELECT customerName, YEAR(paymentDate), SUM(amount) FROM customers
INNER JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customerName, YEAR(paymentDate);

-- 5)Per i prodotti che sono stati ordinati almeno 10 volte, trovare il numero di ordini in cui compaiono.
-- Ordinare l'output dal più ordinato al meno ordinato. (non importa la quantità ordinata)
SELECT productName, COUNT(orderNumber) AS orders
FROM orderdetails
JOIN products ON orderdetails.productCode = products.productCode
GROUP BY productName;

-- 6)Per ogni linea prodotto, trovare il prezzo medio di acquisto
SELECT productLine, AVG(buyPrice) AS avgBuyPrice
FROM products
GROUP BY productLine;

-- 7)Stampare tutti i dati dei 10 pagamenti effettuati dai clienti con importo più basso
SELECT * FROM payments
ORDER BY amount
LIMIT 10;

-- 8)Calcolare quanti pezzi in tutto sono stati ordinati
SELECT SUM(quantityOrdered) AS totalOrdered
FROM orderdetails;

-- 9)Trovare nome, venditore, e descrizione di tutti i prodotti con scala 1:12
SELECT productName, productVendor, productDescription
FROM products
WHERE productScale = '1:12';

-- 10)Trovare codice, linea prodotto, descrizione e quantità in magazzino dei prodotti che tra le
-- caratteristiche presentano “steering function” (suggerimento: cercare nel campo descrizione)
SELECT productCode, productLine, productDescription, quantityInStock
FROM products
WHERE productDescription LIKE '%steering function%';

-- 11)Stampare check number e importo dei pagamenti effettuati nel secondo semestre del 2004, se
-- maggiori di 15000 dollari:
SELECT checkNumber, amount
FROM payments
WHERE YEAR(paymentDate) = 2004 AND MONTH(paymentDate) > 6 AND amount > 15000;

-- 12) Trovare il numero di ordini effettuati da ogni cliente
SELECT customerNumber, COUNT(orderNumber) AS orders
FROM orders
GROUP BY customerNumber;

-- 13) Trovare il numero di clienti di ogni rappresentante (per i rappresentanti che hanno almeno sei clienti)
SELECT salesRepEmployeeNumber, COUNT(customerNumber) AS customers
FROM customers
GROUP BY salesRepEmployeeNumber;

-- 14) Trovare tutti i clienti i cui rappresentanti hanno un ufficio negli USA
SELECT customerName
FROM customers
WHERE salesRepEmployeeNumber IN (
    SELECT employeeNumber
    FROM employees
    WHERE officeCode IN (
        SELECT officeCode
        FROM offices
        WHERE country = 'USA'
    )
);