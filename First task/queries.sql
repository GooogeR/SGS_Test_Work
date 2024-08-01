-- Используем БД
USE MyDatabase;
GO

-- Запрос для выборки всех данных из таблицы Контейнеров 
SELECT '[' + STRING_AGG(
    '{"ID":"' + CAST(ID AS NVARCHAR(36)) + '",' +
    '"Number":' + CAST(Number AS NVARCHAR(10)) + ',' +
    '"Type":"' + Type + '",' +
    '"Length":' + CAST(Length AS NVARCHAR(10)) + ',' +
    '"Width":' + CAST(Width AS NVARCHAR(10)) + ',' +
    '"Height":' + CAST(Height AS NVARCHAR(10)) + ',' +
    '"Weight":' + CAST(Weight AS NVARCHAR(10)) + ',' +
    '"IsEmpty":' + CAST(IsEmpty AS NVARCHAR(1)) + ',' +
    '"ArrivalDate":"' + FORMAT(ArrivalDate, 'yyyy-MM-ddTHH:mm:ss') + '"' +
    '}', ','
) + ']' AS JSONResult
FROM Containers;
GO

-- Запрос для выборки всех данных из таблицы Операций для определенного контейнера 
DECLARE @ContainerID UNIQUEIDENTIFIER;
SET @ContainerID = (SELECT TOP 1 ID FROM Containers);

SELECT '[' + STRING_AGG(
    '{"ID":"' + CAST(ID AS NVARCHAR(36)) + '",' +
    '"ContainerID":"' + CAST(ContainerID AS NVARCHAR(36)) + '",' +
    '"StartDate":"' + FORMAT(StartDate, 'yyyy-MM-ddTHH:mm:ss') + '",' +
    '"EndDate":"' + FORMAT(EndDate, 'yyyy-MM-ddTHH:mm:ss') + '",' +
    '"OperationType":"' + OperationType + '",' +
    '"OperatorName":"' + OperatorName + '",' +
    '"InspectionPlace":"' + InspectionPlace + '"' +
    '}', ','
) + ']' AS JSONResult
FROM Operations
WHERE ContainerID = @ContainerID;
GO
