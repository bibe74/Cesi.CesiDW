SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**
 * @table Staging.ArticoloCategoriaMaster
 * @description Mappatura Articolo / Categoria Master
*/

CREATE   VIEW [Staging].[ArticoloCategoriaMasterView]
AS
SELECT
    T.id_articolo,
    T.codice AS Codice,
    COALESCE(T.descrizione, N'') AS Descrizione,
    CASE
        WHEN COALESCE(T.descrizione, N'') LIKE N'%Master MySolution On-line%' THEN N'Master MySolution'
        WHEN COALESCE(T.descrizione, N'') LIKE N'%Master MySolution Plus%' THEN N'Master MySolution'
        WHEN COALESCE(T.descrizione, N'') LIKE N'%Mini Master Revisione Legale%' THEN N'Mini Master Revisione'
        WHEN COALESCE(T.descrizione, N'') LIKE N'%Master MySolution 202%' THEN N'Master MySolution'
        ELSE N''
    END AS CategoriaMaster,
    CASE
        WHEN COALESCE(T.descrizione, N'') LIKE N'%Master MySolution On-line%' OR COALESCE(T.descrizione, N'') LIKE N'%Master MySolution Plus%' OR COALESCE(T.descrizione, N'') LIKE N'%Mini Master Revisione Legale%' OR COALESCE(T.descrizione, N'') LIKE N'%Master MySolution 202%'
        THEN
        CASE
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2012_2013%' THEN N'2012/2013'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%12_13%' THEN N'2012/2013'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2012%' THEN N'2012/2013'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2013_2014%' THEN N'2013/2014'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%13_14%' THEN N'2013/2014'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2013%' THEN N'2013/2014'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2014_2015%' THEN N'2014/2015'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%14_15%' THEN N'2014/2015'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2014%' THEN N'2014/2015'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2015_2016%' THEN N'2015/2016'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%15_16%' THEN N'2015/2016'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2015%' THEN N'2015/2016'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2016_2017%' THEN N'2016/2017'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%16_17%' THEN N'2016/2017'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2016%' THEN N'2016/2017'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2017_2018%' THEN N'2017/2018'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%17_18%' THEN N'2017/2018'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2017%' THEN N'2017/2018'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2018_2019%' THEN N'2018/2019'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%18_19%' THEN N'2018/2019'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2018%' THEN N'2018/2019'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2019_2020%' THEN N'2019/2020'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%19_20%' THEN N'2019/2020'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2019%' THEN N'2019/2020'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2020_2021%' THEN N'2020/2021'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%20_21%' THEN N'2020/2021'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2020%' THEN N'2020/2021'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2021_2022%' THEN N'2021/2022'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%21_22%' THEN N'2021/2022'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2021%' THEN N'2021/2022'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2022_2023%' THEN N'2022/2023'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%22_23%' THEN N'2022/2023'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2022%' THEN N'2022/2023'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2023_2024%' THEN N'2023/2024'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%23_24%' THEN N'2023/2024'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2023%' THEN N'2023/2024'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2024_2025%' THEN N'2024/2025'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%24_25%' THEN N'2024/2025'
            WHEN COALESCE(T.descrizione, N'') LIKE N'%2024%' THEN N'2024/2025'
            ELSE N''
        END
        ELSE N''
    END AS CodiceEsercizioMaster,
    CAST(1.0 AS DECIMAL(5,2)) AS Percentuale

FROM Landing.COMETA_Articolo T
WHERE COALESCE(T.descrizione, N'') LIKE N'%Master MySolution On-line%'
    OR COALESCE(T.descrizione, N'') LIKE N'%Master MySolution Plus%'
    OR COALESCE(T.descrizione, N'') LIKE N'%Mini Master Revisione Legale%'
    OR COALESCE(T.descrizione, N'') LIKE N'%Master MySolution%'
    OR COALESCE(T.descrizione, N'') LIKE N'%Master MySolution 202%';
GO
