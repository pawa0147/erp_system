const db = require('../config/db');

exports.getPayroll = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT p.*, e.full_name as employee_name FROM payroll p LEFT JOIN employees e ON p.employee_id = e.id ORDER BY p.created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch payroll' });
  }
};

exports.createPayroll = async (req, res) => {
  try {
    const { employee_id, month_year, base_salary, present_days, total_days, calculated_salary, bonus, deductions, net_salary, status, payment_date } = req.body;
    const [result] = await db.query(
      'INSERT INTO payroll (employee_id, month_year, base_salary, present_days, total_days, calculated_salary, bonus, deductions, net_salary, status, payment_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [employee_id, month_year, base_salary, present_days, total_days, calculated_salary, bonus, deductions, net_salary, status || 'Pending', payment_date ? new Date(payment_date) : null]
    );
    res.json({ id: result.insertId });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create payroll entry' });
  }
};

exports.updatePayroll = async (req, res) => {
  try {
    const { status, payment_date, bonus, deductions, net_salary, calculated_salary } = req.body;
    await db.query(
      'UPDATE payroll SET status=?, payment_date=?, bonus=?, deductions=?, net_salary=?, calculated_salary=? WHERE id=?',
      [status, payment_date ? new Date(payment_date) : null, bonus, deductions, net_salary, calculated_salary, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update payroll' });
  }
};

exports.deletePayroll = async (req, res) => {
  try {
    await db.query('DELETE FROM payroll WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete payroll entry' });
  }
};
