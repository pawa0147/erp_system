const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '.env') });
const db = require('./src/config/db');

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

// ─── Modular Routes ──────────────────────────────────────────────
const dashboardRoutes = require('./src/routes/dashboardRoutes');
const projectRoutes = require('./src/routes/projectRoutes');
const serviceRoutes = require('./src/routes/serviceRoutes');
const clientRoutes = require('./src/routes/clientRoutes');
const taskRoutes = require('./src/routes/taskRoutes');
const employeeRoutes = require('./src/routes/employeeRoutes');
const attendanceRoutes = require('./src/routes/attendanceRoutes');
const leadRoutes = require('./src/routes/leadRoutes');
const billRoutes = require('./src/routes/billRoutes');
const quoteRoutes = require('./src/routes/quoteRoutes');
const financeRoutes = require('./src/routes/financeRoutes');
const legalRoutes = require('./src/routes/legalRoutes');
const marketingRoutes = require('./src/routes/marketingRoutes');
const socialRoutes = require('./src/routes/socialRoutes');
const documentsRoutes = require('./src/routes/documentsRoutes');
const hrRoutes = require('./src/routes/hrRoutes');
const personalRoutes = require('./src/routes/personalRoutes');
const calendarRoutes = require('./src/routes/calendarRoutes');
const userRoutes = require('./src/routes/userRoutes');
const rdRoutes = require('./src/routes/rdRoutes');
const payrollRoutes = require('./src/routes/payrollRoutes');
const recurringInvoiceRoutes = require('./src/routes/recurringInvoiceRoutes');
const commsRoutes = require('./src/routes/commsRoutes');
const adminRoutes = require('./src/routes/adminRoutes');
const companyCalendarRoutes = require('./src/routes/companyCalendarRoutes');

app.use('/api/dashboard', dashboardRoutes);
app.use('/api/projects', projectRoutes);
app.use('/api/services', serviceRoutes);
app.use('/api/clients', clientRoutes);
app.use('/api/tasks', taskRoutes);
app.use('/api/employees', employeeRoutes);
app.use('/api/attendance', attendanceRoutes);
app.use('/api/leads', leadRoutes);
app.use('/api/bills', billRoutes);
app.use('/api/quotes', quoteRoutes);
app.use('/api/finance', financeRoutes);
app.use('/api/legal', legalRoutes);
app.use('/api/marketing', marketingRoutes);
app.use('/api/social', socialRoutes);
app.use('/api/documents', documentsRoutes);
app.use('/api/hr', hrRoutes);
app.use('/api/personal', personalRoutes);
app.use('/api/calendar', calendarRoutes);
app.use('/api/users', userRoutes);
app.use('/api/rd', rdRoutes);
app.use('/api/payroll', payrollRoutes);
app.use('/api/recurring-invoices', recurringInvoiceRoutes);
app.use('/api/comms', commsRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/company-calendar', companyCalendarRoutes);

// Optional: for backwards compatibility with endpoints that didn't have sub-routes in old index.js
app.use('/api/certificates', require('express').Router().use('/', (req, res) => res.redirect('/api/documents/certificates')));
app.use('/api/mous', require('express').Router().use('/', (req, res) => res.redirect('/api/documents/mous')));

// ─── Start Server ───────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`✅ Backend running at http://localhost:${PORT}`);
});
