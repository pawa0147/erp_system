const express = require('express');
const router = express.Router();
const socialController = require('../controllers/socialController');

router.get('/', socialController.getSocialAccounts);
router.post('/', socialController.createSocialAccount);
router.put('/:id', socialController.updateSocialAccount);
router.delete('/:id', socialController.deleteSocialAccount);

// Social Posts
router.get('/posts', socialController.getSocialPosts);
router.post('/posts', socialController.createSocialPost);
router.delete('/posts/:id', socialController.deleteSocialPost);

module.exports = router;
