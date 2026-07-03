import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function FeedbackPage() {
  const feedbacks = [
    { id: 1, from: "Amit Sharma", to: "Priya Patel", date: "2025-06-12", rating: 5, comment: "Priya did an excellent job on the frontend architecture. Great teamwork!", type: "Peer Review" },
    { id: 2, from: "HR Dept", to: "Rahul Singh", date: "2025-06-10", rating: 4, comment: "Good performance this quarter. Needs to work on communication skills.", type: "Quarterly Review" },
    { id: 3, from: "Sneha Reddy", to: "Amit Sharma", date: "2025-06-08", rating: 5, comment: "Very helpful mentor. Learned a lot about React hooks from him.", type: "Peer Review" },
  ];

  return (
    <div className="space-y-6 max-w-5xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Employee Feedback</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/hr"><button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors"><i className="fa-solid fa-arrow-left mr-2"></i> Back to HR</button></Link>
          <button className="px-4 py-2 rounded-xl bg-indigo-500 text-white font-semibold hover:bg-indigo-600 shadow-lg shadow-indigo-500/30 transition-all"><i className="fa-solid fa-plus mr-2"></i> Submit Feedback</button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <GlassCard className="p-6 text-center">
          <div className="w-12 h-12 bg-blue-100 text-blue-600 dark:bg-blue-500/20 dark:text-blue-400 rounded-full flex items-center justify-center text-xl mx-auto mb-3">
            <i className="fa-solid fa-comments"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">142</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">Total Feedbacks</div>
        </GlassCard>
        <GlassCard className="p-6 text-center">
          <div className="w-12 h-12 bg-emerald-100 text-emerald-600 dark:bg-emerald-500/20 dark:text-emerald-400 rounded-full flex items-center justify-center text-xl mx-auto mb-3">
            <i className="fa-solid fa-star"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">4.6</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">Average Company Rating</div>
        </GlassCard>
        <GlassCard className="p-6 text-center">
          <div className="w-12 h-12 bg-purple-100 text-purple-600 dark:bg-purple-500/20 dark:text-purple-400 rounded-full flex items-center justify-center text-xl mx-auto mb-3">
            <i className="fa-solid fa-users"></i>
          </div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">89%</div>
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mt-1">Participation Rate</div>
        </GlassCard>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="p-6 border-b border-black/5 dark:border-white/10 flex justify-between items-center bg-black/5 dark:bg-white/5">
          <h3 className="font-bold text-slate-800 dark:text-slate-200">Recent Feedbacks</h3>
          <div className="flex gap-2">
            <select className="glass-input-topbar py-1.5 px-3 rounded-lg text-sm font-medium outline-none">
              <option>All Types</option>
              <option>Peer Review</option>
              <option>Quarterly Review</option>
              <option>Manager Review</option>
            </select>
          </div>
        </div>
        <div className="divide-y divide-black/5 dark:divide-white/10">
          {feedbacks.map(f => (
            <div key={f.id} className="p-6 hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
              <div className="flex justify-between items-start mb-4">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-indigo-100 text-indigo-700 dark:bg-indigo-500/20 dark:text-indigo-400 flex items-center justify-center font-bold">
                    {f.from.charAt(0)}
                  </div>
                  <div>
                    <div className="text-sm text-slate-500 dark:text-slate-400">
                      <span className="font-bold text-slate-800 dark:text-slate-200">{f.from}</span> left feedback for <span className="font-bold text-slate-800 dark:text-slate-200">{f.to}</span>
                    </div>
                    <div className="text-xs font-semibold text-slate-400 mt-0.5">{new Date(f.date).toLocaleDateString()} • <span className="text-indigo-500">{f.type}</span></div>
                  </div>
                </div>
                <div className="flex gap-1 text-amber-400 text-sm">
                  {Array.from({ length: 5 }).map((_, i) => (
                    <i key={i} className={`fa-solid fa-star ${i < f.rating ? '' : 'opacity-30'}`}></i>
                  ))}
                </div>
              </div>
              <p className="text-slate-700 dark:text-slate-300 bg-black/5 dark:bg-white/5 p-4 rounded-xl text-sm italic">
                "{f.comment}"
              </p>
            </div>
          ))}
        </div>
      </GlassCard>
    </div>
  );
}
