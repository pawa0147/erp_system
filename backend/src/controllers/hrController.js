const db = require('../config/db');

exports.getLeaves = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT l.*, e.full_name as employee_name FROM hr_leaves l LEFT JOIN employees e ON l.employee_id = e.id ORDER BY l.created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch leaves' });
  }
};

exports.createLeave = async (req, res) => {
  try {
    const { employee_id, leave_type, start_date, end_date, reason, status } = req.body;
    const [result] = await db.query(
      'INSERT INTO hr_leaves (employee_id, leave_type, start_date, end_date, reason, status) VALUES (?, ?, ?, ?, ?, ?)',
      [employee_id, leave_type, start_date ? new Date(start_date) : null, end_date ? new Date(end_date) : null, reason, status || 'Pending']
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create leave' });
  }
};

exports.updateLeave = async (req, res) => {
  try {
    const { status } = req.body;
    await db.query('UPDATE hr_leaves SET status=? WHERE id=?', [status, req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update leave' });
  }
};

exports.deleteLeave = async (req, res) => {
  try {
    await db.query('DELETE FROM hr_leaves WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete leave' });
  }
};

exports.getFeedbacks = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM hr_feedbacks ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    console.error('Feedbacks error:', error.message);
    res.status(500).json({ error: 'Failed to fetch feedbacks' });
  }
};

exports.createFeedback = async (req, res) => {
  try {
    const { from_user, to_user, rating, comment, type } = req.body;
    const [result] = await db.query(
      'INSERT INTO hr_feedbacks (from_user, to_user, rating, comment, type) VALUES (?, ?, ?, ?, ?)',
      [from_user, to_user, rating || 5, comment, type || 'Peer Review']
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create feedback' });
  }
};

exports.deleteFeedback = async (req, res) => {
  try {
    await db.query('DELETE FROM hr_feedbacks WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete feedback' });
  }
};

// ─── Leave Balances ─────────────────────────────────────────
exports.getLeaveBalances = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT lb.*, e.full_name as employee_name FROM leave_balances lb LEFT JOIN employees e ON lb.employee_id = e.id ORDER BY e.full_name');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch leave balances' });
  }
};
