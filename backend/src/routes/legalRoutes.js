const express = require('express');
const router = express.Router();
const legalController = require('../controllers/legalController');

router.get('/', legalController.getLegalDocs);
router.post('/', legalController.createLegalDoc);
router.delete('/:id', legalController.deleteLegalDoc);

module.exports = router;
