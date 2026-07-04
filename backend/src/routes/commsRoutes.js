const express = require('express');
const router = express.Router();
const commsController = require('../controllers/commsController');

router.get('/messages', commsController.getMessages);
router.post('/messages', commsController.createMessage);

router.get('/notifications', commsController.getNotifications);
router.post('/notifications', commsController.createNotification);

module.exports = router;
