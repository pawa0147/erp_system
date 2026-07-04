const db = require('../config/db');

exports.getTasks = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT t.*, u.username as assigned_to_name
      FROM tasks t
      LEFT JOIN users u ON t.assigned_to = u.id
      ORDER BY t.created_at DESC
    `);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch tasks' });
  }
};

exports.getTaskById = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT t.*, u.username as assigned_to_name
      FROM tasks t
      LEFT JOIN users u ON t.assigned_to = u.id
      WHERE t.id = ?
    `, [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch task' });
  }
};

exports.createTask = async (req, res) => {
  try {
    const { title, description, assigned_to, assigned_by, due_date, priority, status } = req.body;
    const [result] = await db.query(
      'INSERT INTO tasks (title, description, assigned_to, assigned_by, due_date, priority, status) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [title, description, assigned_to, assigned_by || null, due_date ? new Date(due_date) : null, priority || 'Medium', status || 'Pending']
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create task' });
  }
};

exports.updateTask = async (req, res) => {
  try {
    const { title, description, assigned_to, assigned_by, due_date, priority, status } = req.body;
    await db.query(
      'UPDATE tasks SET title=?, description=?, assigned_to=?, assigned_by=?, due_date=?, priority=?, status=? WHERE id=?',
      [title, description, assigned_to, assigned_by || null, due_date ? new Date(due_date) : null, priority || 'Medium', status || 'Pending', req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update task' });
  }
};

exports.deleteTask = async (req, res) => {
  try {
    await db.query('DELETE FROM tasks WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete task' });
  }
};
