const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');

router.get('/audit-logs', adminController.getAuditLogs);
router.get('/activity', adminController.getUserActivity);
router.get('/monitoring', adminController.getMonitoringLogs);
router.get('/settings', adminController.getSettings);
router.put('/settings', adminController.updateSetting);

// Reuse user routes
const userController = require('../controllers/userController');
router.get('/users', userController.getUsers);

module.exports = router;
