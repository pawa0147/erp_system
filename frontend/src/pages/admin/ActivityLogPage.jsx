import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function ActivityLogPage() {
  const [activities, setActivities] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/admin/activity`)
      .then(res => res.ok ? res.json() : [])
      .then(data => {
        setActivities(data);
        setLoading(false);
      })
      .catch(err => {
        console.error(err);
        setLoading(false);
      });
  }, []);

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
              {activities.length === 0 ? (
                <div className="p-8 text-center text-slate-500">No activity logs found.</div>
              ) : activities.map((act) => (
                <div key={act.id} className="p-4 md:p-6 flex items-start gap-4 hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                  <div className={`w-10 h-10 rounded-full flex items-center justify-center shrink-0 ${act.bg || 'bg-slate-100 dark:bg-slate-800'}`}>
                    <i className={`fa-solid ${act.icon || 'fa-circle-info'} ${act.color || 'text-slate-500'}`}></i>
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex flex-col md:flex-row md:items-center justify-between gap-1 mb-1">
                      <p className="text-sm font-semibold text-slate-800 dark:text-slate-200">
                        <span className="text-indigo-600 dark:text-indigo-400 mr-1">{act.user_id ? `User ${act.user_id}` : 'System'}</span>
                        {act.action}
                      </p>
                      <span className="text-xs text-slate-500 whitespace-nowrap">{new Date(act.created_at).toLocaleString()}</span>
                    </div>
                    <p className="text-sm text-slate-600 dark:text-slate-400 truncate">
                      {act.module} {act.details ? `- ${act.details}` : ''}
                    </p>
                  </div>
                </div>
              ))}
        </div>
      </GlassCard>
    </div>
  );
}
