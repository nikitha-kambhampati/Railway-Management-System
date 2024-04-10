CREATE TRIGGER trg_AfterInsertTransaction
ON MBTA_TRANSACTION
AFTER INSERT
AS
BEGIN
    UPDATE PF
    SET avg_sec = (
        SELECT AVG(RI.duration)
        FROM MBTA_ROUTEINFO RI
        INNER JOIN MBTA_STATION S ON RI.route_id = S.station_id
        WHERE S.station_id = PF.station_id
    ),
    sd_sec = (
        SELECT ISNULL(STDEV(RI.duration), 0) 
        FROM MBTA_ROUTEINFO RI
        INNER JOIN MBTA_STATION S ON RI.route_id = S.station_id
        WHERE S.station_id = PF.station_id
    )
    FROM MBTA_PASSENGERFREQUENCY PF
    JOIN MBTA_CHARLIE MC ON PF.passenger_id = MC.passenger_id
    JOIN inserted I ON MC.charlie_id = I.charlie_id
    WHERE PF.station_id IN (SELECT station_id FROM inserted);
END;
