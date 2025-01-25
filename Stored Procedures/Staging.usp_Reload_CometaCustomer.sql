SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [Staging].[usp_Reload_CometaCustomer]
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRANSACTION 

    TRUNCATE TABLE Staging.CometaCustomer;

    INSERT INTO Staging.CometaCustomer SELECT * FROM Staging.CometaCustomerView;

    COMMIT TRANSACTION 

END;
GO
