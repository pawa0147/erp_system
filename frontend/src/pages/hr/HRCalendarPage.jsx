import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function HRCalendarPage() {
  const events = [
    { id: 1, title: "Company Townhall", date: "2025-06-15", type: "event", color: "bg-blue-100 text-blue-700 dark:bg-blue-500/20 dark:text-blue-400" },
    { id: 2, title: "Public Holiday (Eid)", date: "2025-06-17", type: "holiday", color: "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/20 dark:text-emerald-400" },
    { id: 3, title: "Rahul's Work Anniversary", date: "2025-06-20", type: "anniversary", color: "bg-purple-100 text-purple-700 dark:bg-purple-500/20 dark:text-purple-400" },
    { id: 4, title: "Performance Reviews Due", date: "2025-06-25", type: "deadline", color: "bg-rose-100 text-rose-700 dark:bg-rose-500/20 dark:text-rose-400" },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-blue-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">HR Calendar</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/hr"><button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors"><i className="fa-solid fa-arrow-left mr-2"></i> Back to HR</button></Link>
          <button className="px-4 py-2 rounded-xl bg-indigo-500 text-white font-semibold hover:bg-indigo-600 shadow-lg shadow-indigo-500/30 transition-all"><i className="fa-solid fa-plus mr-2"></i> Add Event</button>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="lg:col-span-2 space-y-6">
          <GlassCard className="p-6">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-xl font-bold text-slate-800 dark:text-slate-200">June 2025</h3>
              <div className="flex gap-2">
                <button className="w-8 h-8 rounded-lg bg-slate-100 dark:bg-white/10 flex items-center justify-center hover:bg-slate-200 dark:hover:bg-white/20 transition-colors"><i className="fa-solid fa-chevron-left text-slate-600 dark:text-slate-400"></i></button>
                <button className="px-4 h-8 rounded-lg bg-slate-100 dark:bg-white/10 text-sm font-semibold text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-white/20 transition-colors">Today</button>
                <button className="w-8 h-8 rounded-lg bg-slate-100 dark:bg-white/10 flex items-center justify-center hover:bg-slate-200 dark:hover:bg-white/20 transition-colors"><i className="fa-solid fa-chevron-right text-slate-600 dark:text-slate-400"></i></button>
              </div>
            </div>
            
            <div className="grid grid-cols-7 gap-2 text-center text-sm font-semibold text-slate-500 dark:text-slate-400 mb-2">
              <div>Sun</div><div>Mon</div><div>Tue</div><div>Wed</div><div>Thu</div><div>Fri</div><div>Sat</div>
            </div>
            <div className="grid grid-cols-7 gap-2">
              {/* Dummy Calendar Grid for illustration */}
              {Array.from({ length: 30 }).map((_, i) => (
                <div key={i} className={`h-24 rounded-xl border border-slate-100 dark:border-white/5 p-2 ${i === 14 ? 'bg-indigo-50 dark:bg-indigo-500/10 border-indigo-200 dark:border-indigo-500/30' : 'bg-black/[0.02] dark:bg-white/[0.02]'}`}>
                  <div className={`text-xs font-bold ${i === 14 ? 'text-indigo-600 dark:text-indigo-400' : 'text-slate-500 dark:text-slate-400'}`}>{i + 1}</div>
                  {i === 14 && <div className="mt-1 text-[10px] font-bold bg-blue-100 text-blue-700 dark:bg-blue-500/20 dark:text-blue-400 p-1 rounded truncate">Townhall</div>}
                  {i === 16 && <div className="mt-1 text-[10px] font-bold bg-emerald-100 text-emerald-700 dark:bg-emerald-500/20 dark:text-emerald-400 p-1 rounded truncate">Eid</div>}
                  {i === 19 && <div className="mt-1 text-[10px] font-bold bg-purple-100 text-purple-700 dark:bg-purple-500/20 dark:text-purple-400 p-1 rounded truncate">Anniversary</div>}
                  {i === 24 && <div className="mt-1 text-[10px] font-bold bg-rose-100 text-rose-700 dark:bg-rose-500/20 dark:text-rose-400 p-1 rounded truncate">Reviews Due</div>}
                </div>
              ))}
            </div>
          </GlassCard>
        </div>

        <div className="space-y-6">
          <GlassCard>
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4">Upcoming Events</h3>
            <div className="space-y-3">
              {events.map(ev => (
                <div key={ev.id} className="flex gap-4 items-start p-3 rounded-xl bg-black/5 dark:bg-white/5 hover:bg-black/10 dark:hover:bg-white/10 transition-colors cursor-pointer">
                  <div className={`w-12 h-12 rounded-xl flex flex-col items-center justify-center shrink-0 ${ev.color}`}>
                    <span className="text-xs font-bold uppercase">{new Date(ev.date).toLocaleString('default', { month: 'short' })}</span>
                    <span className="text-lg font-extrabold leading-none">{new Date(ev.date).getDate()}</span>
                  </div>
                  <div>
                    <div className="font-bold text-slate-800 dark:text-slate-200 text-sm">{ev.title}</div>
                    <div className="text-xs text-slate-500 dark:text-slate-400 mt-1 capitalize">{ev.type}</div>
                  </div>
                </div>
              ))}
            </div>
          </GlassCard>
          
          <GlassCard>
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4">Legend</h3>
            <div className="space-y-2">
              <div className="flex items-center gap-2 text-sm text-slate-600 dark:text-slate-400"><div className="w-3 h-3 rounded-full bg-blue-500"></div> Company Event</div>
              <div className="flex items-center gap-2 text-sm text-slate-600 dark:text-slate-400"><div className="w-3 h-3 rounded-full bg-emerald-500"></div> Holiday</div>
              <div className="flex items-center gap-2 text-sm text-slate-600 dark:text-slate-400"><div className="w-3 h-3 rounded-full bg-purple-500"></div> Work Anniversary / Birthday</div>
              <div className="flex items-center gap-2 text-sm text-slate-600 dark:text-slate-400"><div className="w-3 h-3 rounded-full bg-rose-500"></div> Deadline</div>
            </div>
          </GlassCard>
        </div>
      </div>
    </div>
  );
}
