const db = require('../config/db');

exports.getAttendance = async (req, res) => {
  try {
    const date = req.query.date || new Date().toISOString().split('T')[0];
    const [rows] = await db.query('SELECT * FROM attendance WHERE date = ?', [date]);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch attendance' });
  }
};

exports.createAttendance = async (req, res) => {
  try {
    const { employee_id, date, status, punch_in, punch_out, notes } = req.body;
    const [result] = await db.query(
      'INSERT INTO attendance (employee_id, date, status, punch_in, punch_out, notes) VALUES (?, ?, ?, ?, ?, ?)',
      [employee_id, date ? new Date(date) : null, status || 'Present', punch_in || null, punch_out || null, notes]
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create attendance' });
  }
};

exports.updateAttendance = async (req, res) => {
  try {
    const { employee_id, date, status, punch_in, punch_out, notes } = req.body;
    await db.query(
      'UPDATE attendance SET employee_id=?, date=?, status=?, punch_in=?, punch_out=?, notes=? WHERE id=?',
      [employee_id, date ? new Date(date) : null, status, punch_in, punch_out, notes, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update attendance' });
  }
};
