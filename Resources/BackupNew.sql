--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.2
-- Dumped by pg_dump version 9.2.2
-- Started on 2015-09-21 12:35:06

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 220 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 220
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 20978)
-- Name: AdventureWorksDWBuildVersion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "AdventureWorksDWBuildVersion" (
    "DBVersion" character varying(50),
    "VersionDate" timestamp without time zone
);


ALTER TABLE public."AdventureWorksDWBuildVersion" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 21157)
-- Name: DatabaseLog_DatabaseLogID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DatabaseLog_DatabaseLogID_seq"
    START WITH 97
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DatabaseLog_DatabaseLogID_seq" OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 20981)
-- Name: DatabaseLog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DatabaseLog" (
    "DatabaseLogID" integer DEFAULT nextval('"DatabaseLog_DatabaseLogID_seq"'::regclass) NOT NULL,
    "PostTime" timestamp without time zone NOT NULL,
    "DatabaseUser" character varying(128) NOT NULL,
    "Event" character varying(128) NOT NULL,
    "Schema" character varying(128),
    "Object" character varying(128),
    "TSQL" text NOT NULL,
    "XmlEvent" text NOT NULL
);


ALTER TABLE public."DatabaseLog" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 21160)
-- Name: DimAccount_AccountKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimAccount_AccountKey_seq"
    START WITH 102
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimAccount_AccountKey_seq" OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 20989)
-- Name: DimAccount; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimAccount" (
    "AccountKey" integer DEFAULT nextval('"DimAccount_AccountKey_seq"'::regclass) NOT NULL,
    "ParentAccountKey" integer,
    "AccountCodeAlternateKey" integer,
    "ParentAccountCodeAlternateKey" integer,
    "AccountDescription" character varying(50),
    "AccountType" character varying(50),
    "Operator" character varying(50),
    "CustomMembers" character varying(300),
    "ValueType" character varying(50),
    "CustomMemberOptions" character varying(200)
);


ALTER TABLE public."DimAccount" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 21163)
-- Name: DimCurrency_CurrencyKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimCurrency_CurrencyKey_seq"
    START WITH 106
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimCurrency_CurrencyKey_seq" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 20997)
-- Name: DimCurrency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimCurrency" (
    "CurrencyKey" integer DEFAULT nextval('"DimCurrency_CurrencyKey_seq"'::regclass) NOT NULL,
    "CurrencyAlternateKey" character(3) NOT NULL,
    "CurrencyName" character varying(50) NOT NULL
);


ALTER TABLE public."DimCurrency" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 21166)
-- Name: DimCustomer_CustomerKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimCustomer_CustomerKey_seq"
    START WITH 29484
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimCustomer_CustomerKey_seq" OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 21002)
-- Name: DimCustomer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimCustomer" (
    "CustomerKey" integer DEFAULT nextval('"DimCustomer_CustomerKey_seq"'::regclass) NOT NULL,
    "GeographyKey" integer,
    "CustomerAlternateKey" character varying(15) NOT NULL,
    "Title" character varying(8),
    "FirstName" character varying(50),
    "MiddleName" character varying(50),
    "LastName" character varying(50),
    "NameStyle" bit(1),
    "BirthDate" date,
    "MaritalStatus" character(1),
    "Suffix" character varying(10),
    "Gender" character varying(1),
    "EmailAddress" character varying(50),
    "YearlyIncome" numeric(19,4),
    "TotalChildren" smallint,
    "NumberChildrenAtHome" smallint,
    "EnglishEducation" character varying(40),
    "SpanishEducation" character varying(40),
    "FrenchEducation" character varying(40),
    "EnglishOccupation" character varying(100),
    "SpanishOccupation" character varying(100),
    "FrenchOccupation" character varying(100),
    "HouseOwnerFlag" character(1),
    "NumberCarsOwned" smallint,
    "AddressLine1" character varying(120),
    "AddressLine2" character varying(120),
    "Phone" character varying(20),
    "DateFirstPurchase" date,
    "CommuteDistance" character varying(15)
);


ALTER TABLE public."DimCustomer" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 21010)
-- Name: DimDate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimDate" (
    "DateKey" integer NOT NULL,
    "FullDateAlternateKey" date NOT NULL,
    "DayNumberOfWeek" smallint NOT NULL,
    "EnglishDayNameOfWeek" character varying(10) NOT NULL,
    "SpanishDayNameOfWeek" character varying(10) NOT NULL,
    "FrenchDayNameOfWeek" character varying(10) NOT NULL,
    "DayNumberOfMonth" smallint NOT NULL,
    "DayNumberOfYear" smallint NOT NULL,
    "WeekNumberOfYear" smallint NOT NULL,
    "EnglishMonthName" character varying(10) NOT NULL,
    "SpanishMonthName" character varying(10) NOT NULL,
    "FrenchMonthName" character varying(10) NOT NULL,
    "MonthNumberOfYear" smallint NOT NULL,
    "CalendarQuarter" smallint NOT NULL,
    "CalendarYear" smallint NOT NULL,
    "CalendarSemester" smallint NOT NULL,
    "FiscalQuarter" smallint NOT NULL,
    "FiscalYear" smallint NOT NULL,
    "FiscalSemester" smallint NOT NULL
);


ALTER TABLE public."DimDate" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 21169)
-- Name: DimDepartmentGroup_DepartmentGroupKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimDepartmentGroup_DepartmentGroupKey_seq"
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimDepartmentGroup_DepartmentGroupKey_seq" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 21015)
-- Name: DimDepartmentGroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimDepartmentGroup" (
    "DepartmentGroupKey" integer DEFAULT nextval('"DimDepartmentGroup_DepartmentGroupKey_seq"'::regclass) NOT NULL,
    "ParentDepartmentGroupKey" integer,
    "DepartmentGroupName" character varying(50)
);


