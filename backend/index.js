const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '.env') });
const db = require('./db');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors({
  origin: ['http://localhost:3000', 'http://127.0.0.1:3000'],
  credentials: true
}));
app.use(express.json());

// ─── Health Check ───────────────────────────────────────────────
app.get('/api/health', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT 1 + 1 AS result');
    res.json({ status: 'ok', db: 'connected', test: rows[0].result });
  } catch (error) {
    console.error('DB connection error:', error.message);
    res.status(500).json({ status: 'error', message: error.message });
  }
});

// ─── Dashboard Stats ────────────────────────────────────────────
app.get('/api/dashboard/stats', async (req, res) => {
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
});

// ─── Projects ───────────────────────────────────────────────────
app.get('/api/projects', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT p.*, c.name as client_name,
        (SELECT COUNT(*) FROM project_tasks pt WHERE pt.project_id = p.id) as total_tasks,
        (SELECT COUNT(*) FROM project_tasks pt WHERE pt.project_id = p.id AND pt.status = 'Completed') as done_tasks
      FROM projects p
      LEFT JOIN clients c ON p.client_id = c.id
      ORDER BY p.created_at DESC
    `);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching projects:', error.message);
    res.status(500).json({ error: 'Failed to fetch projects' });
  }
});

// ─── Clients ────────────────────────────────────────────────────
app.get('/api/clients', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM clients ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching clients:', error.message);
    res.status(500).json({ error: 'Failed to fetch clients' });
  }
});

// ─── Tasks ──────────────────────────────────────────────────────
app.get('/api/tasks', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT t.*, u.username as assigned_to_name
      FROM tasks t
      LEFT JOIN users u ON t.assigned_to = u.id
      ORDER BY t.created_at DESC
    `);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching tasks:', error.message);
    res.status(500).json({ error: 'Failed to fetch tasks' });
  }
});

// ─── Employees ────────────────────────────────────────────────────
app.get('/api/employees', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM employees ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching employees:', error.message);
    res.status(500).json({ error: 'Failed to fetch employees' });
  }
});

// ─── Attendance ─────────────────────────────────────────────────
app.get('/api/attendance', async (req, res) => {
  try {
    // Note: If you want attendance for a specific date, you can use req.query.date
    const date = req.query.date || new Date().toISOString().split('T')[0];
    const [rows] = await db.query('SELECT * FROM attendance WHERE date = ?', [date]);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching attendance:', error.message);
    res.status(500).json({ error: 'Failed to fetch attendance' });
  }
});

// ─── Start Server ───────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`✅ Backend running at http://localhost:${PORT}`);
});
