const db = require('../config/db');

exports.getEvents = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM company_calendar ORDER BY event_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch company calendar events' });
  }
};

exports.createEvent = async (req, res) => {
  try {
    const { event_name, event_date, type, description } = req.body;
    const [result] = await db.query(
      'INSERT INTO company_calendar (event_name, event_date, type, description) VALUES (?, ?, ?, ?)',
      [event_name, event_date ? new Date(event_date) : null, type || 'Other', description]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create event' });
  }
};

exports.deleteEvent = async (req, res) => {
  try {
    await db.query('DELETE FROM company_calendar WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete event' });
  }
};