ALTER TABLE public."DimDepartmentGroup" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 21172)
-- Name: DimEmployee_EmployeeKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimEmployee_EmployeeKey_seq"
    START WITH 297
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimEmployee_EmployeeKey_seq" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 21020)
-- Name: DimEmployee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimEmployee" (
    "EmployeeKey" integer DEFAULT nextval('"DimEmployee_EmployeeKey_seq"'::regclass) NOT NULL,
    "ParentEmployeeKey" integer,
    "EmployeeNationalIDAlternateKey" character varying(15),
    "ParentEmployeeNationalIDAlternateKey" character varying(15),
    "SalesTerritoryKey" integer,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "MiddleName" character varying(50),
    "NameStyle" bit(1) NOT NULL,
    "Title" character varying(50),
    "HireDate" date,
    "BirthDate" date,
    "LoginID" character varying(256),
    "EmailAddress" character varying(50),
    "Phone" character varying(25),
    "MaritalStatus" character(1),
    "EmergencyContactName" character varying(50),
    "EmergencyContactPhone" character varying(25),
    "SalariedFlag" bit(1),
    "Gender" character(1),
    "PayFrequency" smallint,
    "BaseRate" numeric(19,4),
    "VacationHours" smallint,
    "SickLeaveHours" smallint,
    "CurrentFlag" bit(1) NOT NULL,
    "SalesPersonFlag" bit(1) NOT NULL,
    "DepartmentName" character varying(50),
    "StartDate" date,
    "EndDate" date,
    "Status" character varying(50),
    "EmployeePhoto" bytea
);


ALTER TABLE public."DimEmployee" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 21175)
-- Name: DimGeography_GeographyKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimGeography_GeographyKey_seq"
    START WITH 656
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimGeography_GeographyKey_seq" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 21028)
-- Name: DimGeography; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimGeography" (
    "GeographyKey" integer DEFAULT nextval('"DimGeography_GeographyKey_seq"'::regclass) NOT NULL,
    "City" character varying(30),
    "StateProvinceCode" character varying(3),
    "StateProvinceName" character varying(50),
    "CountryRegionCode" character varying(3),
    "EnglishCountryRegionName" character varying(50),
    "SpanishCountryRegionName" character varying(50),
    "FrenchCountryRegionName" character varying(50),
    "PostalCode" character varying(15),
    "SalesTerritoryKey" integer,
    "IpAddressLocator" character varying(15)
);


ALTER TABLE public."DimGeography" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 21178)
-- Name: DimOrganization_OrganizationKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimOrganization_OrganizationKey_seq"
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimOrganization_OrganizationKey_seq" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 21033)
-- Name: DimOrganization; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimOrganization" (
    "OrganizationKey" integer DEFAULT nextval('"DimOrganization_OrganizationKey_seq"'::regclass) NOT NULL,
    "ParentOrganizationKey" integer,
    "PercentageOfOwnership" character varying(16),
    "OrganizationName" character varying(50),
    "CurrencyKey" integer
);


ALTER TABLE public."DimOrganization" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 21181)
-- Name: DimProduct_ProductKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimProduct_ProductKey_seq"
    START WITH 607
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimProduct_ProductKey_seq" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 21038)
-- Name: DimProduct; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimProduct" (
    "ProductKey" integer DEFAULT nextval('"DimProduct_ProductKey_seq"'::regclass) NOT NULL,
    "ProductAlternateKey" character varying(25),
    "ProductSubcategoryKey" integer,
    "WeightUnitMeasureCode" character(3),
    "SizeUnitMeasureCode" character(3),
    "EnglishProductName" character varying(50),
    "SpanishProductName" character varying(50),
    "FrenchProductName" character varying(50),
    "StandardCost" numeric(19,4),
    "FinishedGoodsFlag" bit(1) NOT NULL,
    "Color" character varying(15) NOT NULL,
    "SafetyStockLevel" smallint,
    "ReorderPoint" smallint,
    "ListPrice" numeric(19,4),
    "Size" character varying(50),
    "SizeRange" character varying(50),
    "Weight" double precision,
    "DaysToManufacture" integer,
    "ProductLine" character(2),
    "DealerPrice" numeric(19,4),
    "Class" character(2),
    "Style" character(2),
    "ModelName" character varying(50),
    "LargePhoto" bytea,
    "EnglishDescription" character varying(400),
    "FrenchDescription" character varying(400),
    "ChineseDescription" character varying(400),
    "ArabicDescription" character varying(400),
    "HebrewDescription" character varying(400),
    "ThaiDescription" character varying(400),
    "GermanDescription" character varying(400),
    "JapaneseDescription" character varying(400),
    "TurkishDescription" character varying(400),
    "StartDate" timestamp without time zone,
    "EndDate" timestamp without time zone,
    "Status" character varying(7)
);


ALTER TABLE public."DimProduct" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 21184)
-- Name: DimProductCategory_ProductCategoryKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimProductCategory_ProductCategoryKey_seq"
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimProductCategory_ProductCategoryKey_seq" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 21046)
-- Name: DimProductCategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimProductCategory" (
    "ProductCategoryKey" integer DEFAULT nextval('"DimProductCategory_ProductCategoryKey_seq"'::regclass) NOT NULL,
    "ProductCategoryAlternateKey" integer,
    "EnglishProductCategoryName" character varying(50) NOT NULL,
    "SpanishProductCategoryName" character varying(50) NOT NULL,
    "FrenchProductCategoryName" character varying(50) NOT NULL
);


ALTER TABLE public."DimProductCategory" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 21187)
-- Name: DimProductSubcategory_ProductSubcategoryKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimProductSubcategory_ProductSubcategoryKey_seq"
    START WITH 38
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimProductSubcategory_ProductSubcategoryKey_seq" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 21051)
-- Name: DimProductSubcategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimProductSubcategory" (
    "ProductSubcategoryKey" integer DEFAULT nextval('"DimProductSubcategory_ProductSubcategoryKey_seq"'::regclass) NOT NULL,
    "ProductSubcategoryAlternateKey" integer,
    "EnglishProductSubcategoryName" character varying(50) NOT NULL,
    "SpanishProductSubcategoryName" character varying(50) NOT NULL,
    "FrenchProductSubcategoryName" character varying(50) NOT NULL,
    "ProductCategoryKey" integer
);


