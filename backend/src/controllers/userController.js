const db = require('../config/db');

exports.getUsers = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT id, username, email, role, college_name, permissions, avatar_url, is_active, created_at FROM users ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch users' });
  }
};

exports.createUser = async (req, res) => {
  try {
    const { username, email, password, role, college_name, permissions, avatar_url, is_active } = req.body;
    // Note: Since auth is not requested, we're not hashing passwords here, just storing them raw for now
    const [result] = await db.query(
      'INSERT INTO users (username, email, password_hash, role, college_name, permissions, avatar_url, is_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [username, email, password || 'defaultpass', role || 'User', college_name, permissions, avatar_url, is_active !== undefined ? is_active : 1]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create user' });
  }
};

exports.updateUser = async (req, res) => {
  try {
    const { username, email, role, college_name, permissions, avatar_url, is_active } = req.body;
    await db.query(
      'UPDATE users SET username=?, email=?, role=?, college_name=?, permissions=?, avatar_url=?, is_active=? WHERE id=?',
      [username, email, role, college_name, permissions, avatar_url, is_active, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update user' });
  }
};

exports.deleteUser = async (req, res) => {
  try {
    await db.query('DELETE FROM users WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete user' });
  }
};
