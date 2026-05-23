USE BokhandelDB;

GO

Create VIEW TitlarPerFörfattare AS
SELECT
    f.Förnamn + ' ' + f.Efternamn AS Namn,
    DATEDIFF(YEAR, f.Födelsedatum, GETDATE()) AS Ålder,
    CAST(COUNT(DISTINCT bf.ISBN13) AS nvarchar) + 'st' AS Titlar,
    CAST(ISNULL(Sum(ls.Antal * b.Pris), 0) AS nvarchar) + 'kr' AS Lagervärde
FROM Författare f
LEFT JOIN BokFörfattare bf
    ON f.ID = bf.FörfattareId
LEFT JOIN böcker b
    ON bf.ISBN13 = b.ISBN13
LEFT JOIN LagerSaldo ls
    ON b.ISBN13 = ls.ISBN13
GROUP BY
    f.Förnamn,
    f.Efternamn,
    f.Födelsedatum
;

GO

SELECT * FROM TitlarPerFörfattare;

GO

/*
KundOrderStatistik är en vy som kan användas för att analysera
information kring kunders köpbeteende, info för att införa t ex ett lojalitetsprogram
och för att lättare kunna marknadsföra specifikt till vissa kunder.
*/


CREATE VIEW KundOrderStatistik AS
SELECT
    k.Förnamn + ' ' + k.Efternamn AS Kund,
    COUNT(DISTINCT o.OrderID) AS AntalOrdrar,
    ISNULL(SUM(orad.Antal * orad.Pris), 0) AS Total
FROM Kunder k
LEFT JOIN Ordrar o
    ON k.KundID = o.KundID
LEFT JOIN OrderRader orad
    ON o.OrderId = orad.OrderId
GROUP BY
    k.Förnamn,
    k.Efternamn;

GO

SELECT * FROM KundOrderStatistik;