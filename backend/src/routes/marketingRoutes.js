const express = require('express');
const router = express.Router();
const marketingController = require('../controllers/marketingController');

router.get('/campaigns', marketingController.getCampaigns);
router.post('/campaigns', marketingController.createCampaign);
router.put('/campaigns/:id', marketingController.updateCampaign);
router.delete('/campaigns/:id', marketingController.deleteCampaign);

// Marketing Calendar
router.get('/calendar', marketingController.getCalendar);
router.post('/calendar', marketingController.createCalendarEvent);

module.exports = router;
