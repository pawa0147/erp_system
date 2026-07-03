import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function SystemMonitoringPage() {
  return (
    <div className="space-y-6 max-w-6xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-blue-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">System Monitoring</h2>
        </div>
        <Link to="/">
          <button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors">
            <i className="fa-solid fa-arrow-left mr-2"></i> Back to Dashboard
          </button>
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <GlassCard className="p-5 flex flex-col items-center justify-center text-center">
          <div className="w-12 h-12 bg-emerald-100 text-emerald-600 dark:bg-emerald-500/20 dark:text-emerald-400 rounded-full flex items-center justify-center text-xl mb-3">
            <i className="fa-solid fa-server"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">99.9%</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">Uptime (30 days)</div>
        </GlassCard>
        <GlassCard className="p-5 flex flex-col items-center justify-center text-center">
          <div className="w-12 h-12 bg-blue-100 text-blue-600 dark:bg-blue-500/20 dark:text-blue-400 rounded-full flex items-center justify-center text-xl mb-3">
            <i className="fa-solid fa-microchip"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">42%</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">Avg CPU Usage</div>
        </GlassCard>
        <GlassCard className="p-5 flex flex-col items-center justify-center text-center">
          <div className="w-12 h-12 bg-purple-100 text-purple-600 dark:bg-purple-500/20 dark:text-purple-400 rounded-full flex items-center justify-center text-xl mb-3">
            <i className="fa-solid fa-memory"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">6.4 GB</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">RAM Usage (of 16GB)</div>
        </GlassCard>
        <GlassCard className="p-5 flex flex-col items-center justify-center text-center">
          <div className="w-12 h-12 bg-amber-100 text-amber-600 dark:bg-amber-500/20 dark:text-amber-400 rounded-full flex items-center justify-center text-xl mb-3">
            <i className="fa-solid fa-database"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">12 ms</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">DB Latency</div>
        </GlassCard>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <GlassCard>
          <h3 className="font-bold text-slate-800 dark:text-slate-200 mb-6 flex items-center gap-2">
            <i className="fa-solid fa-bolt text-indigo-500"></i> Active Services
          </h3>
          <div className="space-y-4">
            {[
              { name: "Main API Server", status: "Operational", color: "text-emerald-500", dot: "bg-emerald-500" },
              { name: "Database (MySQL)", status: "Operational", color: "text-emerald-500", dot: "bg-emerald-500" },
              { name: "Redis Cache", status: "Operational", color: "text-emerald-500", dot: "bg-emerald-500" },
              { name: "Background Worker", status: "Operational", color: "text-emerald-500", dot: "bg-emerald-500" },
              { name: "Email Service", status: "Operational", color: "text-emerald-500", dot: "bg-emerald-500" },
            ].map(s => (
              <div key={s.name} className="flex justify-between items-center p-3 rounded-xl bg-black/5 dark:bg-white/5">
                <div className="font-semibold text-slate-700 dark:text-slate-300">{s.name}</div>
                <div className={`flex items-center gap-2 text-sm font-bold ${s.color}`}>
                  <span className={`w-2 h-2 rounded-full ${s.dot} animate-pulse`}></span>
                  {s.status}
                </div>
              </div>
            ))}
          </div>
        </GlassCard>

        <GlassCard>
          <h3 className="font-bold text-slate-800 dark:text-slate-200 mb-6 flex items-center gap-2">
            <i className="fa-solid fa-triangle-exclamation text-rose-500"></i> System Alerts
          </h3>
          <div className="space-y-4">
            <div className="p-4 rounded-xl border border-emerald-200 bg-emerald-50 dark:bg-emerald-500/10 dark:border-emerald-500/30 flex gap-4">
              <i className="fa-solid fa-circle-check text-emerald-500 text-xl mt-0.5"></i>
              <div>
                <h4 className="font-bold text-emerald-700 dark:text-emerald-400">All Systems Normal</h4>
                <p className="text-sm text-emerald-600/80 dark:text-emerald-400/80 mt-1">No active issues or warnings at this time.</p>
                <div className="text-xs font-bold text-emerald-500 mt-2">Updated just now</div>
              </div>
            </div>
            
            <div className="p-4 rounded-xl border border-blue-200 bg-blue-50 dark:bg-blue-500/10 dark:border-blue-500/30 flex gap-4">
              <i className="fa-solid fa-rotate text-blue-500 text-xl mt-0.5"></i>
              <div>
                <h4 className="font-bold text-blue-700 dark:text-blue-400">Database Backup Successful</h4>
                <p className="text-sm text-blue-600/80 dark:text-blue-400/80 mt-1">Daily automated backup completed in 45 seconds.</p>
                <div className="text-xs font-bold text-blue-500 mt-2">4 hours ago</div>
              </div>
            </div>
          </div>
        </GlassCard>
      </div>
    </div>
  );
}
