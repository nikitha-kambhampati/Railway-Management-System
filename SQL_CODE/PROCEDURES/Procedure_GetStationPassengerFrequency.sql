
CREATE PROCEDURE sp_GetStationPassengerFrequency
    @StationId INT,
    @DayType VARCHAR(50),
    @AvgFrequency INT OUTPUT,
    @StdDevFrequency INT OUTPUT
AS
BEGIN
    SELECT @AvgFrequency = avg_sec, @StdDevFrequency = sd_sec
    FROM MBTA_PASSENGERFREQUENCY
    WHERE station_id = @StationId AND day_type = @DayType;
END

