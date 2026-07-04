const db = require('../config/db');

exports.getBills = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM bills ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch bills' });
  }
};

exports.getBillById = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM bills WHERE id=?', [req.params.id]);
    if (rows.length > 0) {
      const [items] = await db.query('SELECT * FROM bill_items WHERE bill_id=?', [req.params.id]);
      rows[0].items = items;
    }
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch bill' });
  }
};

exports.createBill = async (req, res) => {
  try {
    const { client_id, client_name, client_email, client_phone, client_address, bill_date, due_date, subtotal, tax_percent, tax_amount, total_amount, status, notes, items } = req.body;
    const [result] = await db.query(
      'INSERT INTO bills (client_id, client_name, client_email, client_phone, client_address, bill_date, due_date, subtotal, tax_percent, tax_amount, total_amount, status, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [client_id || null, client_name, client_email, client_phone, client_address, bill_date ? new Date(bill_date) : null, due_date ? new Date(due_date) : null, subtotal, tax_percent, tax_amount, total_amount, status || 'Unpaid', notes]
    );
    
    if (items && items.length > 0) {
      const itemValues = items.map(i => [result.insertId, i.description, i.hsn_sac || null, i.quantity || 0, i.unit_price || 0, i.total !== undefined && i.total !== null ? i.total : ((i.quantity || 0) * (i.unit_price || 0))]);
      await db.query('INSERT INTO bill_items (bill_id, description, hsn_sac, quantity, unit_price, total) VALUES ?', [itemValues]);
    }
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create bill: ' + error.message });
  }
};

exports.updateBill = async (req, res) => {
  try {
    const { client_id, client_name, client_email, client_phone, client_address, bill_date, due_date, subtotal, tax_percent, tax_amount, total_amount, status, notes, items } = req.body;
    await db.query(
      'UPDATE bills SET client_id=?, client_name=?, client_email=?, client_phone=?, client_address=?, bill_date=?, due_date=?, subtotal=?, tax_percent=?, tax_amount=?, total_amount=?, status=?, notes=? WHERE id=?',
      [client_id || null, client_name, client_email, client_phone, client_address, bill_date ? new Date(bill_date) : null, due_date ? new Date(due_date) : null, subtotal, tax_percent, tax_amount, total_amount, status || 'Unpaid', notes, req.params.id]
    );
    
    await db.query('DELETE FROM bill_items WHERE bill_id=?', [req.params.id]);
    
    if (items && items.length > 0) {
      const itemValues = items.map(i => [req.params.id, i.description, i.hsn_sac || null, i.quantity || 0, i.unit_price || 0, i.total !== undefined && i.total !== null ? i.total : ((i.quantity || 0) * (i.unit_price || 0))]);
      await db.query('INSERT INTO bill_items (bill_id, description, hsn_sac, quantity, unit_price, total) VALUES ?', [itemValues]);
    }
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update bill: ' + error.message });
  }
};

exports.deleteBill = async (req, res) => {
  try {
    await db.query('DELETE FROM bill_items WHERE bill_id=?', [req.params.id]);
    await db.query('DELETE FROM bills WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete bill' });
  }
};
