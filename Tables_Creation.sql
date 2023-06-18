-- Create The FWP Database
--CREATE DATABASE WFP_Prices_DB;


-- Create Staging Area
CREATE TABLE WFP_Staging_Area(
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryID int NULL,
	CountryName varchar(50) NULL,
	MarketID int NULL,
	MarketName varchar(50) NULL,
	CommodityID int NULL,
	CommodityName varchar(50) NULL,
	CommodityCategoryID int NULL,
	CommodityCategory varchar(50) NULL,
	CurrencyID int NULL,
	CurrencyName varchar(50) NULL,
	MarketTypeID int NULL,
	MarketTypeName varchar(50) NULL,
	MeasurementID int NULL,
	Measurement varchar(50) NULL,	
	CommeditySourceID int NULL,
	CommeditySource nvarchar(100) NULL,
	DateID int NULL,
	Month int NULL,
	Year int NULL,
	MeasurementAmount int NULL,
	OriginalPrice float NULL,
	USDPrice float NULL
);

-- # 1 Country Dimension
CREATE TABLE [DimCountry] (
	CountryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Country varchar(50) NULL
);


-- # 2 Commodity Dimension
CREATE TABLE [DimCommodity] (
	CommodityID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CommodityName varchar(150) NULL,
	CategoryID int NULL,
);


-- # 2 Commodity Dimension
CREATE TABLE [DimCommodityCategory] (
	CategoryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CommodityCategory varchar(100) NULL,
);


-- # 3 Market Dimension
CREATE TABLE [DimMarket] (
	MarketID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Market varchar(50) NULL,
	MarketTypeID int NULL
);

-- # 4 Currency Dimension
CREATE TABLE [DimCurrency] (
	CurrencyID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Currency varchar(50) NULL
);


-- # 5 MarketType Dimension
CREATE TABLE [DimMarketType] (
	MarketTypeID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	MarketType varchar(50) NULL
);

-- # 6 Measurements Dimension
CREATE TABLE [DimMeasurement] (
	MeasurementID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Measurement varchar(50) NULL
);


-- # 7 Date Dimension
CREATE TABLE [DimDate] (
	DateID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Month int NULL,
	Year int NULL
);

-- # 8 CommeditySource Dimension
CREATE TABLE [DimCommeditySource] (
	CommeditySourceID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CommeditySource nvarchar(100) NULL
);


-- Create Fact Table FactWorldFoodProgram
CREATE TABLE FactWorldFoodProgram(
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryID INT NULL,
	CommodityID INT NULL,
	MarketID INT NULL,
	CurrencyID INT NULL,
	MeasurementID INT NULL,
	DateID INT NULL,
	CommeditySourceID INT NULL,
	MeasurementAmount int NULL,
	OriginalPrice float NULL,
	PriceInUSD float NULL
);



-- CONNECT FACT AND DIMENSION BY FOREIGN KEYS.

-- Add Foreign Key to DimDate
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_YearID] FOREIGN KEY(DateID)
REFERENCES DimDate (DateID);

-- Add Foreign Key to DimCountry
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_CountryID] FOREIGN KEY(CountryID)
REFERENCES DimCountry (CountryID);

-- Add Foreign Key to DimCommodity
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_CommodityID] FOREIGN KEY(CommodityID)
REFERENCES DimCommodity (CommodityID);

-- Add Foreign Key to DimCommodityCategory
ALTER TABLE DimCommodity WITH CHECK ADD CONSTRAINT [FK_CategoryID] FOREIGN KEY(CategoryID)
REFERENCES DimCommodityCategory (CategoryID);

-- Add Foreign Key to DimMarket
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_MarketID] FOREIGN KEY(MarketID)
REFERENCES DimMarket (MarketID);

-- Add Foreign Key to DimMarketType
ALTER TABLE DimMarket WITH CHECK ADD CONSTRAINT [FK_MarketTypeID] FOREIGN KEY(MarketTypeID)
REFERENCES DimMarketType (MarketTypeID);

-- Add Foreign Key to DimCurrency
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_Currency] FOREIGN KEY(CurrencyID)
REFERENCES DimCurrency (CurrencyID);


-- Add Foreign Key to DimMeasurement
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_MeasurementID] FOREIGN KEY(MeasurementID)
REFERENCES DimMeasurement (MeasurementID);


-- Add Foreign Key to DimCommeditySource
ALTER TABLE FactWorldFoodProgram WITH CHECK ADD CONSTRAINT [FK_CommeditySourceID] FOREIGN KEY(CommeditySourceID)
REFERENCES DimCommeditySource (CommeditySourceID);