ALTER TABLE public."DimProductSubcategory" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 21190)
-- Name: DimPromotion_PromotionKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimPromotion_PromotionKey_seq"
    START WITH 17
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimPromotion_PromotionKey_seq" OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 21056)
-- Name: DimPromotion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimPromotion" (
    "PromotionKey" integer DEFAULT nextval('"DimPromotion_PromotionKey_seq"'::regclass) NOT NULL,
    "PromotionAlternateKey" integer,
    "EnglishPromotionName" character varying(255),
    "SpanishPromotionName" character varying(255),
    "FrenchPromotionName" character varying(255),
    "DiscountPct" double precision,
    "EnglishPromotionType" character varying(50),
    "SpanishPromotionType" character varying(50),
    "FrenchPromotionType" character varying(50),
    "EnglishPromotionCategory" character varying(50),
    "SpanishPromotionCategory" character varying(50),
    "FrenchPromotionCategory" character varying(50),
    "StartDate" timestamp without time zone NOT NULL,
    "EndDate" timestamp without time zone,
    "MinQty" integer,
    "MaxQty" integer
);


ALTER TABLE public."DimPromotion" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 21193)
-- Name: DimReseller_ResellerKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimReseller_ResellerKey_seq"
    START WITH 702
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimReseller_ResellerKey_seq" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 21064)
-- Name: DimReseller; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimReseller" (
    "ResellerKey" integer DEFAULT nextval('"DimReseller_ResellerKey_seq"'::regclass) NOT NULL,
    "GeographyKey" integer,
    "ResellerAlternateKey" character varying(15),
    "Phone" character varying(25),
    "BusinessType" character varying(20) NOT NULL,
    "ResellerName" character varying(50) NOT NULL,
    "NumberEmployees" integer,
    "OrderFrequency" character(1),
    "OrderMonth" smallint,
    "FirstOrderYear" integer,
    "LastOrderYear" integer,
    "ProductLine" character varying(50),
    "AddressLine1" character varying(60),
    "AddressLine2" character varying(60),
    "AnnualSales" numeric(19,4),
    "BankName" character varying(50),
    "MinPaymentType" smallint,
    "MinPaymentAmount" numeric(19,4),
    "AnnualRevenue" numeric(19,4),
    "YearOpened" integer
);


ALTER TABLE public."DimReseller" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 21196)
-- Name: DimSalesReason_SalesReasonKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimSalesReason_SalesReasonKey_seq"
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimSalesReason_SalesReasonKey_seq" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 21069)
-- Name: DimSalesReason; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimSalesReason" (
    "SalesReasonKey" integer DEFAULT nextval('"DimSalesReason_SalesReasonKey_seq"'::regclass) NOT NULL,
    "SalesReasonAlternateKey" integer NOT NULL,
    "SalesReasonName" character varying(50) NOT NULL,
    "SalesReasonReasonType" character varying(50) NOT NULL
);


ALTER TABLE public."DimSalesReason" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 21199)
-- Name: DimSalesTerritory_SalesTerritoryKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimSalesTerritory_SalesTerritoryKey_seq"
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimSalesTerritory_SalesTerritoryKey_seq" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 21074)
-- Name: DimSalesTerritory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimSalesTerritory" (
    "SalesTerritoryKey" integer DEFAULT nextval('"DimSalesTerritory_SalesTerritoryKey_seq"'::regclass) NOT NULL,
    "SalesTerritoryAlternateKey" integer,
    "SalesTerritoryRegion" character varying(50) NOT NULL,
    "SalesTerritoryCountry" character varying(50) NOT NULL,
    "SalesTerritoryGroup" character varying(50),
    "SalesTerritoryImage" bytea
);


ALTER TABLE public."DimSalesTerritory" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 21202)
-- Name: DimScenario_ScenarioKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DimScenario_ScenarioKey_seq"
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DimScenario_ScenarioKey_seq" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 21082)
-- Name: DimScenario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "DimScenario" (
    "ScenarioKey" integer DEFAULT nextval('"DimScenario_ScenarioKey_seq"'::regclass) NOT NULL,
    "ScenarioName" character varying(50)
);


ALTER TABLE public."DimScenario" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 21087)
-- Name: FactAdditionalInternationalProductDescription; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactAdditionalInternationalProductDescription" (
    "ProductKey" integer NOT NULL,
    "CultureName" character varying(50) NOT NULL,
    "ProductDescription" text NOT NULL
);


ALTER TABLE public."FactAdditionalInternationalProductDescription" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 21205)
-- Name: FactCallCenter_FactCallCenterID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "FactCallCenter_FactCallCenterID_seq"
    START WITH 121
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FactCallCenter_FactCallCenterID_seq" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 21095)
-- Name: FactCallCenter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactCallCenter" (
    "FactCallCenterID" integer DEFAULT nextval('"FactCallCenter_FactCallCenterID_seq"'::regclass) NOT NULL,
    "DateKey" integer NOT NULL,
    "WageType" character varying(15) NOT NULL,
    "Shift" character varying(20) NOT NULL,
    "LevelOneOperators" smallint NOT NULL,
    "LevelTwoOperators" smallint NOT NULL,
    "TotalOperators" smallint NOT NULL,
    "Calls" integer NOT NULL,
    "AutomaticResponses" integer NOT NULL,
    "Orders" integer NOT NULL,
    "IssuesRaised" smallint NOT NULL,
    "AverageTimePerIssue" smallint NOT NULL,
    "ServiceGrade" double precision NOT NULL,
    "Date" timestamp without time zone
);


ALTER TABLE public."FactCallCenter" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 21100)
-- Name: FactCurrencyRate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactCurrencyRate" (
    "CurrencyKey" integer NOT NULL,
    "DateKey" integer NOT NULL,
    "AverageRate" double precision NOT NULL,
    "EndOfDayRate" double precision NOT NULL,
    "Date" timestamp without time zone
);


ALTER TABLE public."FactCurrencyRate" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 21105)
-- Name: FactFinance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactFinance" (
    "FinanceKey" integer NOT NULL,
    "DateKey" integer NOT NULL,
    "OrganizationKey" integer NOT NULL,
    "DepartmentGroupKey" integer NOT NULL,
    "ScenarioKey" integer NOT NULL,
    "AccountKey" integer NOT NULL,
    "Amount" double precision NOT NULL,
    "Date" timestamp without time zone
);


