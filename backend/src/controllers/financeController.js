const db = require('../config/db');

exports.getFinance = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM finance_transactions ORDER BY transaction_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch finance transactions' });
  }
};

exports.createFinance = async (req, res) => {
  try {
    const { type, category, amount, transaction_date, description, client_id } = req.body;
    const [result] = await db.query(
      'INSERT INTO finance_transactions (type, category, amount, transaction_date, description, client_id) VALUES (?, ?, ?, ?, ?, ?)',
      [type, category, amount, new Date(transaction_date), description, client_id || null]
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add finance transaction' });
  }
};

exports.deleteFinance = async (req, res) => {
  try {
    await db.query('DELETE FROM finance_transactions WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete finance transaction' });
  }
};
