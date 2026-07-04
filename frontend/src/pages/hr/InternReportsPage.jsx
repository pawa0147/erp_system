import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function InternReportsPage() {
  const interns = [
    { id: 1, name: "Neha Gupta", role: "Frontend Intern", mentor: "Amit Sharma", progress: 85, status: "On Track", end_date: "2025-08-15" },
    { id: 2, name: "Rohan Desai", role: "Backend Intern", mentor: "Priya Patel", progress: 40, status: "Needs Review", end_date: "2025-09-01" },
    { id: 3, name: "Kavya Singh", role: "UI/UX Intern", mentor: "Sneha Reddy", progress: 95, status: "Excellent", end_date: "2025-07-20" },
  ];

  const statusCfg = {
    "On Track": "bg-blue-100 text-blue-700 dark:bg-blue-500/20 dark:text-blue-400",
    "Needs Review": "bg-amber-100 text-amber-700 dark:bg-amber-500/20 dark:text-amber-400",
    "Excellent": "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/20 dark:text-emerald-400"
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Intern Reports & Tracking</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/hr"><button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors" onClick={() => alert('Feature coming soon!')}><i className="fa-solid fa-arrow-left mr-2"></i> Back to HR</button></Link>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Active Interns</div>
          <div className="text-3xl font-extrabold text-blue-600 dark:text-blue-400">12</div>
        </GlassCard>
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Avg Completion</div>
          <div className="text-3xl font-extrabold text-emerald-600 dark:text-emerald-400">74%</div>
        </GlassCard>
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Offers Extended</div>
          <div className="text-3xl font-extrabold text-purple-600 dark:text-purple-400">3</div>
        </GlassCard>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Intern</th>
                <th className="px-6 py-4">Role & Mentor</th>
                <th className="px-6 py-4">Overall Progress</th>
                <th className="px-6 py-4">End Date</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-black/5 dark:divide-white/5">
              {interns.map(intern => (
                <tr key={intern.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="font-bold text-slate-800 dark:text-slate-200">{intern.name}</div>
                    <div className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">INT-{String(intern.id).padStart(3, '0')}</div>
                  </td>
                  <td className="px-6 py-4">
                    <div className="font-semibold text-slate-700 dark:text-slate-300 text-sm">{intern.role}</div>
                    <div className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Mentor: <span className="font-medium text-slate-600 dark:text-slate-300">{intern.mentor}</span></div>
                  </td>
                  <td className="px-6 py-4 w-48">
                    <div className="flex justify-between text-xs font-semibold mb-1 text-slate-600 dark:text-slate-400">
                      <span>Completion</span><span>{intern.progress}%</span>
                    </div>
                    <div className="w-full h-2 bg-black/10 dark:bg-white/10 rounded-full overflow-hidden">
                      <div className={`h-full rounded-full ${intern.progress >= 80 ? 'bg-emerald-500' : intern.progress >= 50 ? 'bg-blue-500' : 'bg-amber-500'}`} style={{ width: `${intern.progress}%` }}></div>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-sm font-medium text-slate-600 dark:text-slate-400">
                    {new Date(intern.end_date).toLocaleDateString()}
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${statusCfg[intern.status]}`}>{intern.status}</span>
                  </td>
                  <td className="px-6 py-4">
                    <button className="px-3 py-1.5 rounded-lg bg-blue-50 text-blue-600 dark:bg-blue-500/10 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-500/20 text-sm font-semibold transition-colors" onClick={() => alert('Feature coming soon!')}>
                      View Report
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
