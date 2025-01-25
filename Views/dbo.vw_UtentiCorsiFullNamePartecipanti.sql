SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[vw_UtentiCorsiFullNamePartecipanti] as
select distinct utente, CognomePartecipante + ' ' + NomePartecipante as FullName1, NomePartecipante + ' ' + CognomePartecipante as FullName2
from fact.corsi
GO
