// controllers/userController.js
const crypto = require('crypto');

const mssql = require("mssql/msnodesqlv8");
const dbConfig = require('../config/dbConfig');

const encryptEmail = (email) => {
    // Generate encryption key
    const keyBytes = crypto.randomBytes(32); // 32 bytes for AES-256
    const encryptionKey = Buffer.from(keyBytes.toString('hex'), 'hex');

    // Create cipher using encryption key
    const cipher = crypto.createCipheriv('aes-256-cbc', encryptionKey, Buffer.alloc(16)); // 16 bytes IV for AES-256-CBC

    // Encrypt email
    let encryptedEmail = Buffer.concat([cipher.update(email), cipher.final()]);

    // Return encrypted email and encryption key
    return {
        encryptedEmail: Buffer.from(encryptedEmail.toString('hex'), 'hex'),
        encryptionKey: encryptionKey
    };
};

// CRUD operations for the User table
module.exports = {
    // Get all users
    async getUsers(req, res) {
        const { tableName } = req.params;

        try {
            const pool = await mssql.connect(dbConfig);
            const result = await pool.request().query(`SELECT * FROM ${tableName}`);
            res.json(result.recordset);
        } catch (error) {
            console.error(`Error fetching records from ${tableName}:`, error);
            res.status(500).json({ error: `Error fetching records from ${tableName}` });
        }
    },

    async getPkName(req, res) {
        const { tableName } = req.params;

        try {
            const pool = await mssql.connect(dbConfig);
            const result = await pool.request().query(`SELECT c.name AS COLUMN_NAME
            FROM sys.columns c
            INNER JOIN sys.index_columns ic ON c.object_id = ic.object_id AND c.column_id = ic.column_id
            INNER JOIN sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
            WHERE OBJECT_NAME(c.object_id) = '${tableName}'
              AND i.is_primary_key = 1;`);
            res.json(result.recordset);
        } catch (error) {
            console.error(`Error fetching records from ${tableName}:`, error);
            res.status(500).json({ error: `Error fetching records from ${tableName}` });
        }
    },


    // Get user by ID
    async getUserById(req, res) {
        const userId = req.params.id;
        try {
            const pool = await mssql.connect(dbConfig);
            const result = await pool.request().input('id', mssql.Int, userId).query('SELECT * FROM Users WHERE id = @id');
            res.json(result.recordset[0]);
        } catch (error) {
            console.error('Error fetching user by ID:', error);
            res.status(500).json({ error: 'Error fetching user by ID' });
        }
    },

    // async createRecord(req, res) {
    //     const tableName = req.params.tableName;
    //     const data = req.body;

    //     try {
    //         const pool = await mssql.connect(dbConfig);
    //         const transaction = new mssql.Transaction(pool);
    //         await transaction.begin();

    //         // Encrypt email value if it exists in the data
    //         if ('email' in data) {
    //             const encryptionKey = generateEncryptionKey();
    //             const cipher = crypto.createCipheriv('aes-256-cbc', encryptionKey, Buffer.alloc(16));
    //             let encryptedEmail = cipher.update(data.email, 'utf-8', 'hex');
    //             encryptedEmail += cipher.final('hex');
    //             const encryptedBuffer = Buffer.from(encryptedEmail, 'hex'); // Convert hexadecimal string to buffer
    //             data.email_encrypted = encryptedBuffer;
    //         }




    //         const columns = Object.keys(data).join(', ');
    //         const values = Object.values(data);

    //         const valuePlaceholders = values.map((_, index) => `@value${index}`).join(', ');
    //         const insertQuery = `INSERT INTO ${tableName} (${columns}) VALUES (${valuePlaceholders})`;


    //         // Construct parameter definitions for sp_executesql
    //         const params = [];
    //         const paramDefinitions = Object.entries(data).map(([key, value], index) => {
    //             const paramName = `@value${index}`;
    //             let paramType = 'NVARCHAR(MAX)'; // Default to string type
    //             console.log(value)

    //             // Adjust data type for dates

    //             if (value instanceof Date) {
    //                 paramType = 'DATETIME';
    //                 console.log('hi')
    //             } else if (typeof value === 'number') {
    //                 paramType = 'INT'; // Adjust data type for integers
    //                 console.log('cgdsgyc')
    //             }
    //             else if (value == null) {
    //                 paramType = 'VARBINARY(MAX)'
    //             }

    //             params.push({ name: paramName, type: paramType, value: value });
    //             return `${paramName} ${paramType}`;
    //         }).join(', ');

    //         console.log('Insert Query:', insertQuery);
    //         console.log('Parameters:', params);


    //         try {
    //             // Open the symmetric key for encryption
    //             await transaction.request().query('OPEN SYMMETRIC KEY EmailSymmetricKey DECRYPTION BY CERTIFICATE PersonEmailCertificate');

    //             // Construct the sp_executesql query
    //             const sql = `DECLARE @sql NVARCHAR(MAX), @ParmDefinition NVARCHAR(MAX);
    //                      SET @sql = '${insertQuery}';
    //                      SET @ParmDefinition = '${paramDefinitions}';
    //                      EXEC sp_executesql @sql, @ParmDefinition, ${values.map((_, index) => `@value${index} = '${values[index]}'`).join(', ')};`;

    //             // Execute the sp_executesql query within the transaction
    //             await transaction.request().query(sql);

    //             // Close the symmetric key after insertion
    //             await transaction.request().query('CLOSE SYMMETRIC KEY EmailSymmetricKey');

    //             // Commit the transaction
    //             await transaction.commit();

    //             res.status(201).json({ success: true, message: 'Record created successfully' });
    //         } catch (error) {
    //             // Rollback the transaction in case of an error
    //             await transaction.rollback();
    //             console.error('Error creating record:', error);
    //             res.status(500).json({ success: false, error: 'Error creating record' });
    //         }
    //     } catch (error) {
    //         console.error('Error creating record:', error);
    //         res.status(500).json({ success: false, error: 'Error creating record' });
    //     }
    // },

    async insertPerson(req, res) {
        let data = req.body;
        try {
            const pool = await mssql.connect(dbConfig);
            const request = pool.request();

            // Convert date_of_birth string to a SQL Date object
            const dateOfBirth = data.date_of_birth;

            // Prepare the SQL query with parameterized values
            const sqlQuery = `
                INSERT INTO Person (PERSON_ID, first_name, last_name, email, email_encrypted, date_of_birth, street_name, state, city, zipcode, Person_type)
                VALUES (@PERSON_ID, @first_name, @last_name, @email, @email_encrypted,
                        @date_of_birth, @street_name, @state, @city, @zipcode, @Person_type)
            `;

            request.input('PERSON_ID', mssql.Int, data.PERSON_ID);
            request.input('first_name', mssql.NVarChar, data.first_name);
            request.input('last_name', mssql.NVarChar, data.last_name);
            request.input('email', mssql.NVarChar, data.email);
            request.input('email_encrypted', mssql.Binary, encryptEmail(data.email).encryptedEmail);
            request.input('date_of_birth', mssql.DateTime, dateOfBirth);
            request.input('street_name', mssql.NVarChar, data.street_name);
            request.input('state', mssql.NVarChar, data.state);
            request.input('city', mssql.NVarChar, data.city);
            request.input('zipcode', mssql.NVarChar, data.zipcode);
            request.input('Person_type', mssql.NVarChar, data.Person_type);

            // Execute the query
            const result = await request.query(sqlQuery);

            res.status(200).json({ message: 'Record inserted successfully' });
        } catch (error) {
            console.error('Error inserting record:', error);
            res.status(500).json({ message: 'Error inserting record' });
        }
    },

    async insertRecord(req, res) {
        const { tableName } = req.params;
        const data = req.body;


        try {
            const pool = await mssql.connect(dbConfig);
            const request = pool.request();

            // Prepare the SQL query with parameterized values
            const columns = Object.keys(data).join(', ');
            const values = Object.values(data);
            const placeholders = Object.keys(data).map((key) => `@${key}`).join(', ');

            const sqlQuery = `
                INSERT INTO ${tableName} (${columns})
                VALUES (${placeholders})
            `;

            // Set input parameters based on data type
            Object.entries(data).forEach(([key, value], index) => {
                const paramName = key;
                console.log(key);
                let paramType = mssql.NVarChar; // Default to string type

                if(paramName.toLowerCase().includes("encrypted")) {
                    paramType = mssql.Binary;
                    value = Buffer.from(value, 'base64');
                }

                if (typeof value === 'number') {
                    paramType = mssql.Int;
                } else if (value instanceof Date) {
                    paramType = mssql.DateTime;
                }

                request.input(paramName, paramType, value);
            });

            console.log('SQL Query:', sqlQuery);
            console.log('Input Parameters:', request.parameters);

            // Execute the query
            const result = await request.query(sqlQuery);

            res.status(200).json({ message: 'Record inserted successfully' });
        } catch (error) {
            console.error('Error inserting record:', error);
            res.status(500).json({ message: 'Error inserting record', error: error.message });
        }
    },


    async updatePerson(req, res) {
        const personId = req.params.id;
        const updates = req.body;

        try {
            const pool = await mssql.connect(dbConfig);
            let updateQuery = 'UPDATE Person SET ';

            // Construct the update query dynamically based on provided fields
            const updateFields = [];
            const params = [];
            Object.keys(updates).forEach(key => {
                if (key !== 'PERSON_ID') { // Exclude PERSON_ID from update
                    updateFields.push(`${key} = @${key}`);
                    params.push([key, mssql.NVarChar, updates[key]]);
                }
            });

            updateQuery += updateFields.join(', ') + ' WHERE PERSON_ID = @personId';
            params.push(['personId', mssql.Int, personId]);

            // Execute the update query
            const result = await pool.request();
            params.forEach(param => result.input(...param));
            await result.query(updateQuery);

            res.json({ message: 'Person updated successfully' });
        } catch (error) {
            console.error('Error updating person:', error);
            res.status(500).json({ error: 'Error updating person' });
        }
    },

    async updateRecord(req, res) {
        const { tableName, id, idParamName } = req.params;
        const recordId = id;
        const updates = req.body;

        try {
            const pool = await mssql.connect(dbConfig);
            let updateQuery = `UPDATE ${tableName} SET `;

            // Construct the update query dynamically based on provided fields
            const updateFields = [];
            const params = [];
            Object.keys(updates).forEach(key => {
                if (key !== idParamName) { // Exclude the ID parameter from update
                    if(key.toLowerCase().includes("encrypted")) {
                        let buffervalue = Buffer.from(updates[key], 'base64');
                        updateFields.push(`${key} = @${key}`);
                        params.push([key, mssql.Binary, buffervalue]);
                    } else {
                        updateFields.push(`${key} = @${key}`);
                        params.push([key, mssql.NVarChar, updates[key]]);
                    }
                }
            });

            updateQuery += updateFields.join(', ') + ` WHERE ${idParamName} = @idParamName`;
            params.push(['idParamName', mssql.Int, recordId]);

            // Execute the update query
            const result = await pool.request();
            params.forEach(param => result.input(...param));
            await result.query(updateQuery);

            res.json({ message: `${tableName} updated successfully` });
        } catch (error) {
            console.error(`Error updating ${tableName}:`, error);
            res.status(500).json({ error: `Error updating ${tableName}` });
        }
    },


    async deletePerson(req, res) {
        const { tableName, id, idParamName } = req.params;

        try {
            const pool = await mssql.connect(dbConfig);
            const query = `DELETE FROM ${tableName} WHERE ${idParamName} = @id`;
            await pool.request().input('id', mssql.Int, id).query(query);
            res.json({ message: `${tableName} deleted successfully` });
        } catch (error) {
            console.error(`Error deleting ${tableName}:`, error);
            res.status(500).json({ error: `Error deleting ${tableName}` });
        }
    }

};
