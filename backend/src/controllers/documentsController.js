const db = require('../config/db');

exports.getCertificates = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM certificates ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch certificates' });
  }
};

exports.createCertificate = async (req, res) => {
  try {
    const { title, issue_date, expiry_date, issued_to, file_url } = req.body;
    const [result] = await db.query(
      'INSERT INTO certificates (title, issue_date, expiry_date, issued_to, file_url) VALUES (?, ?, ?, ?, ?)',
      [title, issue_date ? new Date(issue_date) : null, expiry_date ? new Date(expiry_date) : null, issued_to, file_url]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create certificate' });
  }
};

exports.deleteCertificate = async (req, res) => {
  try {
    await db.query('DELETE FROM certificates WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete certificate' });
  }
};

exports.getMous = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM mous ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch mous' });
  }
};

exports.createMou = async (req, res) => {
  try {
    const { party_a, party_b, effective_date, expiry_date, status, signatory_email, terms } = req.body;
    const [result] = await db.query(
      'INSERT INTO mous (party_a, party_b, effective_date, expiry_date, status, signatory_email, terms) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [party_a, party_b, effective_date ? new Date(effective_date) : null, expiry_date ? new Date(expiry_date) : null, status || 'draft', signatory_email, terms]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create mou' });
  }
};

exports.deleteMou = async (req, res) => {
  try {
    await db.query('DELETE FROM mous WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete mou' });
  }
};
