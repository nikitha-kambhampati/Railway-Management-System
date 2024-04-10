CREATE VIEW vw_TrainScheduleDetails
AS
SELECT
    ti.train_serial_no,
    ri.route_from,
    ri.route_to,
    s.arrival_time,
    s.departure_time
FROM
    MBTA_SCHEDULE s
    INNER JOIN MBTA_TRAININFO ti ON s.train_id = ti.train_id
    INNER JOIN MBTA_ROUTE_SCHEDULE rs ON s.schedule_id = rs.schedule_id
    INNER JOIN MBTA_ROUTEINFO ri ON rs.route_id = ri.route_id;
