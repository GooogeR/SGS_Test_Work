-- Создание БД
CREATE DATABASE MyDatabase;
GO

-- Использование БД
USE MyDatabase;
GO

-- Создание таблицы Контейнеров
CREATE TABLE Containers (
    ID UNIQUEIDENTIFIER PRIMARY KEY,
    Number INT,
    Type NVARCHAR(255),
    Length INT,
    Width INT,
    Height INT,
    Weight INT,
    IsEmpty BIT,
    ArrivalDate DATETIME
);

-- Создание таблицы Операций
CREATE TABLE Operations (
    ID UNIQUEIDENTIFIER PRIMARY KEY,
    ContainerID UNIQUEIDENTIFIER,
    StartDate DATETIME,
    EndDate DATETIME,
    OperationType NVARCHAR(255),
    OperatorName NVARCHAR(255),
    InspectionPlace NVARCHAR(255),
    FOREIGN KEY (ContainerID) REFERENCES Containers(ID)
);
GO
