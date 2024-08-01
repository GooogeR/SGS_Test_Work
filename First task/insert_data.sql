-- Используем БД
USE MyDatabase;
GO

-- Вставка данных в таблицу Контейнеров
INSERT INTO Containers (ID, Number, Type, Length, Width, Height, Weight, IsEmpty, ArrivalDate)
VALUES (NEWID(), 12345, 'Type1', 20, 10, 15, 2000, 0, GETDATE());

-- Вставка данных в таблицу Операций
INSERT INTO Operations (ID, ContainerID, StartDate, EndDate, OperationType, OperatorName, InspectionPlace)
VALUES (NEWID(), (SELECT TOP 1 ID FROM Containers), GETDATE(), DATEADD(hour, 2, GETDATE()), 'Loading', 'Operator1', 'InspectionPlace1');
GO
