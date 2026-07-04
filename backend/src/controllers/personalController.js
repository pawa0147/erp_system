const db = require('../config/db');

exports.getPersonalTransactions = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM personal_transactions ORDER BY transaction_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch personal transactions' });
  }
};

exports.createPersonalTransaction = async (req, res) => {
  try {
    const { user_id, type, category, amount, transaction_date, note } = req.body;
    const [result] = await db.query(
      'INSERT INTO personal_transactions (user_id, type, category, amount, transaction_date, note) VALUES (?, ?, ?, ?, ?, ?)',
      [user_id || 1, type, category, amount, new Date(transaction_date), note]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add personal transaction' });
  }
};

exports.deletePersonalTransaction = async (req, res) => {
  try {
    await db.query('DELETE FROM personal_transactions WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete personal transaction' });
  }
};
