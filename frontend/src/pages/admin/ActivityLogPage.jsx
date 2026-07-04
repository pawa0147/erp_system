import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function ActivityLogPage() {
  const activities = [
    { id: 1, user: "Amit Sharma", action: "Created new project", target: "E-Commerce Website Redesign", time: "10 mins ago", icon: "fa-folder-plus", color: "text-blue-500", bg: "bg-blue-100 dark:bg-blue-500/20" },
    { id: 2, user: "System", action: "Automated Backup Completed", target: "Database", time: "1 hour ago", icon: "fa-database", color: "text-emerald-500", bg: "bg-emerald-100 dark:bg-emerald-500/20" },
    { id: 3, user: "Priya Patel", action: "Updated client status", target: "Acme Corp", time: "2 hours ago", icon: "fa-pen-to-square", color: "text-amber-500", bg: "bg-amber-100 dark:bg-amber-500/20" },
    { id: 4, user: "Rahul Singh", action: "Deleted an invoice", target: "INV-0042", time: "3 hours ago", icon: "fa-trash", color: "text-rose-500", bg: "bg-rose-100 dark:bg-rose-500/20" },
    { id: 5, user: "System", action: "Failed login attempt", target: "IP: 192.168.1.45", time: "5 hours ago", icon: "fa-shield-halved", color: "text-rose-500", bg: "bg-rose-100 dark:bg-rose-500/20" },
    { id: 6, user: "Admin", action: "Added new employee", target: "Sneha Reddy", time: "Yesterday", icon: "fa-user-plus", color: "text-indigo-500", bg: "bg-indigo-100 dark:bg-indigo-500/20" },
  ];

  return (
    <div className="space-y-6 max-w-5xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">System Activity Log</h2>
        </div>
        <Link to="/settings">
          <button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors" onClick={() => alert('Feature coming soon!')}>
            <i className="fa-solid fa-arrow-left mr-2"></i> Back to Settings
          </button>
        </Link>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="p-6 border-b border-black/5 dark:border-white/10 flex justify-between items-center bg-black/5 dark:bg-white/5">
          <div className="flex gap-4">
            <select className="glass-input-topbar py-1.5 px-3 rounded-lg text-sm font-medium outline-none">
              <option>All Modules</option>
              <option>Projects</option>
              <option>Finance</option>
              <option>HR</option>
              <option>System</option>
            </select>
            <select className="glass-input-topbar py-1.5 px-3 rounded-lg text-sm font-medium outline-none">
              <option>All Users</option>
              <option>System</option>
              <option>Admins</option>
              <option>Employees</option>
            </select>
          </div>
          <button className="px-3 py-1.5 rounded-lg bg-slate-100 dark:bg-white/10 text-slate-600 dark:text-slate-300 text-sm font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors" onClick={() => alert('Feature coming soon!')}>
            <i className="fa-solid fa-filter"></i>
          </button>
        </div>
        
        <div className="divide-y divide-black/5 dark:divide-white/10">
          {activities.map(act => (
            <div key={act.id} className="p-4 flex items-center justify-between hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
              <div className="flex items-center gap-4">
                <div className={`w-10 h-10 rounded-xl flex items-center justify-center text-lg ${act.bg} ${act.color}`}>
                  <i className={`fa-solid ${act.icon}`}></i>
                </div>
                <div>
                  <div className="text-slate-700 dark:text-slate-300 text-sm">
                    <span className="font-bold text-slate-800 dark:text-slate-100">{act.user}</span> {act.action} <span className="font-semibold">{act.target}</span>
                  </div>
                  <div className="text-xs font-semibold text-slate-500 dark:text-slate-400 mt-1">{act.time}</div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </GlassCard>
    </div>
  );
}
