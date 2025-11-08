begin transaction
--104 and 137

DECLARE @CountryId int
set @CountryId = 166

DELETE FROM dbo.Scope_Selection WHERE CountryId = @CountryId
DELETE FROM dbo.ViewState WHERE Country_Id = @CountryId
DELETE FROM dbo.Shortcuts WHERE Country_ID = @CountryId
DELETE FROM dbo.UserCountrySettings WHERE CountryID = @CountryId

DELETE FROM [dbo].[row_gov_agency] FROM [dbo].[row_gov_agency] INNER JOIN [Gov_Agencies] ON [Gov_Agencies].Gov_Agency_ID = [row_gov_agency].Gov_Agency_ID   WHERE Country_ID = @CountryId

DELETE FROM [dbo].[Gov_Agencies] WHERE Country_ID = @CountryId
DELETE FROM [dbo].[UserCountryAccess] WHERE Country_ID = @CountryId
DELETE FROM [dbo].[UserProjectAccess] FROM  [dbo].[UserProjectAccess] INNER JOIN Projects on Projects.Project_Id = [UserProjectAccess].Project_Id WHERE Country_Id = @CountryId

DELETE FROM [dbo].Projects_Resp_Entities FROM  [dbo].Projects_Resp_Entities INNER JOIN Projects on Projects.Project_Id = Projects_Resp_Entities.Project_Id WHERE Country_Id = @CountryId
DELETE FROM [dbo].Activities FROM  [dbo].Activities INNER JOIN Projects on Projects.Project_Id = Activities.Project_Id WHERE Country_Id = @CountryId
DELETE FROM [dbo].Sub_Projects FROM  [dbo].Sub_Projects INNER JOIN Projects on Projects.Project_Id = Sub_Projects.Project_Id WHERE Country_Id = @CountryId
DELETE FROM [dbo].Projects WHERE Country_ID = @CountryId


DELETE FROM [dbo].[Laws] WHERE Country_ID = @CountryId
DELETE FROM [dbo].[Countries] WHERE Country_ID = @CountryId


commit transaction