const db = require('../config/db');

exports.getCampaigns = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM marketing_campaigns ORDER BY start_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch campaigns' });
  }
};

exports.createCampaign = async (req, res) => {
  try {
    const { campaign_name, platform, status, start_date, end_date, budget } = req.body;
    const [result] = await db.query(
      'INSERT INTO marketing_campaigns (campaign_name, platform, status, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?, ?)',
      [campaign_name, platform, status || 'scheduled', start_date ? new Date(start_date) : null, end_date ? new Date(end_date) : null, budget || 0]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create campaign' });
  }
};

exports.updateCampaign = async (req, res) => {
  try {
    const { campaign_name, platform, status, start_date, end_date, budget, spend, clicks, impressions, conversions } = req.body;
    await db.query(
      'UPDATE marketing_campaigns SET campaign_name=?, platform=?, status=?, start_date=?, end_date=?, budget=?, spend=?, clicks=?, impressions=?, conversions=? WHERE id=?',
      [campaign_name, platform, status, start_date ? new Date(start_date) : null, end_date ? new Date(end_date) : null, budget, spend, clicks, impressions, conversions, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update campaign' });
  }
};

exports.deleteCampaign = async (req, res) => {
  try {
    await db.query('DELETE FROM marketing_campaigns WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete campaign' });
  }
};

// ─── Marketing Calendar ─────────────────────────────────────
exports.getCalendar = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM marketing_calendar ORDER BY event_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch marketing calendar' });
  }
};

exports.createCalendarEvent = async (req, res) => {
  try {
    const { title, event_date, type, description } = req.body;
    const [result] = await db.query(
      'INSERT INTO marketing_calendar (title, event_date, type, description) VALUES (?, ?, ?, ?)',
      [title, event_date ? new Date(event_date) : null, type, description]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create calendar event' });
  }
};
