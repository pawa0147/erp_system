const express = require('express');
const router = express.Router();
const recurringInvoiceController = require('../controllers/recurringInvoiceController');

router.get('/', recurringInvoiceController.getRecurringInvoices);
router.post('/', recurringInvoiceController.createRecurringInvoice);
router.put('/:id', recurringInvoiceController.updateRecurringInvoice);
router.delete('/:id', recurringInvoiceController.deleteRecurringInvoice);

module.exports = router;
