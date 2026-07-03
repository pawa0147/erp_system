const express = require('express');
const router = express.Router();
const projectController = require('../controllers/projectController');

router.get('/', projectController.getProjects);
router.get('/:id', projectController.getProjectById);
router.post('/', projectController.createProject);
router.put('/:id', projectController.updateProject);
router.delete('/:id', projectController.deleteProject);

// Project Tasks
router.get('/:id/tasks', projectController.getProjectTasks);
router.post('/:id/tasks', projectController.createProjectTask);
router.delete('/:id/tasks/:taskId', projectController.deleteProjectTask);

module.exports = router;
