Labb2 – BokhandelDB

Databasprojekt i SQL Server för en bokhandel med flera butiker.

Funktionalitet

Projektet innehåller:

Normaliserad databasdesign (3NF)
Primärnycklar och främmande nycklar
Many-to-many relationer
Views
Stored procedure
ER-diagram
Python-program med SQLAlchemy för boksökning
SQL

Projektet innehåller SQL-skript för:

Skapande av databas
Tabeller och relationer
Testdata
Views
Stored procedures
Views
TitlarPerFörfattare
KundOrderStatistik
Stored Procedure
FlyttaBok

Proceduren används för att flytta böcker mellan butiker på ett integritetssäkert sätt.

Python

main.py använder SQLAlchemy för att:

Ansluta till databasen
Göra fritextsökningar på boktitlar
Visa lagersaldo för varje butik
ER-diagram

ERD finns i:

ERD.png
Backup

Färdig databasbackup:

AdamHedlund.bak
Tekniker
SQL Server
Python
SQLAlchemy
pyodbc
Författare

Adam Hedlund