BEGIN TRANSACTION

---- Create the country
DECLARE @CountryId smallint
DECLARE @DefaultId int


--Albania Exploration Restricted
--Bulgaria Exploration Restricted
--Denmark Exploration Restricted
--France Exploration Restricted
--Greece Exploration Restricted
--Georgia Exploration Restricted
--Hungary Exploration Restricted
--Portugal Exploration Restricted
--Spain Exploration Restricted
--Tajikistan Exploration Restricted
--Uzbekistan Exploration Restricted
--Kurdistan

USE RegFrame_52_EM
-- **********************************************************************
-- **********************************************************************
-- **********************************************************************
-- ** PLEASE CHECK FIRST TO SEE IF THE COUNTRY ALREADY EXISTS!!!!!!!!! **
-- **********************************************************************
-- **********************************************************************
-- **********************************************************************

DECLARE @CountryName varchar(50)

set @CountryName = 'Baytown Electrical'

SELECT * FROM dbo.Countries
WHERE Name = @CountryName

IF NOT EXISTS(SELECT 1 FROM dbo.Countries WHERE Name = @CountryName)
BEGIN

	PRINT 'ADDING NEW COUNTRY'

	SET @CountryId = 166

	SET IDENTITY_INSERT Countries ON
	INSERT INTO dbo.Countries ([Country_ID],[Name],[UserDefinedName_1],[UserDefinedName_2],[UserDefinedName_3],[Tickler_Notification_Enabled], [Tickler_Notification_Body])
		 VALUES(@CountryId, @CountryName,'User Defined 1','User Defined 2','User Defined 3', 0, 'Please see the attached notification report...')
	SET IDENTITY_INSERT Countries OFF

	
	SET @DefaultId = -100 - @CountryId

	-- Add default items for the new country
	IF NOT EXISTS(SELECT 1 FROM Projects WHERE Project_ID = @DefaultId)
	BEGIN
		SET IDENTITY_INSERT Projects ON
		INSERT INTO [dbo].[Projects]
			   ([Project_Id], [Country_Id],[Name],[Tickler_Notification_Enabled])
		VALUES (@DefaultId, @CountryId, '<Default>', 0)
		SET IDENTITY_INSERT Projects OFF
	END

	-- Add default sub project for new country
	IF NOT EXISTS(SELECT 1 FROM Sub_Projects WHERE Sub_Project_ID = @DefaultId)
	BEGIN
		SET IDENTITY_INSERT Sub_Projects ON
		 INSERT INTO [dbo].[Sub_Projects]
			   ([Sub_Project_Id], [Project_Id],[Name],[Tickler_Notification_Enabled])
		 VALUES (@DefaultId, @DefaultId, '<Default>', 0)
		SET IDENTITY_INSERT Sub_Projects OFF
	END

	-- Add default activity for new country
	IF NOT EXISTS(SELECT 1 FROM Activities WHERE Activity_ID = @DefaultId)
	BEGIN
		SET IDENTITY_INSERT [Activities] ON
		 INSERT INTO [dbo].[Activities]
			   ([Activity_ID], [Project_Id],[Name])
		 VALUES (@DefaultId, @DefaultId, '<Default>')
		SET IDENTITY_INSERT [Activities] OFF
	END

	-- Add any new government agencies
	INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'To be determined' FROM Gov_Agencies 

	--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'Athabasca Chipewyan First Nations (ACFN)' FROM Gov_Agencies
	--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'Misikew Cree First Nations (MCFN)' FROM Gov_Agencies
	--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'Fort McKay First Nations (FMFN)' FROM Gov_Agencies

	--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'AER' FROM Gov_Agencies
	--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'AEP' FROM Gov_Agencies
	--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, @CountryId, 'Wood' FROM Gov_Agencies

END

--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Environmental Protection Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Cultural Heritage Administration Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Forestry Administration Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Forestry Administration Bureau and Fishery Administration Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Forestry Administration Bureau and Agriculture Administration Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Fishery Administration Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Land and Resource Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Grassland Administration Authority' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'People''s Court' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Water Resources Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'State Council' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Water Affairs Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Agriculture Administration Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'State Administration of Work Safety ' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Ministry of Health' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'State Administration of Work Safety' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'People''s Government' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Power Administrative Department' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Ministry of Labor and Social Security' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Ministry of Public Security' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Public Security Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'National Development and Reform Commission' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'State Administration of Quality Supervision, Inspection and Quarantine' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'The State Council' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Multiple Authorities' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Ministry of Housing and Urban-Rural Development' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Ministry of Transport' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Ministry of Environmental Protection' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'China Earthquake Administration' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Work Safety Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Seismological Bureau ' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Land and Resources Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Department of House Expropriation' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Human Resources and Social Security Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'National People''s Congress' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'People''s Government / Public Security Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Development and Reform Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Human Resources and Social Security Bureau & Arbitration Commission' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Taxation Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Forestry Administration' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Public Health Bureau' FROM Gov_Agencies
--INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) SELECT MAX(Gov_Agency_Id) + 1, 35, 'Villagers Committee' FROM Gov_Agencies





-- COPY AGENCIES FROM ANOTHER COUNTRY

--CREATE TABLE #tempAgencies (id int IDENTITY (1874, 1), [Country_ID] smallint, [Name] varchar(255)) 

--INSERT INTO #tempAgencies
--           ([Country_ID]
--           ,[Name])
--	SELECT 77
--		  ,[Name]
--	FROM [RegFrame5_IHS].[dbo].[Gov_Agencies] where country_id = 35

--INSERT INTO [RegFrame5_IHS].[dbo].[Gov_Agencies]
--           ([Gov_Agency_ID]
--           ,[Country_ID]
--           ,[Name])
--     SELECT id,  [Country_ID], [Name]
--     FROM #tempAgencies

--DROP TABLE #tempAgencies





COMMIT TRANSACTION

--BEGIN TRANSACTION

----SET IDENTITY_INSERT Gov_Agencies ON
----INSERT INTO dbo.Gov_Agencies (Country_ID, Name) 
----select 51, Name from Gov_Agencies 
----GROUP BY Name, country_id
----having country_id = 9

----SET IDENTITY_INSERT Gov_Agencies ON

--DECLARE @AgencyId int
--DECLARE @NewAgencyId int 

--DECLARE GovAgencyCursor CURSOR FOR 
--	SELECT Gov_Agency_Id
--	FROM Gov_Agencies
--	WHERE Country_id = 9
	
--OPEN GovAgencyCursor

--FETCH NEXT FROM GovAgencyCursor INTO @AgencyId

--WHILE @@FETCH_STATUS = 0
--BEGIN

--	SELECT @NewAgencyId = MAX(Gov_Agency_Id) + 1 FROM Gov_Agencies
--	INSERT INTO dbo.Gov_Agencies (Gov_Agency_Id, Country_ID, Name) 
--	SELECT @NewAgencyId, 51, Name
--	FROM Gov_Agencies WHERE Gov_Agency_Id = @AgencyId 

--	FETCH NEXT FROM GovAgencyCursor INTO @AgencyId
--END 
--CLOSE GovAgencyCursor
--DEALLOCATE GovAgencyCursor

--SELECT * FROM Gov_Agencies WHERE Country_id = 51


--COMMIT TRANSACTION


