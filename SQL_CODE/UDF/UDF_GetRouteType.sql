
CREATE FUNCTION dbo.GetRouteType (@RouteId INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @RouteType VARCHAR(50);

    SELECT @RouteType = t.type_name
    FROM MBTA_ROUTEINFO ri
    INNER JOIN ROUTE_TYPE rt ON ri.route_id = rt.route_id
    INNER JOIN MBTA_TYPES t ON rt.type_id = t.type_id
    WHERE ri.route_id = @RouteId;

    RETURN @RouteType;
END;


