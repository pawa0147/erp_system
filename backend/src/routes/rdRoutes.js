const express = require('express');
const router = express.Router();
const rdController = require('../controllers/rdController');

router.get('/folders', rdController.getFolders);
router.post('/folders', rdController.createFolder);
router.delete('/folders/:id', rdController.deleteFolder);

router.get('/files', rdController.getFiles);
router.post('/files', rdController.createFile);
router.delete('/files/:id', rdController.deleteFile);

module.exports = router;
