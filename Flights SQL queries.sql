SELECT * FROM flights
-- Count missing DepartureDelay, and Cancelled
SELECT
    SUM(CASE WHEN departure_delay IS NULL THEN 1 ELSE 0 END) AS Missing_DepartureDelay,
    SUM(CASE WHEN actual_departure IS NULL THEN 1 ELSE 0 END) AS Missing_ActualDeparture
FROM Flights;

SELECT SUM(cancelled) AS TotalCancelledFlight FROM flights 

-- Airlines
SELECT DISTINCT airline
FROM Flights;

-- If stored as string, convert to INT
ALTER TABLE Flights
ALTER COLUMN departure_delay INT;

-- Create a new table for Flights_NoCancelled_Table
SELECT *
INTO Flights_NoCancelled_Table
FROM Flights
WHERE Cancelled = 0;

SELECT *
FROM Flights_NoCancelled

-- Create Delay_status and Delay_category column
ALTER TABLE Flights_NoCancelled_Table
ADD Delay_status VARCHAR(10);

ALTER TABLE Flights_NoCancelled_Table
ADD Delay_category VARCHAR(20);

UPDATE Flights_NoCancelled_Table
SET Delay_status = CASE 
                    WHEN departure_delay <= 0 THEN 'On-time'
                    ELSE 'Delayed'
                  END;
UPDATE Flights_NoCancelled_Table
SET Delay_category = CASE
                      WHEN departure_delay <= 15 THEN '0-15 min'
                      WHEN departure_delay <= 60 THEN '16-60 min'
                      ELSE '60+ min'
                    END;

SELECT * FROM Flights_NoCancelled_Table

-- 1) Average departure delay by airline
SELECT airline, AVG(departure_delay) AS Avg_DepDelay
FROM Flights_NoCancelled
GROUP BY airline;


-- 2) Cancelllation rate by airline
SELECT airline, 
       COUNT(*) AS TotalFlights,
       SUM(Cancelled) AS CancelledFlights,
       CAST(SUM(Cancelled)*100.0/COUNT(*) AS DECIMAL(5,2)) AS CancellationRate
FROM Flights
GROUP BY airline
ORDER BY CancellationRate DESC;

-- 3) Delayed flight rate by airline
SELECT Airline, 
       COUNT(*) AS TotalFlights,
       SUM(CASE WHEN Delay_status = 'Delayed' THEN 1 ELSE 0 end) AS DelayedFlights,
       CAST(SUM(CASE WHEN Delay_status = 'Delayed' THEN 1 ELSE 0 END)*100/ COUNT(*) AS DECIMAL (5,2)) AS DelayRate
FROM Flights_NoCancelled_Table
GROUP BY Airline;


-- 4) Delay by day of the week

SELECT 
    Airline,
    DATENAME(WEEKDAY, actual_departure) AS DayOfWeek,
    COUNT(*) AS TotalFlights,
    SUM(CASE WHEN Delay_status = 'Delayed' THEN 1 ELSE 0 END) AS DelayedFlights,
    CAST(SUM(CASE WHEN Delay_status = 'Delayed' THEN 1 ELSE 0 END) * 100.0 
         / COUNT(*) AS DECIMAL(5,2)) AS DelayRate
FROM Flights_NoCancelled_Table
GROUP BY 
    Airline,
    DATEPART(WEEKDAY, actual_departure),
    DATENAME(WEEKDAY, actual_departure)
ORDER BY 
    Airline,
    DATEPART(WEEKDAY, actual_departure);

---route based
SELECT 
    Airline,
    origin,
    destination,
    COUNT(*) AS TotalFlights,
    SUM(CASE WHEN Delay_status = 'Delayed' THEN 1 ELSE 0 END) AS DelayedFlights,
    CAST(SUM(CASE WHEN Delay_status = 'Delayed' THEN 1 ELSE 0 END) * 100.0 
         / COUNT(*) AS DECIMAL(5,2)) AS DelayRate
FROM Flights_NoCancelled_Table
GROUP BY 
    Airline, origin, destination
ORDER BY DelayRate DESC;




