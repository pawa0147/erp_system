const express = require('express');
const router = express.Router();
const hrController = require('../controllers/hrController');

router.get('/leaves', hrController.getLeaves);
router.post('/leaves', hrController.createLeave);
router.put('/leaves/:id', hrController.updateLeave);
router.delete('/leaves/:id', hrController.deleteLeave);

router.get('/feedbacks', hrController.getFeedbacks);
router.post('/feedbacks', hrController.createFeedback);
router.delete('/feedbacks/:id', hrController.deleteFeedback);

router.get('/leave-balances', hrController.getLeaveBalances);

module.exports = router;
