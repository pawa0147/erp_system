import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

function DeleteButton({ id, onDelete }) {
  const [loading, setLoading] = useState(false);

  async function handleDelete() {
    if (!window.confirm("Are you sure you want to delete this employee?")) return;
    setLoading(true);
    try {
      const res = await fetch(`${API_URL}/api/employees/${id}`, { method: 'DELETE' });
      if (res.ok) {
        onDelete(id);
      } else {
        console.error('Failed to delete employee');
      }
    } catch (err) {
      console.error(err);
    }
    setLoading(false);
  }

  return (
    <button
      onClick={handleDelete}
      disabled={loading}
      className="w-8 h-8 rounded-lg bg-rose-50 dark:bg-rose-500/10 text-rose-600 dark:text-rose-400 hover:bg-rose-100 dark:hover:bg-rose-500/20 transition-colors flex items-center justify-center disabled:opacity-50"
      title="Delete Employee"
    >
      <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-trash"}></i>
    </button>
  );
}

export default function HRPage() {
  const [employees, setEmployees] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/employees`)
      .then(res => res.json())
      .then(data => {
        setEmployees(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch employees:', err);
        setLoading(false);
      });
  }, []);

  const handleDeleteSuccess = (id) => {
    setEmployees(employees.filter(e => e.id !== id));
  };

  if (loading) {
    return <div className="p-8 text-center text-slate-500"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>;
  }

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between mb-8 gap-4">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-600 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Employee Directory</h2>
        </div>
        <Link to="/hr/add">
          <Button variant="primary">
            <i className="fa-solid fa-user-plus"></i> Add Employee
          </Button>
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        {[
          { title: "Total Employees", value: employees.length, icon: "fa-users", color: "blue" },
          { title: "Full Time", value: employees.filter(e => e.employment_type === "Full Time").length, icon: "fa-briefcase", color: "indigo" },
          { title: "Interns", value: employees.filter(e => e.employment_type === "Internship").length, icon: "fa-graduation-cap", color: "amber" },
          { title: "Contract", value: employees.filter(e => e.employment_type === "Contract").length, icon: "fa-file-signature", color: "emerald" },
        ].map((stat, i) => (
          <GlassCard key={i} className="p-6 flex items-center justify-between">
            <div>
              <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">{stat.title}</div>
              <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{stat.value}</div>
            </div>
            <div className={`w-12 h-12 rounded-xl bg-${stat.color}-500/10 text-${stat.color}-500 flex items-center justify-center text-xl`}>
              <i className={`fa-solid ${stat.icon}`}></i>
            </div>
          </GlassCard>
        ))}
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Employee</th>
                <th className="px-6 py-4">Contact</th>
                <th className="px-6 py-4">Role & Type</th>
                <th className="px-6 py-4">Joined</th>
                <th className="px-6 py-4">Salary</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-black/5 dark:divide-white/5">
              {employees.map((emp) => (
                <tr key={emp.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center text-white font-bold shadow-md">
                        {(emp.full_name || "?").charAt(0).toUpperCase()}
                      </div>
                      <div>
                        <div className="font-bold text-slate-800 dark:text-slate-200">{emp.full_name || "Unknown"}</div>
                        <div className="text-xs text-slate-500 dark:text-slate-400">ID: EMP-{emp.id?.toString().padStart(4, '0') || "0000"}</div>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-300">
                    {emp.email && <div><i className="fa-regular fa-envelope w-4 mr-1 opacity-70"></i>{emp.email}</div>}
                    {emp.phone && <div><i className="fa-solid fa-phone w-4 mr-1 opacity-70"></i>{emp.phone}</div>}
                  </td>
                  <td className="px-6 py-4">
                    <div className="font-semibold text-slate-700 dark:text-slate-300">{emp.designation}</div>
                    <span className={`inline-block mt-1 px-2.5 py-0.5 rounded-full text-xs font-bold uppercase ${
                      emp.employment_type === "Full Time" ? "bg-blue-100 text-blue-700 dark:bg-blue-500/10 dark:text-blue-400" :
                      emp.employment_type === "Internship" ? "bg-amber-100 text-amber-700 dark:bg-amber-500/10 dark:text-amber-400" :
                      "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400"
                    }`}>
                      {emp.employment_type}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-500 dark:text-slate-400">
                    {emp.joining_date ? new Date(emp.joining_date).toLocaleDateString() : "N/A"}
                  </td>
                  <td className="px-6 py-4 text-sm font-semibold text-slate-700 dark:text-slate-300">
                    ₹{Number(emp.base_salary || 0).toLocaleString()}
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <Link to={`/hr/edit/${emp.id}`} className="w-8 h-8 rounded-lg bg-blue-50 dark:bg-blue-500/10 text-blue-600 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-500/20 transition-colors flex items-center justify-center">
                        <i className="fa-solid fa-pen-to-square"></i>
                      </Link>
                      <DeleteButton id={emp.id} onDelete={handleDeleteSuccess} />
                    </div>
                  </td>
                </tr>
              ))}
              
              {employees.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-slate-500 dark:text-slate-400">
                    <div className="mb-3 text-4xl opacity-30"><i className="fa-solid fa-users"></i></div>
                    <div className="font-semibold text-lg mb-1">No employees found</div>
                    <div>Add your first employee to build the directory.</div>
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
