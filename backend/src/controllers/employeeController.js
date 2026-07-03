const db = require('../config/db');

exports.getEmployees = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM employees ORDER BY created_at DESC');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch employees' });
  }
};

exports.getEmployeeById = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM employees WHERE id=?', [req.params.id]);
    res.json(rows[0] || null);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch employee' });
  }
};

exports.createEmployee = async (req, res) => {
  try {
    const { full_name, email, phone, designation, employment_type, college_name, joining_date, base_salary, address, bank_name, account_number, ifsc_code, pan_card, status, profile_image } = req.body;
    const [result] = await db.query(
      'INSERT INTO employees (full_name, email, phone, designation, employment_type, college_name, joining_date, base_salary, address, bank_name, account_number, ifsc_code, pan_card, status, profile_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [full_name, email, phone, designation, employment_type, college_name, joining_date ? new Date(joining_date) : null, base_salary || 0, address, bank_name, account_number, ifsc_code, pan_card, status || 'Active', profile_image]
    );
    res.json({ id: result.insertId, ...req.body });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create employee' });
  }
};

exports.updateEmployee = async (req, res) => {
  try {
    const { full_name, email, phone, designation, employment_type, college_name, joining_date, base_salary, address, bank_name, account_number, ifsc_code, pan_card, status, profile_image } = req.body;
    await db.query(
      'UPDATE employees SET full_name=?, email=?, phone=?, designation=?, employment_type=?, college_name=?, joining_date=?, base_salary=?, address=?, bank_name=?, account_number=?, ifsc_code=?, pan_card=?, status=?, profile_image=? WHERE id=?',
      [full_name, email, phone, designation, employment_type, college_name, joining_date ? new Date(joining_date) : null, base_salary || 0, address, bank_name, account_number, ifsc_code, pan_card, status || 'Active', profile_image, req.params.id]
    );
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to update employee' });
  }
};

exports.deleteEmployee = async (req, res) => {
  try {
    await db.query('DELETE FROM employees WHERE id=?', [req.params.id]);
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete employee' });
  }
};