ALTER TABLE public."FactFinance" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 21108)
-- Name: FactInternetSales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactInternetSales" (
    "ProductKey" integer NOT NULL,
    "OrderDateKey" integer NOT NULL,
    "DueDateKey" integer NOT NULL,
    "ShipDateKey" integer NOT NULL,
    "CustomerKey" integer NOT NULL,
    "PromotionKey" integer NOT NULL,
    "CurrencyKey" integer NOT NULL,
    "SalesTerritoryKey" integer NOT NULL,
    "SalesOrderNumber" character varying(20) NOT NULL,
    "SalesOrderLineNumber" smallint NOT NULL,
    "RevisionNumber" smallint NOT NULL,
    "OrderQuantity" smallint NOT NULL,
    "UnitPrice" numeric(19,4) NOT NULL,
    "ExtendedAmount" numeric(19,4) NOT NULL,
    "UnitPriceDiscountPct" double precision NOT NULL,
    "DiscountAmount" double precision NOT NULL,
    "ProductStandardCost" numeric(19,4) NOT NULL,
    "TotalProductCost" numeric(19,4) NOT NULL,
    "SalesAmount" numeric(19,4) NOT NULL,
    "TaxAmt" numeric(19,4) NOT NULL,
    "Freight" numeric(19,4) NOT NULL,
    "CarrierTrackingNumber" character varying(25),
    "CustomerPONumber" character varying(25),
    "OrderDate" timestamp without time zone,
    "DueDate" timestamp without time zone,
    "ShipDate" timestamp without time zone
);


ALTER TABLE public."FactInternetSales" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 21113)
-- Name: FactInternetSalesReason; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactInternetSalesReason" (
    "SalesOrderNumber" character varying(20) NOT NULL,
    "SalesOrderLineNumber" smallint NOT NULL,
    "SalesReasonKey" integer NOT NULL
);


ALTER TABLE public."FactInternetSalesReason" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 21118)
-- Name: FactProductInventory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactProductInventory" (
    "ProductKey" integer NOT NULL,
    "DateKey" integer NOT NULL,
    "MovementDate" date NOT NULL,
    "UnitCost" numeric(19,4) NOT NULL,
    "UnitsIn" integer NOT NULL,
    "UnitsOut" integer NOT NULL,
    "UnitsBalance" integer NOT NULL
);


ALTER TABLE public."FactProductInventory" OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 21123)
-- Name: FactResellerSales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactResellerSales" (
    "ProductKey" integer NOT NULL,
    "OrderDateKey" integer NOT NULL,
    "DueDateKey" integer NOT NULL,
    "ShipDateKey" integer NOT NULL,
    "ResellerKey" integer NOT NULL,
    "EmployeeKey" integer NOT NULL,
    "PromotionKey" integer NOT NULL,
    "CurrencyKey" integer NOT NULL,
    "SalesTerritoryKey" integer NOT NULL,
    "SalesOrderNumber" character varying(20) NOT NULL,
    "SalesOrderLineNumber" smallint NOT NULL,
    "RevisionNumber" smallint,
    "OrderQuantity" smallint,
    "UnitPrice" numeric(19,4),
    "ExtendedAmount" numeric(19,4),
    "UnitPriceDiscountPct" double precision,
    "DiscountAmount" double precision,
    "ProductStandardCost" numeric(19,4),
    "TotalProductCost" numeric(19,4),
    "SalesAmount" numeric(19,4),
    "TaxAmt" numeric(19,4),
    "Freight" numeric(19,4),
    "CarrierTrackingNumber" character varying(25),
    "CustomerPONumber" character varying(25),
    "OrderDate" timestamp without time zone,
    "DueDate" timestamp without time zone,
    "ShipDate" timestamp without time zone
);


ALTER TABLE public."FactResellerSales" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 21209)
-- Name: FactSalesQuota_SalesQuotaKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "FactSalesQuota_SalesQuotaKey_seq"
    START WITH 164
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FactSalesQuota_SalesQuotaKey_seq" OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 21128)
-- Name: FactSalesQuota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactSalesQuota" (
    "SalesQuotaKey" integer DEFAULT nextval('"FactSalesQuota_SalesQuotaKey_seq"'::regclass) NOT NULL,
    "EmployeeKey" integer NOT NULL,
    "DateKey" integer NOT NULL,
    "CalendarYear" smallint NOT NULL,
    "CalendarQuarter" smallint NOT NULL,
    "SalesAmountQuota" numeric(19,4) NOT NULL,
    "Date" timestamp without time zone
);


ALTER TABLE public."FactSalesQuota" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 21212)
-- Name: FactSurveyResponse_SurveyResponseKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "FactSurveyResponse_SurveyResponseKey_seq"
    START WITH 2769
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FactSurveyResponse_SurveyResponseKey_seq" OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 21133)
-- Name: FactSurveyResponse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "FactSurveyResponse" (
    "SurveyResponseKey" integer DEFAULT nextval('"FactSurveyResponse_SurveyResponseKey_seq"'::regclass) NOT NULL,
    "DateKey" integer NOT NULL,
    "CustomerKey" integer NOT NULL,
    "ProductCategoryKey" integer NOT NULL,
    "EnglishProductCategoryName" character varying(50) NOT NULL,
    "ProductSubcategoryKey" integer NOT NULL,
    "EnglishProductSubcategoryName" character varying(50) NOT NULL,
    "Date" timestamp without time zone
);


ALTER TABLE public."FactSurveyResponse" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 21138)
-- Name: NewFactCurrencyRate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "NewFactCurrencyRate" (
    "AverageRate" double precision,
    "CurrencyID" character varying(3),
    "CurrencyDate" date,
    "EndOfDayRate" double precision,
    "CurrencyKey" integer,
    "DateKey" integer
);


ALTER TABLE public."NewFactCurrencyRate" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 21215)
-- Name: ProspectiveBuyer_ProspectiveBuyerKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "ProspectiveBuyer_ProspectiveBuyerKey_seq"
    START WITH 2060
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProspectiveBuyer_ProspectiveBuyerKey_seq" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 21141)
-- Name: ProspectiveBuyer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ProspectiveBuyer" (
    "ProspectiveBuyerKey" integer DEFAULT nextval('"ProspectiveBuyer_ProspectiveBuyerKey_seq"'::regclass) NOT NULL,
    "ProspectAlternateKey" character varying(15),
    "FirstName" character varying(50),
    "MiddleName" character varying(50),
    "LastName" character varying(50),
    "BirthDate" timestamp without time zone,
    "MaritalStatus" character(1),
    "Gender" character varying(1),
    "EmailAddress" character varying(50),
    "YearlyIncome" numeric(19,4),
    "TotalChildren" smallint,
    "NumberChildrenAtHome" smallint,
    "Education" character varying(40),
    "Occupation" character varying(100),
    "HouseOwnerFlag" character(1),
    "NumberCarsOwned" smallint,
    "AddressLine1" character varying(120),
    "AddressLine2" character varying(120),
    "City" character varying(30),
    "StateProvinceCode" character varying(3),
    "PostalCode" character varying(15),
    "Phone" character varying(20),
    "Salutation" character varying(8),
    "Unknown" integer
);


