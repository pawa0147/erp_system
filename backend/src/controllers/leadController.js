const db = require('../config/db');

exports.getLeads = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM sales_leads ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch leads' });
  }
};

exports.getLeadById = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM sales_leads WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch lead' });
  }
};

exports.createLead = async (req, res) => {
  try {
    const { company_name, founder_name, contact_number, email, business_type, category, gst_number, status, notes, assigned_to } = req.body;
    const [result] = await db.query(
      'INSERT INTO sales_leads (company_name, founder_name, contact_number, email, business_type, category, gst_number, status, notes, assigned_to) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [company_name, founder_name, contact_number, email, business_type, category, gst_number, status || 'New', notes, assigned_to || null]
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create lead' });
  }
};

exports.updateLead = async (req, res) => {
  try {
    const { company_name, founder_name, contact_number, email, business_type, category, gst_number, status, notes, assigned_to } = req.body;
    await db.query(
      'UPDATE sales_leads SET company_name=?, founder_name=?, contact_number=?, email=?, business_type=?, category=?, gst_number=?, status=?, notes=?, assigned_to=? WHERE id=?',
      [company_name, founder_name, contact_number, email, business_type, category, gst_number, status || 'New', notes, assigned_to || null, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update lead' });
  }
};

exports.deleteLead = async (req, res) => {
  try {
    await db.query('DELETE FROM sales_leads WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete lead' });
  }
};
