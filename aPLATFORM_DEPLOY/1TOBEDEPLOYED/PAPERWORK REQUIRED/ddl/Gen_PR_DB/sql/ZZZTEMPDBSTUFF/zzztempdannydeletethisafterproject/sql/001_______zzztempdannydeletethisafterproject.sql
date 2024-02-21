IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'zzztempdannydeletethisafterproject')
BEGIN
    EXEC('CREATE SCHEMA zzztempdannydeletethisafterproject')
END
GO