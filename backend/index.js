const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '.env') });
const db = require('./db');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors({
  origin: ['http://localhost:3000', 'http://127.0.0.1:3000', 'http://localhost:5173', 'http://127.0.0.1:5173', 'http://localhost:5174', 'http://127.0.0.1:5174'],
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

// ─── Services ───────────────────────────────────────────────────
app.get('/api/services', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM services ORDER BY title ASC');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching services:', error.message);
    res.status(500).json({ error: 'Failed to fetch services' });
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

// ─── Clients POST/PUT/DELETE ─────────────────────────────────────
app.post('/api/clients', async (req, res) => {
  try {
    const { name, company_name, email, phone, address, referral_source, total_project_amount, amount_received, payment_status } = req.body;
    const [result] = await db.query(
      'INSERT INTO clients (name, company_name, email, phone, address, referral_source, total_project_amount, amount_received, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [name, company_name, email, phone, address, referral_source, total_project_amount || 0, amount_received || 0, payment_status || 'Pending'].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    console.error('Error creating client:', error.message);
    res.status(500).json({ error: 'Failed to create client' });
  }
});

app.put('/api/clients/:id', async (req, res) => {
  try {
    const { name, company_name, email, phone, address, referral_source, total_project_amount, amount_received, payment_status } = req.body;
    await db.query(
      'UPDATE clients SET name=?, company_name=?, email=?, phone=?, address=?, referral_source=?, total_project_amount=?, amount_received=?, payment_status=? WHERE id=?',
      [name, company_name, email, phone, address, referral_source, total_project_amount || 0, amount_received || 0, payment_status || 'Pending', req.params.id].map(v => v === undefined ? null : v)
    );
    res.json({ success: true });
  } catch (error) {
    console.error('Error updating client:', error.message);
    res.status(500).json({ error: 'Failed to update client' });
  }
});

app.delete('/api/clients/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM clients WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    console.error('Error deleting client:', error.message);
    res.status(500).json({ error: 'Failed to delete client' });
  }
});

// ─── Employees POST/PUT/DELETE ────────────────────────────────────
app.post('/api/employees', async (req, res) => {
  try {
    const { full_name, email, phone, designation, employment_type, college_name, joining_date, base_salary, address, bank_name, account_number, ifsc_code, pan_card, status, profile_image } = req.body;
    const [result] = await db.query(
      'INSERT INTO employees (full_name, email, phone, designation, employment_type, college_name, joining_date, base_salary, address, bank_name, account_number, ifsc_code, pan_card, status, profile_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [full_name, email, phone, designation, employment_type, college_name, joining_date ? new Date(joining_date) : null, base_salary || 0, address, bank_name, account_number, ifsc_code, pan_card, status || 'Active', profile_image].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    console.error('Error creating employee:', error.message);
    res.status(500).json({ error: 'Failed to create employee' });
  }
});

app.put('/api/employees/:id', async (req, res) => {
  try {
    const { full_name, email, phone, designation, employment_type, college_name, joining_date, base_salary, address, bank_name, account_number, ifsc_code, pan_card, status, profile_image } = req.body;
    await db.query(
      'UPDATE employees SET full_name=?, email=?, phone=?, designation=?, employment_type=?, college_name=?, joining_date=?, base_salary=?, address=?, bank_name=?, account_number=?, ifsc_code=?, pan_card=?, status=?, profile_image=? WHERE id=?',
      [full_name, email, phone, designation, employment_type, college_name, joining_date ? new Date(joining_date) : null, base_salary || 0, address, bank_name, account_number, ifsc_code, pan_card, status || 'Active', profile_image, req.params.id].map(v => v === undefined ? null : v)
    );
    res.json({ success: true });
  } catch (error) {
    console.error('Error updating employee:', error.message);
    res.status(500).json({ error: 'Failed to update employee' });
  }
});

app.delete('/api/employees/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM employees WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    console.error('Error deleting employee:', error.message);
    res.status(500).json({ error: 'Failed to delete employee' });
  }
});

app.get('/api/employees/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM employees WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    console.error('Error fetching employee:', error.message);
    res.status(500).json({ error: 'Failed to fetch employee' });
  }
});

app.get('/api/clients/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM clients WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    console.error('Error fetching client:', error.message);
    res.status(500).json({ error: 'Failed to fetch client' });
  }
});


// ─── Sales / Leads ────────────────────────────────────────────────
app.get('/api/leads', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM sales_leads ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching leads:', error.message);
    res.status(500).json({ error: 'Failed to fetch leads' });
  }
});

app.get('/api/leads/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM sales_leads WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    console.error('Error fetching lead:', error.message);
    res.status(500).json({ error: 'Failed to fetch lead' });
  }
});