ALTER TABLE public."ProspectiveBuyer" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 21218)
-- Name: sysdiagrams_diagram_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sysdiagrams_diagram_id_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sysdiagrams_diagram_id_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 21149)
-- Name: sysdiagrams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sysdiagrams (
    name character varying(128) NOT NULL,
    principal_id integer NOT NULL,
    diagram_id integer DEFAULT nextval('sysdiagrams_diagram_id_seq'::regclass) NOT NULL,
    version integer,
    definition bytea
);


ALTER TABLE public.sysdiagrams OWNER TO postgres;



--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 199
-- Name: DatabaseLog_DatabaseLogID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DatabaseLog_DatabaseLogID_seq"', 97, false);



--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 200
-- Name: DimAccount_AccountKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimAccount_AccountKey_seq"', 102, false);



--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 201
-- Name: DimCurrency_CurrencyKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimCurrency_CurrencyKey_seq"', 106, false);


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 202
-- Name: DimCustomer_CustomerKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimCustomer_CustomerKey_seq"', 29484, false);


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 203
-- Name: DimDepartmentGroup_DepartmentGroupKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimDepartmentGroup_DepartmentGroupKey_seq"', 8, false);


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 204
-- Name: DimEmployee_EmployeeKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimEmployee_EmployeeKey_seq"', 297, false);


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 205
-- Name: DimGeography_GeographyKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimGeography_GeographyKey_seq"', 656, false);


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 206
-- Name: DimOrganization_OrganizationKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimOrganization_OrganizationKey_seq"', 15, false);


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 208
-- Name: DimProductCategory_ProductCategoryKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimProductCategory_ProductCategoryKey_seq"', 5, false);


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 209
-- Name: DimProductSubcategory_ProductSubcategoryKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimProductSubcategory_ProductSubcategoryKey_seq"', 38, false);


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 207
-- Name: DimProduct_ProductKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimProduct_ProductKey_seq"', 607, false);


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 210
-- Name: DimPromotion_PromotionKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimPromotion_PromotionKey_seq"', 17, false);


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 211
-- Name: DimReseller_ResellerKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimReseller_ResellerKey_seq"', 702, false);


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 212
-- Name: DimSalesReason_SalesReasonKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimSalesReason_SalesReasonKey_seq"', 11, false);


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 213
-- Name: DimSalesTerritory_SalesTerritoryKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimSalesTerritory_SalesTerritoryKey_seq"', 12, false);


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 214
-- Name: DimScenario_ScenarioKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DimScenario_ScenarioKey_seq"', 4, false);


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 215
-- Name: FactCallCenter_FactCallCenterID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"FactCallCenter_FactCallCenterID_seq"', 121, false);


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 216
-- Name: FactSalesQuota_SalesQuotaKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"FactSalesQuota_SalesQuotaKey_seq"', 164, false);


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 217
-- Name: FactSurveyResponse_SurveyResponseKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"FactSurveyResponse_SurveyResponseKey_seq"', 2769, false);


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 218
-- Name: ProspectiveBuyer_ProspectiveBuyerKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ProspectiveBuyer_ProspectiveBuyerKey_seq"', 2060, false);


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 219
-- Name: sysdiagrams_diagram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sysdiagrams_diagram_id_seq', 11, false);


--
-- TOC entry 2108 (class 2606 OID 20988)
-- Name: DatabaseLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DatabaseLog"
    ADD CONSTRAINT "DatabaseLog_pkey" PRIMARY KEY ("DatabaseLogID");


--
-- TOC entry 2110 (class 2606 OID 20996)
-- Name: DimAccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimAccount"
    ADD CONSTRAINT "DimAccount_pkey" PRIMARY KEY ("AccountKey");


--
-- TOC entry 2113 (class 2606 OID 21001)
-- Name: DimCurrency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimCurrency"
    ADD CONSTRAINT "DimCurrency_pkey" PRIMARY KEY ("CurrencyKey");


--
-- TOC entry 2115 (class 2606 OID 21009)
-- Name: DimCustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimCustomer"
    ADD CONSTRAINT "DimCustomer_pkey" PRIMARY KEY ("CustomerKey");


--
-- TOC entry 2119 (class 2606 OID 21014)
-- Name: DimDate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimDate"
    ADD CONSTRAINT "DimDate_pkey" PRIMARY KEY ("DateKey");


--
-- TOC entry 2121 (class 2606 OID 21019)
-- Name: DimDepartmentGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimDepartmentGroup"
    ADD CONSTRAINT "DimDepartmentGroup_pkey" PRIMARY KEY ("DepartmentGroupKey");


--
-- TOC entry 2123 (class 2606 OID 21027)
-- Name: DimEmployee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimEmployee"
    ADD CONSTRAINT "DimEmployee_pkey" PRIMARY KEY ("EmployeeKey");


--
-- TOC entry 2125 (class 2606 OID 21032)
-- Name: DimGeography_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimGeography"
    ADD CONSTRAINT "DimGeography_pkey" PRIMARY KEY ("GeographyKey");


--
-- TOC entry 2127 (class 2606 OID 21037)
-- Name: DimOrganization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimOrganization"
    ADD CONSTRAINT "DimOrganization_pkey" PRIMARY KEY ("OrganizationKey");


--
-- TOC entry 2133 (class 2606 OID 21050)
-- Name: DimProductCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimProductCategory"
    ADD CONSTRAINT "DimProductCategory_pkey" PRIMARY KEY ("ProductCategoryKey");


--
-- TOC entry 2136 (class 2606 OID 21055)
-- Name: DimProductSubcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimProductSubcategory"
    ADD CONSTRAINT "DimProductSubcategory_pkey" PRIMARY KEY ("ProductSubcategoryKey");


--
-- TOC entry 2130 (class 2606 OID 21045)
-- Name: DimProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimProduct"
    ADD CONSTRAINT "DimProduct_pkey" PRIMARY KEY ("ProductKey");


