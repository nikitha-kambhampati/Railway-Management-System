
CREATE PROCEDURE sp_UpdateTrainStatus
    @TrainId INT,
    @Status VARCHAR(255),
    @Latitude DECIMAL(9,6),
    @Longitude DECIMAL(9,6),
    @DelayReason NVARCHAR(250) = NULL,
    @RouteId INT,
    @StationId INT
AS
BEGIN
    DECLARE @EventTime DATETIME2 = GETDATE();

    INSERT INTO TRAIN_STATUS_HISTORY
        (train_id, station_id, status, longitude, latitude, event_time, delay_reason)
    VALUES
        (@TrainId, @StationId, @Status, @Longitude, @Latitude, @EventTime, @DelayReason);

    UPDATE TRAIN_CURRENTSTATUS
    SET latitude = @Latitude,
        longitude = @Longitude,
        status = @Status,
        last_update = @EventTime
    WHERE train_id = @TrainId;
END
