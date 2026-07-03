const express = require('express');
const router = express.Router();
const calendarController = require('../controllers/calendarController');

router.get('/', calendarController.getCalendarEvents);
router.post('/', calendarController.createCalendarEvent);
router.put('/:id', calendarController.updateCalendarEvent);
router.delete('/:id', calendarController.deleteCalendarEvent);

module.exports = router;
