const express = require('express');
const router = express.Router();
const personalController = require('../controllers/personalController');

router.get('/', personalController.getPersonalTransactions);
router.post('/', personalController.createPersonalTransaction);
router.delete('/:id', personalController.deletePersonalTransaction);

module.exports = router;
