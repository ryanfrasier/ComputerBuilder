CREATE DATABASE IF NOT EXISTS ComputerBuilder;
USE ComputerBuilder;

DROP TABLE IF EXISTS systems, solidStateDrive, powerSupplyUnit, randomAccessMemory, hardDrive, graphicsProcessingUnit, motherboard, builder, centralProcessingUnit, heatSink;

CREATE TABLE graphicsProcessingUnit
(
    modelName VARCHAR(50),
    abbreviation VARCHAR(50),
    manufacturer VARCHAR(50)NOT NULL,
    cost DECIMAL (7,2) NOT NULL,
    PRIMARY KEY pkGPU(modelName)
);

CREATE TABLE hardDrive
(
    modelName VARCHAR(50),
    abbreviation VARCHAR(50),
    manufacturer VARCHAR(50)NOT NULL,
    cost DECIMAL (7,2) NOT NULL,
    storageSize VARCHAR(50) NOT NULL,
    PRIMARY KEY pkHDD(modelName)
);

CREATE TABLE solidStateDrive(
    modelName VARCHAR(50),
    abbreviation VARCHAR(50),
    manufacturer VARCHAR(50) NOT NULL,
    modelType VARCHAR(50) NOT NULL,
    storageSize INT NOT NULL,
    cost DECIMAL(7,2) NOT NULL,
    PRIMARY KEY pkSSD (modelName)
);

CREATE TABLE powerSupplyUnit(
    modelName VARCHAR(50),
    abbreviation VARCHAR(50),
    wattage INT NOT NULL,
    cost DECIMAL(7,2) NOT NULL,
    PRIMARY KEY pkPSU (modelName)
);

CREATE TABLE randomAccessMemory(
    modelName VARCHAR(50),
    abbreviation VARCHAR(50),
    manufacturer VARCHAR(50) NOT NULL,
    storageSize INT NOT NULL,
    modelType VARCHAR(50) NOT NULL,
    cost DECIMAL(7,2) NOT NULL,
    PRIMARY KEY pkRAM (modelName)
);

CREATE TABLE motherboard
(
    modelName VARCHAR(50),
    abbreviation VARCHAR(50),
    manufacturer VARCHAR(50) NOT NULL,
    cost DECIMAL(7,2) NOT NULL,
    PRIMARY KEY pkMOBO (modelName)
);


CREATE TABLE builder
(
    builderID INT AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY pkBuilder(builderID)
);

CREATE TABLE centralProcessingUnit
(
    modelName VARCHAR(50),
    Abbreviation VARCHAR(50),
    manufacturer VARCHAR(50) NOT NULL,
    cost DECIMAL(7,2) NOT NULL,
    PRIMARY KEY pkCPU(modelName)
);

CREATE TABLE heatSink
(
    modelName VARCHAR(50),
    Abbreviation VARCHAR(50),
    manufacturer VARCHAR(50) NOT NULL,
    modelType VARCHAR(50) NOT NULL,
    cost DECIMAL(7,2) NOT NULL,
    PRIMARY KEY pkHS(modelName)
);
CREATE TABLE systems
(
    systemID INT AUTO_INCREMENT,
    builderID INT NOT NULL,
    totalCost DECIMAL(7,2) NOT NULL,
    cpu VARCHAR(50) NOT NULL,
    gpu VARCHAR(50),
    mobo VARCHAR(50) NOT NULL,
    ram VARCHAR(50) NOT NULL,
    psu VARCHAR(50) NOT NULL,
    ssd VARCHAR(50),
    hdd VARCHAR(50),
    hs VARCHAR(50) NOT NULL,
    PRIMARY KEY pkSystems(systemID),
    FOREIGN KEY (builderID) REFERENCES builder(builderID) ON DELETE CASCADE,
    FOREIGN KEY (gpu) REFERENCES graphicsProcessingUnit(modelName) ON DELETE CASCADE,
    FOREIGN KEY (mobo) REFERENCES motherboard(modelName) ON DELETE CASCADE,
    FOREIGN KEY (ram) REFERENCES randomAccessMemory(modelName) ON DELETE CASCADE,
    FOREIGN KEY (psu) REFERENCES powerSupplyUnit(modelName) ON DELETE CASCADE,
    FOREIGN KEY (ssd) REFERENCES solidStateDrive(modelName) ON DELETE CASCADE,
    FOREIGN KEY (hdd) REFERENCES hardDrive(modelName) ON DELETE CASCADE,
    FOREIGN KEY (hs) REFERENCES heatSink(modelName) ON DELETE CASCADE,
    FOREIGN KEY (cpu) REFERENCES centralProcessingUnit(modelName) ON DELETE CASCADE
);