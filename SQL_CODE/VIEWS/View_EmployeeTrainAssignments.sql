CREATE VIEW vw_EmployeeTrainAssignments
AS
SELECT
    p.first_name,
    p.last_name,
    ti.train_serial_no,
    eta.start_date,
    eta.end_date
FROM
    EMPLOYEE_TRAIN_ASSIGNMENT eta
    INNER JOIN EMPLOYEE e ON eta.employee_id = e.employee_id
    INNER JOIN PERSON p ON e.employee_id = p.PERSON_ID
    INNER JOIN MBTA_TRAININFO ti ON eta.train_id = ti.train_id;