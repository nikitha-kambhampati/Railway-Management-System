-- Column Level Encryption for PERSON(email) -- 
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Northeastern@123';

CREATE CERTIFICATE PersonEmailCertificate WITH SUBJECT = 'Email Encryption';

CREATE SYMMETRIC KEY EmailSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE PersonEmailCertificate;



-- Column Level Encryption for MBTA_CHARLIE(card_number) -- 
CREATE CERTIFICATE MBTACharlieCardCertificate WITH SUBJECT = 'MBTA Charlie Card Encryption';

CREATE SYMMETRIC KEY CharlieCardSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MBTACharlieCardCertificate;


-- Column Level Encryption for MBTA_TRANSACTION(amount) -- 
CREATE CERTIFICATE MBTATransactionAmountCertificate WITH SUBJECT = 'MBTA Transaction Amount Encryption';

CREATE SYMMETRIC KEY TransactionAmountSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MBTATransactionAmountCertificate;
