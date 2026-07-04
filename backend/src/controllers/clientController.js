const db = require('../config/db');

exports.getClients = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM clients ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch clients' });
  }
};

exports.getClientById = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM clients WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch client' });
  }
};

exports.createClient = async (req, res) => {
  try {
    const { name, company_name, email, phone, address, referral_source, total_project_amount, amount_received, payment_status } = req.body;
    const [result] = await db.query(
      'INSERT INTO clients (name, company_name, email, phone, address, referral_source, total_project_amount, amount_received, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [name, company_name, email, phone, address, referral_source, total_project_amount || 0, amount_received || 0, payment_status || 'Pending']
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create client' });
  }
};

exports.updateClient = async (req, res) => {
  try {
    const { name, company_name, email, phone, address, referral_source, total_project_amount, amount_received, payment_status } = req.body;
    await db.query(
      'UPDATE clients SET name=?, company_name=?, email=?, phone=?, address=?, referral_source=?, total_project_amount=?, amount_received=?, payment_status=? WHERE id=?',
      [name, company_name, email, phone, address, referral_source, total_project_amount || 0, amount_received || 0, payment_status || 'Pending', req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update client' });
  }
};

exports.deleteClient = async (req, res) => {
  try {
    await db.query('DELETE FROM clients WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete client' });
  }
};
