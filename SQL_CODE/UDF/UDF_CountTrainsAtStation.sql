CREATE FUNCTION dbo.CountTrainsAtStation (
    @StationId INT,
    @Date DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @TrainCount INT;

    SELECT @TrainCount = COUNT(DISTINCT th.train_id)
    FROM TRAIN_STATUS_HISTORY th
    WHERE th.station_id = @StationId
        AND CAST(th.event_time AS DATE) = @Date;

    RETURN ISNULL(@TrainCount, 0);
END;
