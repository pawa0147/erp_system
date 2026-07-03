import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";

const leaveBalances = [
  { type: "Casual Leave", total: 12, used: 3, icon: "fa-briefcase", bg: "bg-blue-50 dark:bg-blue-500/10 text-blue-600 dark:text-blue-400", bar: "bg-blue-500" },
  { type: "Sick Leave", total: 10, used: 1, icon: "fa-heart-pulse", bg: "bg-red-50 dark:bg-red-500/10 text-red-500 dark:text-red-400", bar: "bg-red-500" },
  { type: "Paid Leave", total: 15, used: 5, icon: "fa-sack-dollar", bg: "bg-emerald-50 dark:bg-emerald-500/10 text-emerald-600 dark:text-emerald-400", bar: "bg-emerald-500" },
  { type: "Unpaid Leave", total: 0, used: 0, icon: "fa-calendar-xmark", bg: "bg-slate-100 dark:bg-white/5 text-slate-500 dark:text-slate-400", bar: "bg-slate-400" },
];

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

const statusStyles = {
  Approved: "bg-emerald-100 dark:bg-emerald-500/20 text-emerald-700 dark:text-emerald-400",
  Rejected: "bg-red-100 dark:bg-red-500/20 text-red-700 dark:text-red-400",
  Pending: "bg-amber-100 dark:bg-amber-500/20 text-amber-700 dark:text-amber-400",
};

