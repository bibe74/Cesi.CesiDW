SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [GPT].[usp_ReportDomandeMIA] (
    @StartDate DATE NULL,
    @EndDate DATE NULL
)
AS
BEGIN

    IF (@EndDate IS NULL) SELECT @EndDate = CONVERT(DATE, CURRENT_TIMESTAMP);
    IF (@StartDate IS NULL) SELECT @StartDate = DATEADD(DAY, -7, @StartDate);

    SELECT
        *
    FROM Fact.DomandeMIA
    WHERE PKDataCreazione BETWEEN @StartDate AND @EndDate
    ORDER BY Id;

END;
GO
