const db = require('../config/db');

exports.getStats = async (req, res) => {
  try {
    const [clients] = await db.query('SELECT COUNT(*) as total FROM clients');
    const [projects] = await db.query("SELECT COUNT(*) as total FROM projects WHERE status IN ('Not Started','In Progress','On Hold')");
    const [revenue] = await db.query('SELECT COALESCE(SUM(amount_received), 0) as total FROM clients');
    const [pendingTasks] = await db.query("SELECT COUNT(*) as total FROM tasks WHERE status IN ('Pending','In Progress')");

    res.json({
      total_clients: clients[0].total,
      active_projects: projects[0].total,
      monthly_revenue: revenue[0].total,
      pending_tasks: pendingTasks[0].total,
    });
  } catch (error) {
    console.error('Error fetching dashboard stats:', error.message);
    res.status(500).json({ error: 'Failed to fetch dashboard stats' });
  }
};
