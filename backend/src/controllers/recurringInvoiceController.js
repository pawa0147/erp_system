const db = require('../config/db');

exports.getRecurringInvoices = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT r.*, c.name as client_name FROM recurring_invoices r LEFT JOIN clients c ON r.client_id = c.id ORDER BY r.created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch recurring invoices' });
  }
};

exports.createRecurringInvoice = async (req, res) => {
  try {
    const { client_id, frequency, next_due_date, amount, description, status } = req.body;
    const [result] = await db.query(
      'INSERT INTO recurring_invoices (client_id, frequency, next_due_date, amount, description, status) VALUES (?, ?, ?, ?, ?, ?)',
      [client_id, frequency, new Date(next_due_date), amount, description, status || 'active']
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create recurring invoice' });
  }
};

exports.updateRecurringInvoice = async (req, res) => {
  try {
    const { frequency, next_due_date, amount, description, status } = req.body;
    await db.query(
      'UPDATE recurring_invoices SET frequency=?, next_due_date=?, amount=?, description=?, status=? WHERE id=?',
      [frequency, new Date(next_due_date), amount, description, status, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update recurring invoice' });
  }
};

exports.deleteRecurringInvoice = async (req, res) => {
  try {
    await db.query('DELETE FROM recurring_invoices WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete recurring invoice' });
  }
};
