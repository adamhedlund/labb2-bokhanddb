USE BokhandelDB;

GO

-- Förnamn, Efternamn, Födelsedatum
INSERT INTO Författare
VALUES
('J.R.R.', 'Tolkien', '1892-01-03'),
('George', 'Orwell', '1903-06-25'),
('Astrid', 'Lindgren', '1907-11-14'),
('Neil', 'Gaiman', '1960-11-10');

GO

-- (Namn)
INSERT INTO Förlag
VALUES
('Penguin'),
('HarperCollins'),
('Norstedts');

GO

-- (Namn, Stad, Adress)
INSERT INTO Butiker
VALUES
('Bokhörnan', 'Göteborg', 'Avenyn 10'),
('Stadsbiblioteket Shop', 'Stockholm', 'Drottninggatan 25'),
('Läslustan', 'Malmö', 'Storgatan 7');

GO

-- (Förnamn, Efternamn, Email)
INSERT INTO Kunder
VALUES
('Adam', 'Hedlund', 'adam@email.com'),
('Anna', 'Svensson', 'anna@email.com'),
('Erik', 'Johansson', 'erik@email.com');

GO

-- (Namn)
INSERT INTO Kategorier
VALUES
('Fantasy'),
('Sci-Fi'),
('Barnbok'),
('Dystopi'),
('Äventyr');

GO

-- (ISBN13, Titel, Pris, Språk, Utgivningsdatum, FörlagID)
INSERT INTO Böcker
VALUES
('9780261103573', 'The Lord of the Rings', 199.00, 'EN', '1954-07-29', 2),

('9780451524935', '1984', 129.00, 'EN', '1949-06-08', 1),

('9789129688313', 'Pippi Långstrump', 99.00, 'SV', '1945-11-26', 3),

('9780060853983', 'Good Omens', 159.00, 'EN', '1990-05-01', 2),

('9780261103283', 'The Hobbit', 149.00, 'EN', '1937-09-21', 2),

('9789129697223', 'Bröderna Lejonhjärta', 119.00, 'SV', '1973-09-01', 3),

('9780451526342', 'Animal Farm', 109.00, 'EN', '1945-08-17', 1),

('9780062225672', 'American Gods', 179.00, 'EN', '2001-06-19', 2),

('9789129705928', 'Mio min Mio', 89.00, 'SV', '1954-01-01', 3),

('9780261102217', 'The Silmarillion', 169.00, 'EN', '1977-09-15', 2);

GO

-- (ISBN13, FörfattareId)
INSERT INTO BokFörfattare
VALUES
('9780261103573', 1),
('9780451524935', 2),
('9789129688313', 3),
('9780060853983', 1),
('9780060853983', 4),
('9780261103283', 1),
('9789129697223', 3),
('9780451526342', 2),
('9780062225672', 4),
('9789129705928', 3),
('9780261102217', 1);

GO

-- (ISBN13, KategoriID)
INSERT INTO BokKategori
VALUES
('9780261103573', 1),
('9780261103573', 5),

('9780451524935', 4),

('9789129688313', 3),

('9780060853983', 1),
('9780060853983', 5),

('9780261103283', 1),
('9780261103283', 5),

('9789129697223', 3),
('9789129697223', 5),

('9780451526342', 4),

('9780062225672', 1),

('9789129705928', 3),
('9789129705928', 5),

('9780261102217', 1);

GO

-- (ButidID, ISBN13, Antal)
INSERT INTO LagerSaldo
VALUES
(1, '9780261103573', 8),
(1, '9780451524935', 5),
(1, '9789129688313', 12),

(2, '9780060853983', 6),
(2, '9780261103283', 10),
(2, '9789129697223', 4),

(3, '9780451526342', 7),
(3, '9780062225672', 3),
(3, '9789129705928', 9),
(3, '9780261102217', 2);

GO

-- (KundID)
INSERT INTO Ordrar
VALUES
(1),
(2),
(3);

GO

--(OrderId, ISBN13, Antal, Pris)
INSERT INTO OrderRader
VALUES
(1, '9780261103573', 1, 199.00),
(1, '9780451524935', 2, 129.00),

(2, '9789129688313', 1, 99.00),

(3, '9780060853983', 1, 159.00),
(3, '9780261103283', 1, 149.00);

GO