--
-- TOC entry 2139 (class 2606 OID 21063)
-- Name: DimPromotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimPromotion"
    ADD CONSTRAINT "DimPromotion_pkey" PRIMARY KEY ("PromotionKey");


--
-- TOC entry 2142 (class 2606 OID 21068)
-- Name: DimReseller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimReseller"
    ADD CONSTRAINT "DimReseller_pkey" PRIMARY KEY ("ResellerKey");


--
-- TOC entry 2144 (class 2606 OID 21073)
-- Name: DimSalesReason_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimSalesReason"
    ADD CONSTRAINT "DimSalesReason_pkey" PRIMARY KEY ("SalesReasonKey");


--
-- TOC entry 2147 (class 2606 OID 21081)
-- Name: DimSalesTerritory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimSalesTerritory"
    ADD CONSTRAINT "DimSalesTerritory_pkey" PRIMARY KEY ("SalesTerritoryKey");


--
-- TOC entry 2149 (class 2606 OID 21086)
-- Name: DimScenario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "DimScenario"
    ADD CONSTRAINT "DimScenario_pkey" PRIMARY KEY ("ScenarioKey");


--
-- TOC entry 2151 (class 2606 OID 21094)
-- Name: FactAdditionalInternationalProductDescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactAdditionalInternationalProductDescription"
    ADD CONSTRAINT "FactAdditionalInternationalProductDescription_pkey" PRIMARY KEY ("ProductKey", "CultureName");


--
-- TOC entry 2154 (class 2606 OID 21099)
-- Name: FactCallCenter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactCallCenter"
    ADD CONSTRAINT "FactCallCenter_pkey" PRIMARY KEY ("FactCallCenterID");


--
-- TOC entry 2156 (class 2606 OID 21104)
-- Name: FactCurrencyRate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactCurrencyRate"
    ADD CONSTRAINT "FactCurrencyRate_pkey" PRIMARY KEY ("CurrencyKey", "DateKey");


--
-- TOC entry 2160 (class 2606 OID 21117)
-- Name: FactInternetSalesReason_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactInternetSalesReason"
    ADD CONSTRAINT "FactInternetSalesReason_pkey" PRIMARY KEY ("SalesOrderNumber", "SalesOrderLineNumber", "SalesReasonKey");


--
-- TOC entry 2158 (class 2606 OID 21112)
-- Name: FactInternetSales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FactInternetSales_pkey" PRIMARY KEY ("SalesOrderNumber", "SalesOrderLineNumber");


--
-- TOC entry 2162 (class 2606 OID 21122)
-- Name: FactProductInventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactProductInventory"
    ADD CONSTRAINT "FactProductInventory_pkey" PRIMARY KEY ("ProductKey", "DateKey");


--
-- TOC entry 2164 (class 2606 OID 21127)
-- Name: FactResellerSales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FactResellerSales_pkey" PRIMARY KEY ("SalesOrderNumber", "SalesOrderLineNumber");


--
-- TOC entry 2166 (class 2606 OID 21132)
-- Name: FactSalesQuota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactSalesQuota"
    ADD CONSTRAINT "FactSalesQuota_pkey" PRIMARY KEY ("SalesQuotaKey");


--
-- TOC entry 2168 (class 2606 OID 21137)
-- Name: FactSurveyResponse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "FactSurveyResponse"
    ADD CONSTRAINT "FactSurveyResponse_pkey" PRIMARY KEY ("SurveyResponseKey");


--
-- TOC entry 2170 (class 2606 OID 21148)
-- Name: ProspectiveBuyer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ProspectiveBuyer"
    ADD CONSTRAINT "ProspectiveBuyer_pkey" PRIMARY KEY ("ProspectiveBuyerKey");


--
-- TOC entry 2173 (class 2606 OID 21156)
-- Name: sysdiagrams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sysdiagrams
    ADD CONSTRAINT sysdiagrams_pkey PRIMARY KEY (diagram_id);


--
-- TOC entry 2111 (class 1259 OID 21221)
-- Name: AK_DimCurrency_CurrencyAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimCurrency_CurrencyAlternateKey" ON "DimCurrency" USING btree ("CurrencyAlternateKey");


--
-- TOC entry 2117 (class 1259 OID 21223)
-- Name: AK_DimDate_FullDateAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimDate_FullDateAlternateKey" ON "DimDate" USING btree ("FullDateAlternateKey");


--
-- TOC entry 2131 (class 1259 OID 21225)
-- Name: AK_DimProductCategory_ProductCategoryAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimProductCategory_ProductCategoryAlternateKey" ON "DimProductCategory" USING btree ("ProductCategoryAlternateKey");


--
-- TOC entry 2134 (class 1259 OID 21226)
-- Name: AK_DimProductSubcategory_ProductSubcategoryAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimProductSubcategory_ProductSubcategoryAlternateKey" ON "DimProductSubcategory" USING btree ("ProductSubcategoryAlternateKey");


--
-- TOC entry 2128 (class 1259 OID 21224)
-- Name: AK_DimProduct_ProductAlternateKey_StartDate; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimProduct_ProductAlternateKey_StartDate" ON "DimProduct" USING btree ("ProductAlternateKey", "StartDate");


--
-- TOC entry 2137 (class 1259 OID 21227)
-- Name: AK_DimPromotion_PromotionAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimPromotion_PromotionAlternateKey" ON "DimPromotion" USING btree ("PromotionAlternateKey");


--
-- TOC entry 2140 (class 1259 OID 21228)
-- Name: AK_DimReseller_ResellerAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimReseller_ResellerAlternateKey" ON "DimReseller" USING btree ("ResellerAlternateKey");


--
-- TOC entry 2145 (class 1259 OID 21229)
-- Name: AK_DimSalesTerritory_SalesTerritoryAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_DimSalesTerritory_SalesTerritoryAlternateKey" ON "DimSalesTerritory" USING btree ("SalesTerritoryAlternateKey");


--
-- TOC entry 2152 (class 1259 OID 21230)
-- Name: AK_FactCallCenter_DateKey_Shift; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AK_FactCallCenter_DateKey_Shift" ON "FactCallCenter" USING btree ("DateKey", "Shift");


