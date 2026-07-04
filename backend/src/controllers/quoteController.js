const db = require('../config/db');

exports.getQuotes = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM quotations ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch quotes' });
  }
};

exports.getQuoteById = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM quotations WHERE id=?', [req.params.id]);
    if (rows.length > 0) {
      const [items] = await db.query('SELECT * FROM quotation_items WHERE quotation_id=?', [req.params.id]);
      rows[0].items = items;
    }
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch quote' });
  }
};

exports.createQuote = async (req, res) => {
  try {
    const { client_id, client_name, client_email, client_phone, client_address, quotation_date, due_date, subtotal, tax_percent, tax_amount, total_amount, notes, items } = req.body;
    const [result] = await db.query(
      'INSERT INTO quotations (client_id, client_name, client_email, client_phone, client_address, quotation_date, due_date, subtotal, tax_percent, tax_amount, total_amount, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [client_id || null, client_name, client_email, client_phone, client_address, quotation_date ? new Date(quotation_date) : null, due_date ? new Date(due_date) : null, subtotal, tax_percent, tax_amount, total_amount, notes]
    );
    
    if (items && items.length > 0) {
      const itemValues = items.map(i => [result.insertId, i.description, i.hsn_sac || null, i.quantity || 0, i.unit_price || 0, i.total !== undefined && i.total !== null ? i.total : ((i.quantity || 0) * (i.unit_price || 0))]);
      await db.query('INSERT INTO quotation_items (quotation_id, description, hsn_sac, quantity, unit_price, total) VALUES ?', [itemValues]);
    }
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create quote' });
  }
};

exports.updateQuote = async (req, res) => {
  try {
    const { client_id, client_name, client_email, client_phone, client_address, quotation_date, due_date, subtotal, tax_percent, tax_amount, total_amount, notes, items } = req.body;
    await db.query(
      'UPDATE quotations SET client_id=?, client_name=?, client_email=?, client_phone=?, client_address=?, quotation_date=?, due_date=?, subtotal=?, tax_percent=?, tax_amount=?, total_amount=?, notes=? WHERE id=?',
      [client_id || null, client_name, client_email, client_phone, client_address, quotation_date ? new Date(quotation_date) : null, due_date ? new Date(due_date) : null, subtotal, tax_percent, tax_amount, total_amount, notes, req.params.id]
    );
    
    await db.query('DELETE FROM quotation_items WHERE quotation_id=?', [req.params.id]);
    
    if (items && items.length > 0) {
      const itemValues = items.map(i => [req.params.id, i.description, i.hsn_sac || null, i.quantity || 0, i.unit_price || 0, i.total !== undefined && i.total !== null ? i.total : ((i.quantity || 0) * (i.unit_price || 0))]);
      await db.query('INSERT INTO quotation_items (quotation_id, description, hsn_sac, quantity, unit_price, total) VALUES ?', [itemValues]);
    }
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update quote' });
  }
};

exports.deleteQuote = async (req, res) => {
  try {
    await db.query('DELETE FROM quotation_items WHERE quotation_id=?', [req.params.id]);
    await db.query('DELETE FROM quotations WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete quote' });
  }
};
