const db = require('../config/db');

exports.getFolders = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM rd_folders ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch folders' });
  }
};

exports.createFolder = async (req, res) => {
  try {
    const { name, department, is_locked } = req.body;
    const [result] = await db.query(
      'INSERT INTO rd_folders (name, department, is_locked) VALUES (?, ?, ?)',
      [name, department, is_locked || 0]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create folder' });
  }
};

exports.deleteFolder = async (req, res) => {
  try {
    await db.query('DELETE FROM rd_files WHERE folder_id=?', [req.params.id]);
    await db.query('DELETE FROM rd_folders WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete folder' });
  }
};

exports.getFiles = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM rd_files ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch files' });
  }
};

exports.createFile = async (req, res) => {
  try {
    const { folder_id, name, link_url, file_type } = req.body;
    const [result] = await db.query(
      'INSERT INTO rd_files (folder_id, name, link_url, file_type) VALUES (?, ?, ?, ?)',
      [folder_id || null, name, link_url, file_type]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create file' });
  }
};

exports.deleteFile = async (req, res) => {
  try {
    await db.query('DELETE FROM rd_files WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete file' });
  }
};