--
-- TOC entry 2116 (class 1259 OID 21222)
-- Name: IX_DimCustomer_CustomerAlternateKey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "IX_DimCustomer_CustomerAlternateKey" ON "DimCustomer" USING btree ("CustomerAlternateKey");


--
-- TOC entry 2171 (class 1259 OID 21231)
-- Name: UK_principal_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "UK_principal_name" ON sysdiagrams USING btree (principal_id, name);


--
-- TOC entry 2174 (class 2606 OID 21232)
-- Name: FK_DimAccount_DimAccount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimAccount"
    ADD CONSTRAINT "FK_DimAccount_DimAccount" FOREIGN KEY ("ParentAccountKey") REFERENCES "DimAccount"("AccountKey");


--
-- TOC entry 2175 (class 2606 OID 21237)
-- Name: FK_DimCustomer_DimGeography; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimCustomer"
    ADD CONSTRAINT "FK_DimCustomer_DimGeography" FOREIGN KEY ("GeographyKey") REFERENCES "DimGeography"("GeographyKey");


--
-- TOC entry 2176 (class 2606 OID 21242)
-- Name: FK_DimDepartmentGroup_DimDepartmentGroup; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimDepartmentGroup"
    ADD CONSTRAINT "FK_DimDepartmentGroup_DimDepartmentGroup" FOREIGN KEY ("ParentDepartmentGroupKey") REFERENCES "DimDepartmentGroup"("DepartmentGroupKey");


--
-- TOC entry 2177 (class 2606 OID 21247)
-- Name: FK_DimEmployee_DimEmployee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimEmployee"
    ADD CONSTRAINT "FK_DimEmployee_DimEmployee" FOREIGN KEY ("ParentEmployeeKey") REFERENCES "DimEmployee"("EmployeeKey");


--
-- TOC entry 2178 (class 2606 OID 21252)
-- Name: FK_DimEmployee_DimSalesTerritory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimEmployee"
    ADD CONSTRAINT "FK_DimEmployee_DimSalesTerritory" FOREIGN KEY ("SalesTerritoryKey") REFERENCES "DimSalesTerritory"("SalesTerritoryKey");


--
-- TOC entry 2179 (class 2606 OID 21257)
-- Name: FK_DimGeography_DimSalesTerritory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimGeography"
    ADD CONSTRAINT "FK_DimGeography_DimSalesTerritory" FOREIGN KEY ("SalesTerritoryKey") REFERENCES "DimSalesTerritory"("SalesTerritoryKey");


--
-- TOC entry 2180 (class 2606 OID 21262)
-- Name: FK_DimOrganization_DimCurrency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimOrganization"
    ADD CONSTRAINT "FK_DimOrganization_DimCurrency" FOREIGN KEY ("CurrencyKey") REFERENCES "DimCurrency"("CurrencyKey");


--
-- TOC entry 2181 (class 2606 OID 21267)
-- Name: FK_DimOrganization_DimOrganization; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimOrganization"
    ADD CONSTRAINT "FK_DimOrganization_DimOrganization" FOREIGN KEY ("ParentOrganizationKey") REFERENCES "DimOrganization"("OrganizationKey");


--
-- TOC entry 2183 (class 2606 OID 21277)
-- Name: FK_DimProductSubcategory_DimProductCategory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimProductSubcategory"
    ADD CONSTRAINT "FK_DimProductSubcategory_DimProductCategory" FOREIGN KEY ("ProductCategoryKey") REFERENCES "DimProductCategory"("ProductCategoryKey");


--
-- TOC entry 2182 (class 2606 OID 21272)
-- Name: FK_DimProduct_DimProductSubcategory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimProduct"
    ADD CONSTRAINT "FK_DimProduct_DimProductSubcategory" FOREIGN KEY ("ProductSubcategoryKey") REFERENCES "DimProductSubcategory"("ProductSubcategoryKey");


--
-- TOC entry 2184 (class 2606 OID 21282)
-- Name: FK_DimReseller_DimGeography; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DimReseller"
    ADD CONSTRAINT "FK_DimReseller_DimGeography" FOREIGN KEY ("GeographyKey") REFERENCES "DimGeography"("GeographyKey");


