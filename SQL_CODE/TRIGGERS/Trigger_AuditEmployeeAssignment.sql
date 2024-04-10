-- Audit Trail for Employee Assignments --
CREATE TRIGGER trg_AfterUpdateEmployeeAssignment
ON EMPLOYEE_TRAIN_ASSIGNMENT
AFTER UPDATE
AS
BEGIN
    INSERT INTO EmployeeAssignmentAudit(employee_id, train_id, start_date, end_date, ActionTaken, ActionDate)
    SELECT employee_id, train_id, start_date, end_date, 'UPDATE', GETDATE()
    FROM inserted; 
END;
