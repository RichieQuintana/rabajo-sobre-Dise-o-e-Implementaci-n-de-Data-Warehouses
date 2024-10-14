CREATE DATABASE BillionairesDB
Go
USE BillionairesDB
Go

-- Creación de la Dimensión Persona
CREATE TABLE Dim_Person (
    PersonID INT PRIMARY KEY IDENTITY(1,1),
    personName NVARCHAR(255),
    age INT,
    source NVARCHAR(255),
    category NVARCHAR(255),
    industries NVARCHAR(255)
);

-- Creación de la Dimensión Ubicación
CREATE TABLE Dim_Location (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    country NVARCHAR(255),
    city NVARCHAR(255),
    countryOfCitizenship NVARCHAR(255),
    latitude_country FLOAT,
    longitude_country FLOAT
);

-- Creación de la Dimensión País
CREATE TABLE Dim_Country (
    CountryID INT PRIMARY KEY IDENTITY(1,1),
    gdp_country NVARCHAR(255),
    tax_revenue_country_country FLOAT,
    total_tax_rate_country FLOAT,
    population_country FLOAT,
    life_expectancy_country FLOAT,
    cpi_change_country FLOAT,
    gross_primary_education_enrollment_country FLOAT,
    gross_tertiary_education_enrollment FLOAT
);

-- Creación de la Tabla de Hechos
CREATE TABLE Fact_Billionaire (
    FactID INT PRIMARY KEY IDENTITY(1,1),
    rank INT,
    finalWorth FLOAT,
    PersonID INT FOREIGN KEY REFERENCES Dim_Person(PersonID),
    LocationID INT FOREIGN KEY REFERENCES Dim_Location(LocationID),
    CountryID INT FOREIGN KEY REFERENCES Dim_Country(CountryID)
);
