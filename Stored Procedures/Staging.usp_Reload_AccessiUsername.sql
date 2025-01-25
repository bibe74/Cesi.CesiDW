SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [Staging].[usp_Reload_AccessiUsername]
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRANSACTION 

    TRUNCATE TABLE Staging.AccessiUsername;

    INSERT INTO Staging.AccessiUsername SELECT * FROM Staging.AccessiUsernameView;

    COMMIT TRANSACTION 

END;
GO
