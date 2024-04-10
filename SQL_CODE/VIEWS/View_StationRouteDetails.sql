CREATE VIEW vw_StationRouteDetails
AS
SELECT
    s.station_name,
    s.station_zipcode,
    ri.route_from,
    ri.route_to,
    ri.duration,
    t.type_name
FROM
    MBTA_STATION s
    INNER JOIN STATION_ROUTE sr ON s.station_id = sr.station_id
    INNER JOIN MBTA_ROUTEINFO ri ON sr.route_id = ri.route_id
    INNER JOIN ROUTE_TYPE rt ON ri.route_id = rt.route_id
    INNER JOIN MBTA_TYPES t ON rt.type_id = t.type_id;