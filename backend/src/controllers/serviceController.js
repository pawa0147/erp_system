const db = require('../config/db');

exports.getServices = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM services ORDER BY title ASC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch services' });
  }
};

exports.getServiceById = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM services WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch service' });
  }
};

exports.createService = async (req, res) => {
  try {
    const { title, description, price } = req.body;
    const [result] = await db.query(
      'INSERT INTO services (title, description, price) VALUES (?, ?, ?)',
      [title, description, price || 0]
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create service' });
  }
};

exports.updateService = async (req, res) => {
  try {
    const { title, description, price } = req.body;
    await db.query(
      'UPDATE services SET title=?, description=?, price=? WHERE id=?',
      [title, description, price || 0, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update service' });
  }
};

exports.deleteService = async (req, res) => {
  try {
    await db.query('DELETE FROM services WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete service' });
  }
};
