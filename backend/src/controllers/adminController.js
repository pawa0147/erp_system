const db = require('../config/db');

// Audit Logs
exports.getAuditLogs = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT al.*, u.username FROM audit_logs al LEFT JOIN users u ON al.user_id = u.id ORDER BY al.created_at DESC LIMIT 200');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch audit logs' });
  }
};

// User Activity
exports.getUserActivity = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT ua.*, u.username, u.email FROM user_activity ua LEFT JOIN users u ON ua.user_id = u.id ORDER BY ua.last_activity DESC LIMIT 100');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch user activity' });
  }
};

// Monitoring Logs
exports.getMonitoringLogs = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT ml.*, u.username FROM monitoring_logs ml LEFT JOIN users u ON ml.user_id = u.id ORDER BY ml.timestamp DESC LIMIT 200');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch monitoring logs' });
  }
};

// System Settings
exports.getSettings = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM system_settings');
    const settings = {};
    rows.forEach(r => { settings[r.setting_key] = r.setting_value; });
    res.json(settings);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch settings' });
  }
};

exports.updateSetting = async (req, res) => {
  try {
    const { key, value } = req.body;
    await db.query('INSERT INTO system_settings (setting_key, setting_value) VALUES (?, ?) ON DUPLICATE KEY UPDATE setting_value=?', [key, value, value]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update setting' });
  }
};
