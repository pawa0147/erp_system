import { useState } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";

const sampleEmployees = [
  { id: 1, full_name: "Amit Sharma", designation: "Senior Developer", base_salary: 85000, present_days: 22, total_days: 30, paid: true, payment_date: "2025-06-01", net_salary: 88000, bonus: 5000, deductions: 2000 },
  { id: 2, full_name: "Priya Patel", designation: "UX Designer", base_salary: 45000, present_days: 18, total_days: 30, paid: false, payment_date: null, net_salary: 0, bonus: 0, deductions: 0 },
  { id: 3, full_name: "Rahul Singh", designation: "Marketing Lead", base_salary: 55000, present_days: 28, total_days: 30, paid: false, payment_date: null, net_salary: 0, bonus: 0, deductions: 0 },
];

export default function PayrollPage() {
  const now = new Date();
  const [month, setMonth] = useState(`${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}`);
  const [modalEmp, setModalEmp] = useState(null);
  const [bonus, setBonus] = useState(0);
  const [deductions, setDeductions] = useState(0);
  const [employees, setEmployees] = useState(sampleEmployees);

  const processPayroll = () => {
    if (!modalEmp) return;
    const perDay = modalEmp.base_salary / modalEmp.total_days;
    const gross = perDay * modalEmp.present_days;
    const net = gross + bonus - deductions;
    setEmployees(employees.map((e) => e.id === modalEmp.id ? { ...e, paid: true, net_salary: net, bonus, deductions, payment_date: new Date().toISOString().split("T")[0] } : e));
    setModalEmp(null);
  };

  const net = modalEmp ? ((modalEmp.base_salary / modalEmp.total_days) * modalEmp.present_days + bonus - deductions) : 0;

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-4 mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full"></div>
          <div>
            <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Payroll & Salary</h2>
            <p className="text-sm text-slate-500 dark:text-slate-400">Process salaries for {new Date(month + "-01").toLocaleDateString("en-IN", { month: "long", year: "numeric" })}</p>
          </div>
        </div>
        <div className="flex items-center gap-3">
          <label className="text-sm font-medium text-slate-600 dark:text-slate-400">Select Month:</label>
          <input type="month" value={month} onChange={(e) => setMonth(e.target.value)}
            className="py-2.5 px-4 rounded-xl border-2 border-slate-200 dark:border-white/10 bg-white dark:bg-slate-800/50 font-medium text-slate-800 dark:text-slate-100 outline-none focus:border-teal-500 transition-all" />
        </div>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 dark:bg-white/5 border-b border-slate-200 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Employee</th>
                <th className="px-6 py-4">Base Salary</th>
                <th className="px-6 py-4">Attendance</th>
                <th className="px-6 py-4">Payroll Stats</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4 text-right">Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-white/5">
              {employees.map((emp) => (
                <tr key={emp.id} className="hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="font-bold text-slate-800 dark:text-slate-200">{emp.full_name}</div>
                    <div className="text-sm text-slate-500 dark:text-slate-400">{emp.designation}</div>
                  </td>
                  <td className="px-6 py-4 font-semibold text-slate-700 dark:text-slate-300">₹{emp.base_salary.toLocaleString()}</td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">
                    <span className="font-bold text-emerald-600 dark:text-emerald-500">{emp.present_days}</span> / {emp.total_days} days
                  </td>
                  <td className="px-6 py-4 text-sm">
                    {emp.paid ? (
                      <>
                        <div className="text-slate-600 dark:text-slate-400">Gross: ₹{((emp.base_salary / emp.total_days) * emp.present_days).toFixed(0)}</div>
                        <div className="text-slate-400 dark:text-slate-500 text-xs">+{emp.bonus} | -{emp.deductions}</div>
                        <div className="font-bold text-slate-800 dark:text-slate-200">Net: ₹{emp.net_salary.toLocaleString()}</div>
                      </>
                    ) : <span className="text-slate-300 dark:text-slate-600">Not processed</span>}
                  </td>
                  <td className="px-6 py-4">
                    {emp.paid ? (
                      <>
                        <span className="px-3 py-1 rounded-full text-xs font-bold bg-emerald-100 dark:bg-emerald-500/20 text-emerald-700 dark:text-emerald-400">PAID</span>
                        {emp.payment_date && <div className="text-xs text-slate-400 dark:text-slate-500 mt-1">{new Date(emp.payment_date).toLocaleDateString()}</div>}
                      </>
                    ) : (
                      <span className="px-3 py-1 rounded-full text-xs font-bold bg-slate-100 dark:bg-white/10 text-slate-500 dark:text-slate-400">PENDING</span>
                    )}
                  </td>
                  <td className="px-6 py-4 text-right">
                    <Button variant={emp.paid ? "secondary" : "primary"} onClick={() => { setModalEmp(emp); setBonus(emp.bonus); setDeductions(emp.deductions); }}>
                      <i className={`fa-solid ${emp.paid ? "fa-pen" : "fa-calculator"}`}></i> {emp.paid ? "Edit" : "Process"}
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </GlassCard>

      {/* Payroll Modal */}
      {modalEmp && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <GlassCard className="w-full max-w-md bg-white dark:bg-slate-900 border border-slate-200 dark:border-white/10">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100">Process Payroll</h3>
              <button onClick={() => setModalEmp(null)} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 text-xl"><i className="fa-solid fa-xmark"></i></button>
            </div>
            <div className="bg-slate-50 dark:bg-white/5 p-4 rounded-xl mb-6">
              <div className="font-bold text-lg text-slate-800 dark:text-slate-200">{modalEmp.full_name}</div>
              <div className="text-sm text-slate-500 dark:text-slate-400">Month: {new Date(month + "-01").toLocaleDateString("en-IN", { month: "long", year: "numeric" })}</div>
            </div>
            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label className="text-xs font-semibold text-slate-500 dark:text-slate-400 block mb-1">Present Days</label>
                <div className="py-2.5 px-4 rounded-xl border border-slate-200 dark:border-white/10 bg-slate-50 dark:bg-white/5 font-medium text-slate-600 dark:text-slate-300">{modalEmp.present_days}</div>
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 dark:text-slate-400 block mb-1">Base Salary</label>
                <div className="py-2.5 px-4 rounded-xl border border-slate-200 dark:border-white/10 bg-slate-50 dark:bg-white/5 font-medium text-slate-600 dark:text-slate-300">₹{modalEmp.base_salary.toLocaleString()}</div>
              </div>
            </div>
            <div className="space-y-4 mb-6">
              <div>
                <label className="text-xs font-semibold text-slate-500 dark:text-slate-400 block mb-1">Bonus / Incentive (+)</label>
                <input type="number" value={bonus} onChange={(e) => setBonus(Number(e.target.value))} min={0}
                  className="glass-input-topbar w-full py-2.5 px-4 rounded-xl font-medium outline-none transition-all duration-200" />
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 dark:text-slate-400 block mb-1">Deductions (-)</label>
                <input type="number" value={deductions} onChange={(e) => setDeductions(Number(e.target.value))} min={0}
                  className="glass-input-topbar w-full py-2.5 px-4 rounded-xl font-medium outline-none transition-all duration-200" />
              </div>
            </div>
            <div className="bg-emerald-50 dark:bg-emerald-500/10 p-4 rounded-xl text-center mb-6">
              <div className="text-xs text-emerald-700 dark:text-emerald-400 font-semibold">Estimated Net Salary</div>
              <div className="text-3xl font-extrabold text-emerald-600 dark:text-emerald-500">₹{net.toLocaleString("en-IN", { minimumFractionDigits: 2 })}</div>
            </div>
            <Button variant="primary" className="w-full !justify-center !bg-gradient-to-r !from-emerald-500 !to-teal-500 !shadow-emerald-500/30" onClick={processPayroll}>
              <i className="fa-solid fa-check"></i> Confirm & Pay
            </Button>
          </GlassCard>
        </div>
      )}
    </div>
  );
}
