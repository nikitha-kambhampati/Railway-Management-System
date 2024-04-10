CREATE PROCEDURE sp_ReloadCharlieCard
    @CharlieId INT,
    @Amount DECIMAL(10,2),
    @TransactionId INT OUTPUT
AS
BEGIN
    OPEN SYMMETRIC KEY CharlieCardSymmetricKey
    DECRYPTION BY CERTIFICATE MBTACharlieCardCertificate;

    DECLARE @EncryptedAmount VARBINARY(MAX) = ENCRYPTBYKEY(Key_GUID('TransactionAmountSymmetricKey'), CAST(@Amount AS NVARCHAR));

    UPDATE MBTA_CHARLIE
    SET balance = balance + @Amount
    WHERE charlie_id = @CharlieId;

    CLOSE SYMMETRIC KEY CharlieCardSymmetricKey;

    INSERT INTO MBTA_TRANSACTION
        (charlie_id, amount_encrypted)
    VALUES
        (@CharlieId, @EncryptedAmount);

    SET @TransactionId = SCOPE_IDENTITY();
END
