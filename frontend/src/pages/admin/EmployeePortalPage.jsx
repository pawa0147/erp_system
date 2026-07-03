import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function EmployeePortalPage() {
  const me = { name: "Amit Sharma", designation: "Senior Developer", emp_id: "EMP-0001", joined: "Jan 15, 2023", email: "amit@webworks.com", salary: 85000 };

  const quickLinks = [
    { label: "Apply Leave", icon: "fa-calendar-minus", href: "/hr/leaves", color: "bg-blue-100 text-blue-600 dark:bg-blue-500/20 dark:text-blue-400" },
    { label: "Attendance Log", icon: "fa-clock", href: "/hr/attendance", color: "bg-emerald-100 text-emerald-600 dark:bg-emerald-500/20 dark:text-emerald-400" },
    { label: "My Payslips", icon: "fa-money-bill-wave", href: "/hr/payroll", color: "bg-purple-100 text-purple-600 dark:bg-purple-500/20 dark:text-purple-400" },
    { label: "My Tasks", icon: "fa-list-check", href: "/tasks", color: "bg-amber-100 text-amber-600 dark:bg-amber-500/20 dark:text-amber-400" },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center gap-4 mb-8">
        <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
        <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Employee Self-Service Portal</h2>
      </div>

      {/* Profile Card */}
      <GlassCard className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white border-0 shadow-lg shadow-indigo-500/20">
        <div className="flex items-center gap-6">
          <div className="w-20 h-20 rounded-2xl bg-white/20 flex items-center justify-center text-4xl font-extrabold shadow-inner backdrop-blur-sm">{me.name.charAt(0)}</div>
          <div>
            <h3 className="text-2xl font-extrabold drop-shadow-sm">{me.name}</h3>
            <p className="text-blue-100 font-medium">{me.designation}</p>
            <div className="flex gap-4 mt-3 text-sm font-semibold">
              <span className="bg-black/20 backdrop-blur-sm px-3 py-1 rounded-full">{me.emp_id}</span>
              <span className="bg-black/20 backdrop-blur-sm px-3 py-1 rounded-full">Joined: {me.joined}</span>
            </div>
          </div>
        </div>
      </GlassCard>

      {/* Quick Links */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        {quickLinks.map((l) => (
          <Link key={l.label} to={l.href}>
            <GlassCard className="text-center hover:-translate-y-1 hover:shadow-lg hover:shadow-indigo-500/10 transition-all cursor-pointer h-full flex flex-col items-center justify-center p-6">
              <div className={`w-14 h-14 rounded-2xl mb-4 flex items-center justify-center text-2xl ${l.color}`}>
                <i className={`fa-solid ${l.icon}`}></i>
              </div>
              <div className="text-sm font-bold text-slate-700 dark:text-slate-200">{l.label}</div>
            </GlassCard>
          </Link>
        ))}
      </div>

      {/* Info Grid */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <GlassCard>
          <h3 className="font-bold text-slate-800 dark:text-slate-200 mb-4 flex items-center gap-2">
            <i className="fa-solid fa-calendar-minus text-blue-500"></i> Leave Balances
          </h3>
          <div className="space-y-4">
            {[{ label: "Casual Leave", remaining: 9, total: 12, color: "bg-blue-500" }, { label: "Sick Leave", remaining: 9, total: 10, color: "bg-rose-500" }, { label: "Paid Leave", remaining: 10, total: 15, color: "bg-emerald-500" }].map((l) => (
              <div key={l.label}>
                <div className="flex justify-between text-sm font-medium text-slate-600 dark:text-slate-400 mb-1.5">
                  <span>{l.label}</span><span className="font-bold text-slate-800 dark:text-slate-200">{l.remaining} left</span>
                </div>
                <div className="w-full h-2 bg-black/5 dark:bg-white/5 rounded-full overflow-hidden">
                  <div className={`h-full ${l.color} rounded-full`} style={{ width: `${(l.remaining / l.total) * 100}%` }}></div>
                </div>
              </div>
            ))}
          </div>
        </GlassCard>

        <GlassCard>
          <h3 className="font-bold text-slate-800 dark:text-slate-200 mb-4 flex items-center gap-2">
            <i className="fa-solid fa-clock-rotate-left text-emerald-500"></i> This Month Attendance
          </h3>
          <div className="grid grid-cols-3 gap-3 text-center">
            {[{ label: "Present", val: 18, color: "text-emerald-600 dark:text-emerald-400" }, { label: "Absent", val: 1, color: "text-rose-500 dark:text-rose-400" }, { label: "WFH", val: 3, color: "text-blue-500 dark:text-blue-400" }].map((s) => (
              <div key={s.label} className="bg-black/5 dark:bg-white/5 rounded-xl p-4">
                <div className={`text-3xl font-extrabold ${s.color}`}>{s.val}</div>
                <div className="text-xs font-semibold text-slate-500 dark:text-slate-400 mt-2 uppercase tracking-wider">{s.label}</div>
              </div>
            ))}
          </div>
        </GlassCard>

        <GlassCard>
          <h3 className="font-bold text-slate-800 dark:text-slate-200 mb-4 flex items-center gap-2">
            <i className="fa-solid fa-list-check text-amber-500"></i> My Tasks
          </h3>
          <div className="space-y-4">
            {[{ label: "Pending", val: 3, color: "text-amber-500 dark:text-amber-400" }, { label: "In Progress", val: 2, color: "text-blue-500 dark:text-blue-400" }, { label: "Completed", val: 8, color: "text-emerald-600 dark:text-emerald-400" }].map((s) => (
              <div key={s.label} className="flex justify-between items-center py-2 border-b border-black/5 dark:border-white/5 last:border-0">
                <span className="text-sm font-semibold text-slate-600 dark:text-slate-400">{s.label}</span>
                <span className={`font-extrabold text-xl ${s.color}`}>{s.val}</span>
              </div>
            ))}
          </div>
        </GlassCard>
      </div>
    </div>
  );
}
