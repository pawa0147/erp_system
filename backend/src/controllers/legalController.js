const db = require('../config/db');

exports.getLegalDocs = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM legal_documents ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch legal docs' });
  }
};

exports.createLegalDoc = async (req, res) => {
  try {
    const { title, doc_type, client_id, file_path, expiry_date, status } = req.body;
    const [result] = await db.query(
      'INSERT INTO legal_documents (title, doc_type, client_id, file_path, expiry_date, status) VALUES (?, ?, ?, ?, ?, ?)',
      [title, doc_type || null, client_id || null, file_path || null, expiry_date ? new Date(expiry_date) : null, status || 'Active']
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add legal doc' });
  }
};

exports.deleteLegalDoc = async (req, res) => {
  try {
    await db.query('DELETE FROM legal_documents WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete legal doc' });
  }
};
