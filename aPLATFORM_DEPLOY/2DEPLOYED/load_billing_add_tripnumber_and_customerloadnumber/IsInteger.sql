DROP FUNCTION IF EXISTS [dbo].[IsInteger]
GO


CREATE FUNCTION dbo.IsInteger(@SearchString VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT = 0

    IF @SearchString IS NOT NULL
    BEGIN
        IF @SearchString LIKE '[0-9]%'
        BEGIN
            DECLARE @IntValue INT
            IF ISNUMERIC(@SearchString) = 1 AND TRY_CAST(@SearchString AS INT) IS NOT NULL
            BEGIN
                SET @Result = 1
            END
        END
    END

    RETURN @Result
END
GO
