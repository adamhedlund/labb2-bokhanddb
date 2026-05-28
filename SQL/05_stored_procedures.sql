USE BokhandelDB;

GO

CREATE PROCEDURE FlyttaBok
    @FrånbutikID INT,
    @TillButikID INT,
    @ISBN13 CHAR(13),
    @Antal INT = 1
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    IF @Antal <= 0
    BEGIN
        ROLLBACK;
        THROW 50001, 'Antal måste vara större än 0!', 1;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM LagerSaldo
        Where ButikId = @FrånbutikID
            AND ISBN13 = @ISBN13
            AND Antal >= @Antal
    )
    BEGIN
        ROLLBACK;
        THROW 50002,'Det finns inte tillräckligt många böcker i den butiken!', 1;
    END

    UPDATE LagerSaldo
    SET Antal = Antal - @Antal
    WHERE ButikID = @FrånbutikID
        AND ISBN13 = @ISBN13;

    IF EXISTS (
        SELECT 1
        FROM LagerSaldo
        WHERE ButikID = @TillButikID
            AND ISBN13 = @ISBN13
    )

    BEGIN
        UPDATE LagerSaldo
        SET Antal = Antal + @Antal
        WHERE ButikId = @TillButikID
            AND ISBN13 = @ISBN13;
    END
    ELSE
    BEGIN
        INSERT INTO LagerSaldo (ButikID, ISBN13, Antal)
        VALUES (@TillButikID, @ISBN13, @Antal);
    END

    COMMIT;
END;

GO

-- Stored Procedure: FlyttaBok
/*
BEGIN TRANSACTION;

EXEC FlyttaBok
    @FranButikID = 1,
    @TillButikID = 2,
    @ISBN13 = '9780261103573',
    @Antal = 1;

SELECT *
FROM LagerSaldo
WHERE ISBN13 = '9780261103573';

ROLLBACK;
*/