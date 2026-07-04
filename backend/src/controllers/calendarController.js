const db = require('../config/db');

exports.getCalendarEvents = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM calendar_events ORDER BY start_date ASC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch calendar events' });
  }
};

exports.createCalendarEvent = async (req, res) => {
  try {
    const { title, description, start_date, end_date, color } = req.body;
    const user_id = 1;
    const [result] = await db.query(
      'INSERT INTO calendar_events (user_id, title, description, start_date, end_date, color) VALUES (?, ?, ?, ?, ?, ?)',
      [user_id, title, description, new Date(start_date), end_date ? new Date(end_date) : null, color || 'bg-blue-500']
    );
    res.json({ id: result.insertId, message: 'Event created successfully' });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create calendar event' });
  }
};

exports.updateCalendarEvent = async (req, res) => {
  try {
    const { title, description, start_date, end_date, color } = req.body;
    await db.query(
      'UPDATE calendar_events SET title=?, description=?, start_date=?, end_date=?, color=? WHERE id=?',
      [title, description, new Date(start_date), end_date ? new Date(end_date) : null, color, req.params.id]
    );
    res.json({ success: true, message: 'Event updated successfully' });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update calendar event' });
  }
};

exports.deleteCalendarEvent = async (req, res) => {
  try {
    await db.query('DELETE FROM calendar_events WHERE id = ?', [req.params.id]);
    res.json({ success: true, message: 'Event deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete calendar event' });
  }
};