export default function LeavesPage() {
  const [showModal, setShowModal] = useState(false);
  const [leaves, setLeaves] = useState([]);
  

  useEffect(() => {
    fetch(`${API_URL}/api/hr/leaves`)
      .then(res => res.ok ? res.json() : [])
      .then(data => setLeaves(data))
      .catch(err => console.error(err));
  }, []);
  const [filter, setFilter] = useState("all");

  const filtered = filter === "all" ? leaves : leaves.filter((l) => l.status === filter);

  const daysBetween = (s, e) => {
    const d1 = new Date(s), d2 = new Date(e);
    return Math.round((d2.getTime() - d1.getTime()) / 86400000) + 1;
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
          <div>
            <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Leave Management</h2>
            <p className="text-sm text-slate-500 dark:text-slate-400">Manage applications, track history, and view balances.</p>
          </div>
        </div>
        <Button variant="primary" onClick={() => setShowModal(true)}><i className="fa-solid fa-plus"></i> New Application</Button>
      </div>

      {/* Balance Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        {leaveBalances.map((bal) => (
          <GlassCard key={bal.type}>
            <div className="flex justify-between items-start mb-4">
              <div>
                <div className="text-sm font-bold text-slate-500 dark:text-slate-400 mb-1">{bal.type}</div>
                <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{bal.total > 0 ? bal.total - bal.used : "∞"}</div>
                <div className="text-xs text-slate-400 mt-1">days remaining</div>
              </div>
              <div className={`w-10 h-10 rounded-xl flex items-center justify-center text-lg ${bal.bg}`}>
                <i className={`fa-solid ${bal.icon}`}></i>
              </div>
            </div>
            {bal.total > 0 && (
              <div>
                <div className="flex justify-between text-xs text-slate-400 mb-1">
                  <span>Used: {bal.used}</span><span>Total: {bal.total}</span>
                </div>
                <div className="w-full h-1.5 bg-slate-100 dark:bg-white/10 rounded-full overflow-hidden">
                  <div className={`h-full ${bal.bar} rounded-full`} style={{ width: `${(bal.used / bal.total) * 100}%` }}></div>
                </div>
              </div>
            )}
          </GlassCard>
        ))}
      </div>

      {/* Filters */}
      <div className="flex gap-2">
        {["all", "Pending", "Approved", "Rejected"].map((f) => (
          <button key={f} onClick={() => setFilter(f)}
            className={`px-4 py-2 rounded-full text-sm font-semibold transition-all ${filter === f ? "bg-blue-500 text-white shadow-md shadow-blue-500/20" : "bg-white dark:bg-slate-800 border border-slate-200 dark:border-white/10 text-slate-600 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-white/5"}`}>
            {f.charAt(0).toUpperCase() + f.slice(1)}
          </button>
        ))}
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 dark:bg-white/5 border-b border-slate-200 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Employee</th>
                <th className="px-6 py-4">Leave Details</th>
                <th className="px-6 py-4">Timeline</th>
                <th className="px-6 py-4">Reason</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-white/5">
              {filtered.map((row) => (
                <tr key={row.id} className="hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-full bg-indigo-100 dark:bg-indigo-500/20 text-indigo-600 dark:text-indigo-400 flex items-center justify-center font-bold">{row.full_name.charAt(0)}</div>
                      <div>
                        <div className="font-bold text-slate-800 dark:text-slate-200">{row.full_name}</div>
                        <div className="text-xs text-slate-500 dark:text-slate-400">{row.designation}</div>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4">
                    <div className="font-semibold text-slate-700 dark:text-slate-300">{row.leave_type}</div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">
                    <div className="flex items-center gap-1">
                      <i className="fa-regular fa-calendar text-slate-400"></i>
                      {new Date(row.start_date).toLocaleDateString()} <i className="fa-solid fa-arrow-right text-slate-300 dark:text-slate-600 text-xs"></i> {new Date(row.end_date).toLocaleDateString()}
                    </div>
                    <div className="text-xs text-slate-400 mt-1">{daysBetween(row.start_date, row.end_date)} day(s)</div>
                  </td>
                  <td className="px-6 py-4 max-w-[200px]">
                    <div className="bg-slate-50 dark:bg-white/5 px-3 py-2 rounded-lg text-sm text-slate-600 dark:text-slate-400 italic">{row.reason}</div>
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${statusStyles[row.status]}`}>{row.status}</span>
                  </td>
                  <td className="px-6 py-4">
                    {row.status === "Pending" ? (
                      <div className="flex gap-2">
                        <button onClick={() => setLeaves(leaves.map((l) => l.id === row.id ? { ...l, status: "Approved" } : l))}
                          className="w-8 h-8 bg-emerald-100 dark:bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 rounded-lg flex items-center justify-center hover:bg-emerald-200 dark:hover:bg-emerald-500/20 transition-colors">
                          <i className="fa-solid fa-check"></i>
                        </button>
                        <button onClick={() => setLeaves(leaves.map((l) => l.id === row.id ? { ...l, status: "Rejected" } : l))}
                          className="w-8 h-8 bg-red-100 dark:bg-red-500/10 text-red-500 dark:text-red-400 rounded-lg flex items-center justify-center hover:bg-red-200 dark:hover:bg-red-500/20 transition-colors">
                          <i className="fa-solid fa-xmark"></i>
                        </button>
                      </div>
                    ) : <span className="text-slate-300 dark:text-slate-600">—</span>}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </GlassCard>

      {/* Apply Modal */}
      {showModal && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <GlassCard className="w-full max-w-lg bg-white dark:bg-slate-900 border border-slate-200 dark:border-white/10">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100">New Leave Request</h3>
              <button onClick={() => setShowModal(false)} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 text-xl"><i className="fa-solid fa-xmark"></i></button>
            </div>
            <form className="space-y-4" onSubmit={(e) => { e.preventDefault(); setShowModal(false); }}>
              <div>
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Leave Type</label>
                <div className="grid grid-cols-2 gap-3">
                  {["Casual Leave", "Sick Leave", "Paid Leave", "Unpaid Leave"].map((type) => (
                    <label key={type} className="flex items-center gap-3 p-3 border-2 border-slate-200 dark:border-white/10 rounded-xl cursor-pointer hover:border-blue-400 dark:hover:border-blue-500 transition-colors">
                      <input type="radio" name="leave_type" value={type} className="accent-blue-500" />
                      <span className="text-sm font-medium text-slate-700 dark:text-slate-300">{type}</span>
                    </label>
                  ))}
                </div>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <Input label="Start Date" type="date" required />
                <Input label="End Date" type="date" required />
              </div>
              <div>
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Reason</label>
                <textarea required rows={3} placeholder="Brief description..."
                  className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200 resize-none"></textarea>
              </div>
              <Button type="submit" variant="primary" className="w-full !justify-center">Submit Request</Button>
            </form>
          </GlassCard>
        </div>
      )}
    </div>
  );
}