app.post('/api/leads', async (req, res) => {
  try {
    const { company_name, founder_name, contact_number, email, business_type, category, gst_number, status, notes, assigned_to } = req.body;
    const [result] = await db.query(
      'INSERT INTO sales_leads (company_name, founder_name, contact_number, email, business_type, category, gst_number, status, notes, assigned_to) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [company_name, founder_name, contact_number, email, business_type, category, gst_number, status || 'New', notes, assigned_to || null].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    console.error('Error creating lead:', error.message);
    res.status(500).json({ error: 'Failed to create lead' });
  }
});

app.put('/api/leads/:id', async (req, res) => {
  try {
    const { company_name, founder_name, contact_number, email, business_type, category, gst_number, status, notes, assigned_to } = req.body;
    await db.query(
      'UPDATE sales_leads SET company_name=?, founder_name=?, contact_number=?, email=?, business_type=?, category=?, gst_number=?, status=?, notes=?, assigned_to=? WHERE id=?',
      [company_name, founder_name, contact_number, email, business_type, category, gst_number, status || 'New', notes, assigned_to || null, req.params.id].map(v => v === undefined ? null : v)
    );
    res.json({ success: true });
  } catch (error) {
    console.error('Error updating lead:', error.message);
    res.status(500).json({ error: 'Failed to update lead' });
  }
});

app.delete('/api/leads/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM sales_leads WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    console.error('Error deleting lead:', error.message);
    res.status(500).json({ error: 'Failed to delete lead' });
  }
});

// ─── Bills ────────────────────────────────────────────────────────
app.get('/api/bills', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM bills ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching bills:', error.message);
    res.status(500).json({ error: 'Failed to fetch bills' });
  }
});

app.get('/api/bills/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM bills WHERE id=?', [req.params.id]);
    if (rows.length > 0) {
      const [items] = await db.query('SELECT * FROM bill_items WHERE bill_id=?', [req.params.id]);
      rows[0].items = items;
    }
    res.json(rows[0] || null);
  } catch (error) {
    console.error('Error fetching bill:', error.message);
    res.status(500).json({ error: 'Failed to fetch bill' });
  }
});

app.post('/api/bills', async (req, res) => {
  try {
    const { client_id, client_name, client_email, client_phone, client_address, bill_date, due_date, subtotal, tax_percent, tax_amount, total_amount, status, notes, items } = req.body;
    const [result] = await db.query(
      'INSERT INTO bills (client_id, client_name, client_email, client_phone, client_address, bill_date, due_date, subtotal, tax_percent, tax_amount, total_amount, status, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [client_id || null, client_name, client_email, client_phone, client_address, bill_date ? new Date(bill_date) : null, due_date ? new Date(due_date) : null, subtotal, tax_percent, tax_amount, total_amount, status || 'Unpaid', notes].map(v => v === undefined ? null : v)
    );
    
    if (items && items.length > 0) {
      const itemValues = items.map(i => [result.insertId, i.description, i.hsn_sac || null, i.quantity, i.unit_price, i.total]);
      await db.query('INSERT INTO bill_items (bill_id, description, hsn_sac, quantity, unit_price, total) VALUES ?', [itemValues]);
    }
    res.json({ id: result.insertId });
  } catch (error) {
    console.error('Error creating bill:', error.message);
    res.status(500).json({ error: 'Failed to create bill' });
  }
});

app.delete('/api/bills/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM bill_items WHERE bill_id=?', [req.params.id]);
    await db.query('DELETE FROM bills WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    console.error('Error deleting bill:', error.message);
    res.status(500).json({ error: 'Failed to delete bill' });
  }
});

// ─── Quotations ───────────────────────────────────────────────────
app.get('/api/quotes', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM quotations ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching quotes:', error.message);
    res.status(500).json({ error: 'Failed to fetch quotes' });
  }
});

app.get('/api/quotes/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM quotations WHERE id=?', [req.params.id]);
    if (rows.length > 0) {
      const [items] = await db.query('SELECT * FROM quotation_items WHERE quotation_id=?', [req.params.id]);
      rows[0].items = items;
    }
    res.json(rows[0] || null);
  } catch (error) {
    console.error('Error fetching quote:', error.message);
    res.status(500).json({ error: 'Failed to fetch quote' });
  }
});

app.post('/api/quotes', async (req, res) => {
  try {
    const { client_id, client_name, client_email, client_phone, client_address, quotation_date, due_date, subtotal, tax_percent, tax_amount, total_amount, notes, items } = req.body;
    const [result] = await db.query(
      'INSERT INTO quotations (client_id, client_name, client_email, client_phone, client_address, quotation_date, due_date, subtotal, tax_percent, tax_amount, total_amount, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [client_id || null, client_name, client_email, client_phone, client_address, quotation_date ? new Date(quotation_date) : null, due_date ? new Date(due_date) : null, subtotal, tax_percent, tax_amount, total_amount, notes].map(v => v === undefined ? null : v)
    );
    
    if (items && items.length > 0) {
      const itemValues = items.map(i => [result.insertId, i.description, i.hsn_sac || null, i.quantity, i.unit_price, i.total]);
      await db.query('INSERT INTO quotation_items (quotation_id, description, hsn_sac, quantity, unit_price, total) VALUES ?', [itemValues]);
    }
    res.json({ id: result.insertId });
  } catch (error) {
    console.error('Error creating quote:', error.message);
    res.status(500).json({ error: 'Failed to create quote' });
  }
});

