from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL
from getpass import getpass

server_name = "localhost"
database_name = "BokhandelDB"
user_name = "sa"
pwd = getpass("Password: ")

connection_string = (
    f"DRIVER=ODBC Driver 18 for SQL Server;"
    f"Server={server_name};"
    f"Database={database_name};"
    f"UID={user_name};"
    f"PWD={pwd};"
    f"TrustServerCertificate=yes;"
    f"Encrypt=no;"
)

url_string = URL.create(
    "mssql+pyodbc",
    query={"odbc_connect": connection_string}
)

engine = create_engine(url_string)

with engine.connect() as connection:
    print(f"Ansluten till {database_name}")


search_text = input("Sök boktitel: ")

query = text("""
SELECT
    b.Titel,
    b.ISBN13,
    bu.Namn,
    bu.Stad,
    ISNULL(ls.Antal, 0) AS Antal
FROM Böcker b
CROSS JOIN Butiker bu
LEFT JOIN Lagersaldo ls
    ON b.ISBN13 = ls.ISBN13
    AND bu.ButikID = ls.ButikID
WHERE b.Titel LIKE :search_text
ORDER BY b.Titel, bu.Namn;
""")

with engine.connect() as connection:
    result = connection.execute(query, {"search_text": f"%{search_text}%"})

    for row in result:
        print(f"{row.Titel} | {row.ISBN13} | {row.Namn} i {row.Stad}: {row.Antal} st")
        