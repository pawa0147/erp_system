import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";
import { useState } from "react";

export default function AttendanceReportPage() {
  const [month, setMonth] = useState("2025-06");
  
  const reportData = [
    { id: 1, name: "Amit Sharma", empId: "EMP-001", present: 20, absent: 0, leave: 1, wfh: 1, late: 2 },
    { id: 2, name: "Priya Patel", empId: "EMP-002", present: 21, absent: 0, leave: 0, wfh: 1, late: 0 },
    { id: 3, name: "Rahul Singh", empId: "EMP-003", present: 18, absent: 1, leave: 2, wfh: 0, late: 4 },
    { id: 4, name: "Sneha Reddy", empId: "EMP-004", present: 22, absent: 0, leave: 0, wfh: 0, late: 1 },
    { id: 5, name: "Vikram Gupta", empId: "EMP-005", present: 15, absent: 0, leave: 5, wfh: 2, late: 0 },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Attendance Report</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/hr"><button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors"><i className="fa-solid fa-arrow-left mr-2"></i> Back to HR</button></Link>
          <button className="px-4 py-2 rounded-xl bg-emerald-100 text-emerald-700 dark:bg-emerald-500/20 dark:text-emerald-400 font-semibold hover:bg-emerald-200 dark:hover:bg-emerald-500/30 transition-colors"><i className="fa-solid fa-file-excel mr-2"></i> Export</button>
        </div>
      </div>

      <GlassCard className="mb-6 flex flex-wrap gap-4 items-end">
        <div className="flex flex-col gap-1.5 w-full md:w-64">
          <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Select Month</label>
          <input 
            type="month" 
            value={month}
            onChange={(e) => setMonth(e.target.value)}
            className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all"
          />
        </div>
        <div className="flex flex-col gap-1.5 w-full md:w-64">
          <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Department</label>
          <select className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all">
            <option className="text-slate-800 dark:bg-slate-800">All Departments</option>
            <option className="text-slate-800 dark:bg-slate-800">Engineering</option>
            <option className="text-slate-800 dark:bg-slate-800">Design</option>
            <option className="text-slate-800 dark:bg-slate-800">Marketing</option>
          </select>
        </div>
        <button className="px-4 py-2 rounded-lg bg-blue-500 text-white font-semibold hover:bg-blue-600 transition-colors">
          Generate
        </button>
      </GlassCard>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <GlassCard className="p-4 text-center">
          <div className="text-3xl font-extrabold text-emerald-500">92%</div>
          <div className="text-sm font-semibold text-slate-500 mt-1">Avg Attendance</div>
        </GlassCard>
        <GlassCard className="p-4 text-center">
          <div className="text-3xl font-extrabold text-blue-500">8</div>
          <div className="text-sm font-semibold text-slate-500 mt-1">Total Leaves Taken</div>
        </GlassCard>
        <GlassCard className="p-4 text-center">
          <div className="text-3xl font-extrabold text-amber-500">7</div>
          <div className="text-sm font-semibold text-slate-500 mt-1">Late Arrivals</div>
        </GlassCard>
        <GlassCard className="p-4 text-center">
          <div className="text-3xl font-extrabold text-rose-500">1</div>
          <div className="text-sm font-semibold text-slate-500 mt-1">Unplanned Absences</div>
        </GlassCard>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Employee</th>
                <th className="px-6 py-4 text-center">Present</th>
                <th className="px-6 py-4 text-center">Absent</th>
                <th className="px-6 py-4 text-center">Leave</th>
                <th className="px-6 py-4 text-center">WFH</th>
                <th className="px-6 py-4 text-center">Late</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-black/5 dark:divide-white/5">
              {reportData.map((row) => (
                <tr key={row.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="font-bold text-slate-800 dark:text-slate-200">{row.name}</div>
                    <div className="text-xs text-slate-500 dark:text-slate-400">{row.empId}</div>
                  </td>
                  <td className="px-6 py-4 text-center font-bold text-emerald-600 dark:text-emerald-400">{row.present}</td>
                  <td className="px-6 py-4 text-center font-bold text-rose-600 dark:text-rose-400">{row.absent}</td>
                  <td className="px-6 py-4 text-center font-bold text-blue-600 dark:text-blue-400">{row.leave}</td>
                  <td className="px-6 py-4 text-center font-bold text-indigo-600 dark:text-indigo-400">{row.wfh}</td>
                  <td className="px-6 py-4 text-center font-bold text-amber-600 dark:text-amber-400">{row.late}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