app.delete('/api/quotes/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM quotation_items WHERE quotation_id=?', [req.params.id]);
    await db.query('DELETE FROM quotations WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    console.error('Error deleting quote:', error.message);
    res.status(500).json({ error: 'Failed to delete quote' });
  }
});

// ─── Finance Transactions ─────────────────────────────────────────
app.get('/api/finance', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM finance_transactions ORDER BY transaction_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch finance transactions' });
  }
});
app.post('/api/finance', async (req, res) => {
  try {
    const { type, category, amount, transaction_date, description, client_id } = req.body;
    const [result] = await db.query(
      'INSERT INTO finance_transactions (type, category, amount, transaction_date, description, client_id) VALUES (?, ?, ?, ?, ?, ?)',
      [type, category, amount, new Date(transaction_date), description, client_id || null].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add finance transaction' });
  }
});
app.delete('/api/finance/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM finance_transactions WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete finance transaction' });
  }
});

// ─── Legal Documents ──────────────────────────────────────────────
app.get('/api/legal', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM legal_documents ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch legal docs' });
  }
});
app.post('/api/legal', async (req, res) => {
  try {
    const { name, category, confidentiality, file_url, uploaded_by } = req.body;
    const [result] = await db.query(
      'INSERT INTO legal_documents (name, category, confidentiality, file_url, uploaded_by) VALUES (?, ?, ?, ?, ?)',
      [name, category, confidentiality || 'Standard', file_url, uploaded_by || null].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add legal doc' });
  }
});
app.delete('/api/legal/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM legal_documents WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete legal doc' });
  }
});

// ─── Marketing Campaigns ──────────────────────────────────────────
app.get('/api/marketing/campaigns', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM marketing_campaigns ORDER BY start_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch campaigns' });
  }
});
app.post('/api/marketing/campaigns', async (req, res) => {
  try {
    const { name, platform, objective, budget, start_date, end_date, notes, status } = req.body;
    const [result] = await db.query(
      'INSERT INTO marketing_campaigns (name, platform, objective, budget, start_date, end_date, notes, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [name, platform, objective, budget || 0, new Date(start_date), end_date ? new Date(end_date) : null, notes, status || 'draft'].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create campaign' });
  }
});
app.delete('/api/marketing/campaigns/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM marketing_campaigns WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete campaign' });
  }
});

// ─── Social Accounts ──────────────────────────────────────────────
app.get('/api/social', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM social_accounts ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch social accounts' });
  }
});

// ─── Certificates & MoUs ──────────────────────────────────────────
app.get('/api/certificates', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM certificates ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch certificates' });
  }
});
app.get('/api/mous', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM mous ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch mous' });
  }
});

// ─── HR Leaves & Feedbacks ────────────────────────────────────────
app.get('/api/hr/leaves', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT l.*, e.full_name as employee_name FROM hr_leaves l LEFT JOIN employees e ON l.employee_id = e.id ORDER BY l.created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch leaves' });
  }
});
app.get('/api/hr/feedbacks', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM hr_feedbacks ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch feedbacks' });
  }
});

// ─── Personal Transactions ────────────────────────────────────────
app.get('/api/personal', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM personal_transactions ORDER BY transaction_date DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch personal transactions' });
  }
});
app.post('/api/personal', async (req, res) => {
  try {
    const { user_id, type, category, amount, transaction_date, note } = req.body;
    const [result] = await db.query(
      'INSERT INTO personal_transactions (user_id, type, category, amount, transaction_date, note) VALUES (?, ?, ?, ?, ?, ?)',
      [user_id || 1, type, category, amount, new Date(transaction_date), note].map(v => v === undefined ? null : v)
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to add personal transaction' });
  }
});
app.delete('/api/personal/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM personal_transactions WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete personal transaction' });
  }
});

// ─── Notifications ──────────────────────────────────────────────
app.get('/api/notifications', async (req, res) => {
  try {
    const user_id = req.query.user_id || 1; // Default to admin user for now
    const [rows] = await db.query('SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 20', [user_id]);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching notifications:', error.message);
    res.status(500).json({ error: 'Failed to fetch notifications' });
  }
});

app.put('/api/notifications/mark-read', async (req, res) => {
  try {
    const user_id = req.body.user_id || 1;
    await db.query('UPDATE notifications SET is_read = 1 WHERE user_id = ? AND is_read = 0', [user_id]);
    res.json({ success: true });
  } catch (error) {
    console.error('Error marking notifications as read:', error.message);
    res.status(500).json({ error: 'Failed to mark notifications as read' });
  }
});

// ─── Start Server ───────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`✅ Backend running at http://localhost:${PORT}`);
});