--
-- TOC entry 2185 (class 2606 OID 21287)
-- Name: FK_FactCallCenter_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactCallCenter"
    ADD CONSTRAINT "FK_FactCallCenter_DimDate" FOREIGN KEY ("DateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2186 (class 2606 OID 21292)
-- Name: FK_FactCurrencyRate_DimCurrency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactCurrencyRate"
    ADD CONSTRAINT "FK_FactCurrencyRate_DimCurrency" FOREIGN KEY ("CurrencyKey") REFERENCES "DimCurrency"("CurrencyKey");


--
-- TOC entry 2187 (class 2606 OID 21297)
-- Name: FK_FactCurrencyRate_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactCurrencyRate"
    ADD CONSTRAINT "FK_FactCurrencyRate_DimDate" FOREIGN KEY ("DateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2188 (class 2606 OID 21302)
-- Name: FK_FactFinance_DimAccount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactFinance"
    ADD CONSTRAINT "FK_FactFinance_DimAccount" FOREIGN KEY ("AccountKey") REFERENCES "DimAccount"("AccountKey");


--
-- TOC entry 2189 (class 2606 OID 21307)
-- Name: FK_FactFinance_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactFinance"
    ADD CONSTRAINT "FK_FactFinance_DimDate" FOREIGN KEY ("DateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2190 (class 2606 OID 21312)
-- Name: FK_FactFinance_DimDepartmentGroup; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactFinance"
    ADD CONSTRAINT "FK_FactFinance_DimDepartmentGroup" FOREIGN KEY ("DepartmentGroupKey") REFERENCES "DimDepartmentGroup"("DepartmentGroupKey");


--
-- TOC entry 2191 (class 2606 OID 21317)
-- Name: FK_FactFinance_DimOrganization; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactFinance"
    ADD CONSTRAINT "FK_FactFinance_DimOrganization" FOREIGN KEY ("OrganizationKey") REFERENCES "DimOrganization"("OrganizationKey");


--
-- TOC entry 2192 (class 2606 OID 21322)
-- Name: FK_FactFinance_DimScenario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactFinance"
    ADD CONSTRAINT "FK_FactFinance_DimScenario" FOREIGN KEY ("ScenarioKey") REFERENCES "DimScenario"("ScenarioKey");


--
-- TOC entry 2202 (class 2606 OID 21372)
-- Name: FK_FactInternetSalesReason_DimSalesReason; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSalesReason"
    ADD CONSTRAINT "FK_FactInternetSalesReason_DimSalesReason" FOREIGN KEY ("SalesReasonKey") REFERENCES "DimSalesReason"("SalesReasonKey");


--
-- TOC entry 2201 (class 2606 OID 21367)
-- Name: FK_FactInternetSalesReason_FactInternetSales; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSalesReason"
    ADD CONSTRAINT "FK_FactInternetSalesReason_FactInternetSales" FOREIGN KEY ("SalesOrderNumber", "SalesOrderLineNumber") REFERENCES "FactInternetSales"("SalesOrderNumber", "SalesOrderLineNumber");


--
-- TOC entry 2193 (class 2606 OID 21327)
-- Name: FK_FactInternetSales_DimCurrency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimCurrency" FOREIGN KEY ("CurrencyKey") REFERENCES "DimCurrency"("CurrencyKey");


--
-- TOC entry 2194 (class 2606 OID 21332)
-- Name: FK_FactInternetSales_DimCustomer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimCustomer" FOREIGN KEY ("CustomerKey") REFERENCES "DimCustomer"("CustomerKey");


--
-- TOC entry 2195 (class 2606 OID 21337)
-- Name: FK_FactInternetSales_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimDate" FOREIGN KEY ("OrderDateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2196 (class 2606 OID 21342)
-- Name: FK_FactInternetSales_DimDate1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimDate1" FOREIGN KEY ("DueDateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2197 (class 2606 OID 21347)
-- Name: FK_FactInternetSales_DimDate2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimDate2" FOREIGN KEY ("ShipDateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2198 (class 2606 OID 21352)
-- Name: FK_FactInternetSales_DimProduct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimProduct" FOREIGN KEY ("ProductKey") REFERENCES "DimProduct"("ProductKey");


--
-- TOC entry 2199 (class 2606 OID 21357)
-- Name: FK_FactInternetSales_DimPromotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimPromotion" FOREIGN KEY ("PromotionKey") REFERENCES "DimPromotion"("PromotionKey");


--
-- TOC entry 2200 (class 2606 OID 21362)
-- Name: FK_FactInternetSales_DimSalesTerritory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_DimSalesTerritory" FOREIGN KEY ("SalesTerritoryKey") REFERENCES "DimSalesTerritory"("SalesTerritoryKey");


--
-- TOC entry 2203 (class 2606 OID 21377)
-- Name: FK_FactProductInventory_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactProductInventory"
    ADD CONSTRAINT "FK_FactProductInventory_DimDate" FOREIGN KEY ("DateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2204 (class 2606 OID 21382)
-- Name: FK_FactProductInventory_DimProduct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactProductInventory"
    ADD CONSTRAINT "FK_FactProductInventory_DimProduct" FOREIGN KEY ("ProductKey") REFERENCES "DimProduct"("ProductKey");


--
-- TOC entry 2205 (class 2606 OID 21387)
-- Name: FK_FactResellerSales_DimCurrency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimCurrency" FOREIGN KEY ("CurrencyKey") REFERENCES "DimCurrency"("CurrencyKey");


--
-- TOC entry 2206 (class 2606 OID 21392)
-- Name: FK_FactResellerSales_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimDate" FOREIGN KEY ("OrderDateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2207 (class 2606 OID 21397)
-- Name: FK_FactResellerSales_DimDate1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimDate1" FOREIGN KEY ("DueDateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2208 (class 2606 OID 21402)
-- Name: FK_FactResellerSales_DimDate2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimDate2" FOREIGN KEY ("ShipDateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2209 (class 2606 OID 21407)
-- Name: FK_FactResellerSales_DimEmployee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimEmployee" FOREIGN KEY ("EmployeeKey") REFERENCES "DimEmployee"("EmployeeKey");


--
-- TOC entry 2210 (class 2606 OID 21412)
-- Name: FK_FactResellerSales_DimProduct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimProduct" FOREIGN KEY ("ProductKey") REFERENCES "DimProduct"("ProductKey");


--
-- TOC entry 2211 (class 2606 OID 21417)
-- Name: FK_FactResellerSales_DimPromotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimPromotion" FOREIGN KEY ("PromotionKey") REFERENCES "DimPromotion"("PromotionKey");


--
-- TOC entry 2212 (class 2606 OID 21422)
-- Name: FK_FactResellerSales_DimReseller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimReseller" FOREIGN KEY ("ResellerKey") REFERENCES "DimReseller"("ResellerKey");


--
-- TOC entry 2213 (class 2606 OID 21427)
-- Name: FK_FactResellerSales_DimSalesTerritory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactResellerSales"
    ADD CONSTRAINT "FK_FactResellerSales_DimSalesTerritory" FOREIGN KEY ("SalesTerritoryKey") REFERENCES "DimSalesTerritory"("SalesTerritoryKey");


--
-- TOC entry 2214 (class 2606 OID 21432)
-- Name: FK_FactSalesQuota_DimDate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactSalesQuota"
    ADD CONSTRAINT "FK_FactSalesQuota_DimDate" FOREIGN KEY ("DateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2215 (class 2606 OID 21437)
-- Name: FK_FactSalesQuota_DimEmployee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactSalesQuota"
    ADD CONSTRAINT "FK_FactSalesQuota_DimEmployee" FOREIGN KEY ("EmployeeKey") REFERENCES "DimEmployee"("EmployeeKey");


--
-- TOC entry 2216 (class 2606 OID 21442)
-- Name: FK_FactSurveyResponse_CustomerKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactSurveyResponse"
    ADD CONSTRAINT "FK_FactSurveyResponse_CustomerKey" FOREIGN KEY ("CustomerKey") REFERENCES "DimCustomer"("CustomerKey");


--
-- TOC entry 2217 (class 2606 OID 21447)
-- Name: FK_FactSurveyResponse_DateKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "FactSurveyResponse"
    ADD CONSTRAINT "FK_FactSurveyResponse_DateKey" FOREIGN KEY ("DateKey") REFERENCES "DimDate"("DateKey");


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-09-21 12:35:07

--
-- PostgreSQL database dump complete
--

