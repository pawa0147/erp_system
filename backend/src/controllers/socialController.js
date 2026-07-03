const db = require('../config/db');

exports.getSocialAccounts = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM social_accounts ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch social accounts' });
  }
};

exports.createSocialAccount = async (req, res) => {
  try {
    const { platform_name, username, profile_url, client_id, assigned_manager, notes } = req.body;
    const [result] = await db.query(
      'INSERT INTO social_accounts (platform_name, username, profile_url, client_id, assigned_manager, notes) VALUES (?, ?, ?, ?, ?, ?)',
      [platform_name, username, profile_url, client_id || null, assigned_manager, notes]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add social account' });
  }
};

exports.updateSocialAccount = async (req, res) => {
  try {
    const { platform_name, username, profile_url, client_id, assigned_manager, notes } = req.body;
    await db.query(
      'UPDATE social_accounts SET platform_name=?, username=?, profile_url=?, client_id=?, assigned_manager=?, notes=? WHERE id=?',
      [platform_name, username, profile_url, client_id, assigned_manager, notes, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update social account' });
  }
};

exports.deleteSocialAccount = async (req, res) => {
  try {
    await db.query('DELETE FROM social_accounts WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete social account' });
  }
};

// ─── Social Posts ─────────────────────────────────────────
exports.getSocialPosts = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM social_posts ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch social posts' });
  }
};

exports.createSocialPost = async (req, res) => {
  try {
    const { content, media_url, platforms, scheduled_time, status } = req.body;
    const [result] = await db.query(
      'INSERT INTO social_posts (content, media_url, platforms, scheduled_time, status) VALUES (?, ?, ?, ?, ?)',
      [content, media_url, JSON.stringify(platforms), scheduled_time ? new Date(scheduled_time) : null, status || 'draft']
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create social post' });
  }
};

exports.deleteSocialPost = async (req, res) => {
  try {
    await db.query('DELETE FROM social_posts WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete social post' });
  }
};
