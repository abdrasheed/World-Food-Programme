
-- GET DIMENSIONS
-- Get Unique [CountryName]
SELECT 
	DISTINCT [CountryName]
FROM WFP_Staging_Area
ORDER BY [CountryName] ASC;

-- Get Unique [Market Type Name]
SELECT 
	DISTINCT [MarketTypeName]
FROM WFP_Staging_Area
ORDER BY [MarketTypeName] ASC;

-- Get Unique [Market Name] & [MarketTypeID]
SELECT 
	DISTINCT [MarketName],
	[MarketTypeID]
FROM WFP_Staging_Area
ORDER BY [MarketName] ASC;

-- Get Unique [Commodity Category]
SELECT 
	DISTINCT [CommodityCategory]
FROM WFP_Staging_Area
ORDER BY [CommodityCategory] ASC;

-- Get Unique [CommodityName] & [CommodityCategryID]
SELECT 
	DISTINCT [CommodityName],
	CommodityCategoryID
FROM WFP_Staging_Area
ORDER BY [CommodityName] ASC;

-- Get Unique [CurrencyName]
SELECT 
	DISTINCT [CurrencyName]
FROM WFP_Staging_Area
ORDER BY [CurrencyName] ASC;

-- Get Unique [Measurement]
SELECT 
	DISTINCT [Measurement]
FROM WFP_Staging_Area
ORDER BY [Measurement] ASC;

-- Get Unique [CommoditySource]
SELECT 
	DISTINCT [CommeditySource]
FROM WFP_Staging_Area
ORDER BY [CommeditySource] ASC;

-- Get Unique [Year & Month]
SELECT 
	DISTINCT Month,
	Year
FROM WFP_Staging_Area
ORDER BY Month,Year ASC;


-- UPDATE DIMENSION
-- 01 Update CountryID with Staging Table
UPDATE WFP_Staging_Area 
SET CountryID = DimCountry.CountryID
FROM WFP_Staging_Area 
INNER JOIN DimCountry 
ON WFP_Staging_Area.CountryName = DimCountry.Country;


-- 02 Update MarketTypeID with DimMarket
UPDATE WFP_Staging_Area 
SET MarketTypeID = DimMarketType.MarketTypeID
FROM DimMarketType 
INNER JOIN WFP_Staging_Area 
ON WFP_Staging_Area.MarketTypeName = DimMarketType.MarketType

-- 03 Update MarketNameID with Staging Table
UPDATE WFP_Staging_Area 
SET MarketID = DimMarket.MarketID
FROM WFP_Staging_Area 
INNER JOIN DimMarket 
ON WFP_Staging_Area.MarketName = DimMarket.Market
AND WFP_Staging_Area.MarketTypeID = DimMarket.MarketTypeID;

-- 04 Update CommodityCategoryID with Staging Table
UPDATE WFP_Staging_Area 
SET CommodityCategoryID = DimCommodityCategory.CategoryID
FROM WFP_Staging_Area 
INNER JOIN DimCommodityCategory 
ON WFP_Staging_Area.CommodityCategory = DimCommodityCategory.CommodityCategory;

-- 05 Update CommodityID with Staging Table
UPDATE WFP_Staging_Area 
SET CommodityID = DimCommodity.CommodityID
FROM WFP_Staging_Area 
INNER JOIN DimCommodity 
ON WFP_Staging_Area.CommodityName = DimCommodity.CommodityName
AND WFP_Staging_Area.CommodityCategoryID = DimCommodity.CategoryID;

-- 06 Update CurrencyID with Staging Table
UPDATE WFP_Staging_Area 
SET CurrencyID = DimCurrency.CurrencyID
FROM WFP_Staging_Area 
INNER JOIN DimCurrency 
ON WFP_Staging_Area.CurrencyName = DimCurrency.Currency;

-- 07 Update MeasuementID with Staging Table
UPDATE WFP_Staging_Area 
SET MeasurementID = DimMeasurement.MeasurementID
FROM WFP_Staging_Area 
INNER JOIN DimMeasurement 
ON WFP_Staging_Area.Measurement = DimMeasurement.Measurement;


-- 08 Update CommeditySourceID with Staging Table
UPDATE WFP_Staging_Area 
SET WFP_Staging_Area.DateID = DimDate.DateID
FROM WFP_Staging_Area 
INNER JOIN DimDate 
ON WFP_Staging_Area.Year = DimDate.Year
AND WFP_Staging_Area.Month = DimDate.Month;





select distinct MarketTypeName from WFP_Staging_Area;
select * from DimCountry where Country = 'United Republic of Tanzania';
SELECT top 1000 * FROM WFP_Staging_Area;
SELECT * FROM DimDate;
truncate table DimCommodityCategory;

SELECT 
	CountryID,
	MarketID,
	CommodityID,
	CurrencyID,
	MeasurementID,
	CommeditySourceID,
	DateID,
	MeasurementAmount,
	OriginalPrice,
	USDPrice
FROM WFP_Staging_Area where OriginalPrice = 0;

-- truncate table DimMarket;

-- ALTER TABLE FactWorldFoodProgram
-- DROP CONSTRAINT [FK_MarketID];





-- 