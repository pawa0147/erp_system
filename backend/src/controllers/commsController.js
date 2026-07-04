const db = require('../config/db');

exports.getMessages = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM messages ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch messages' });
  }
};

exports.createMessage = async (req, res) => {
  try {
    const { sender_id, receiver_id, message, type, context } = req.body;
    const [result] = await db.query(
      'INSERT INTO messages (sender_id, receiver_id, message, type, context, status, is_read) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [sender_id, receiver_id, message, type || 'text', context || 'private', 'sent', 0]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to send message' });
  }
};

exports.getNotifications = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM notifications ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch notifications' });
  }
};

exports.createNotification = async (req, res) => {
  try {
    const { user_id, type, message } = req.body;
    const [result] = await db.query(
      'INSERT INTO notifications (user_id, type, message, is_read) VALUES (?, ?, ?, ?)',
      [user_id, type, message, 0]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create notification' });
  }
};
