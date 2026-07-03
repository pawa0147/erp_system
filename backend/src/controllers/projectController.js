const db = require('../config/db');

exports.getProjects = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT p.*, c.name as client_name,
        (SELECT COUNT(*) FROM project_tasks pt WHERE pt.project_id = p.id) as total_tasks,
        (SELECT COUNT(*) FROM project_tasks pt WHERE pt.project_id = p.id AND pt.status = 'Completed') as done_tasks
      FROM projects p
      LEFT JOIN clients c ON p.client_id = c.id
      ORDER BY p.created_at DESC
    `);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching projects:', error.message);
    res.status(500).json({ error: 'Failed to fetch projects' });
  }
};

exports.getProjectById = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT p.*, c.name as client_name
      FROM projects p
      LEFT JOIN clients c ON p.client_id = c.id
      WHERE p.id = ?
    `, [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch project' });
  }
};

exports.createProject = async (req, res) => {
  try {
    const { client_id, title, description, status, start_date, deadline, budget } = req.body;
    const [result] = await db.query(
      'INSERT INTO projects (client_id, title, description, status, start_date, deadline, budget) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [client_id, title, description, status || 'Not Started', start_date ? new Date(start_date) : null, deadline ? new Date(deadline) : null, budget || 0]
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create project' });
  }
};

exports.updateProject = async (req, res) => {
  try {
    const { client_id, title, description, status, start_date, deadline, budget } = req.body;
    await db.query(
      'UPDATE projects SET client_id=?, title=?, description=?, status=?, start_date=?, deadline=?, budget=? WHERE id=?',
      [client_id, title, description, status, start_date ? new Date(start_date) : null, deadline ? new Date(deadline) : null, budget, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update project' });
  }
};

exports.deleteProject = async (req, res) => {
  try {
    await db.query('DELETE FROM project_tasks WHERE project_id=?', [req.params.id]);
    await db.query('DELETE FROM projects WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete project' });
  }
};

// ─── Project Tasks ─────────────────────────────────────────
exports.getProjectTasks = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT pt.*, e.full_name as assigned_name FROM project_tasks pt LEFT JOIN employees e ON pt.assigned_to = e.id WHERE pt.project_id=? ORDER BY pt.created_at DESC', [req.params.id]);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch project tasks' });
  }
};

exports.createProjectTask = async (req, res) => {
  try {
    const { task_name, status, due_date, assigned_to } = req.body;
    const [result] = await db.query(
      'INSERT INTO project_tasks (project_id, task_name, status, due_date, assigned_to) VALUES (?, ?, ?, ?, ?)',
      [req.params.id, task_name, status || 'Pending', due_date ? new Date(due_date) : null, assigned_to || null]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create project task' });
  }
};

exports.deleteProjectTask = async (req, res) => {
  try {
    await db.query('DELETE FROM project_tasks WHERE id=?', [req.params.taskId]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete project task' });
  }
};
