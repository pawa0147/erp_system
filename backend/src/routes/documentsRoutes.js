const express = require('express');
const router = express.Router();
const documentsController = require('../controllers/documentsController');

router.get('/certificates', documentsController.getCertificates);
router.post('/certificates', documentsController.createCertificate);
router.delete('/certificates/:id', documentsController.deleteCertificate);

router.get('/mous', documentsController.getMous);
router.post('/mous', documentsController.createMou);
router.delete('/mous/:id', documentsController.deleteMou);

module.exports = router;
