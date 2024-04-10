// routes/userRoutes.js

const express = require('express');
const router = express.Router();
const userController = require('../controllers/controller');

// Routes for CRUD operations
router.get('/users/:tableName', userController.getUsers);
router.get('/users/:id', userController.getUserById);
router.get('/users/pkname/:tableName', userController.getPkName);
// router.post('/users', userController.insertPerson);
router.post('/users/:tableName', userController.insertRecord);
router.put('/users/:tableName/:idParamName/:id', userController.updateRecord);
router.delete('/users/:tableName/:idParamName/:id', userController.deletePerson);

module.exports = router;
