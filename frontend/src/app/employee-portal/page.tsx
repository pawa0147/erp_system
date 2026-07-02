import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function EmployeePortalPage() {
  const me = { name: "Amit Sharma", designation: "Senior Developer", emp_id: "EMP-0001", joined: "Jan 15, 2023", email: "amit@webworks.com", salary: 85000 };

  const quickLinks = [
    { label: "Apply Leave", icon: "fa-calendar-minus", href: "/hr/leaves", color: "bg-blue-100 text-blue-600" },
    { label: "Attendance Log", icon: "fa-clock", href: "/hr/attendance", color: "bg-emerald-100 text-emerald-600" },
    { label: "My Payslips", icon: "fa-money-bill-wave", href: "/hr/payroll", color: "bg-purple-100 text-purple-600" },
    { label: "My Tasks", icon: "fa-list-check", href: "/tasks", color: "bg-amber-100 text-amber-600" },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center gap-4 mb-8">
        <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
        <h2 className="text-2xl font-extrabold text-slate-800">Employee Self-Service Portal</h2>
      </div>

      {/* Profile Card */}
      <GlassCard className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white border-0">
        <div className="flex items-center gap-6">
          <div className="w-20 h-20 rounded-2xl bg-white/20 flex items-center justify-center text-4xl font-extrabold">{me.name.charAt(0)}</div>
          <div>
            <h3 className="text-2xl font-extrabold">{me.name}</h3>
            <p className="text-blue-200">{me.designation}</p>
            <div className="flex gap-4 mt-2 text-sm">
              <span className="bg-white/20 px-3 py-1 rounded-full">{me.emp_id}</span>
              <span className="bg-white/20 px-3 py-1 rounded-full">Joined: {me.joined}</span>
            </div>
          </div>
        </div>
      </GlassCard>

      {/* Quick Links */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        {quickLinks.map((l) => (
          <Link key={l.label} href={l.href}>
            <GlassCard className="text-center hover:-translate-y-1 hover:shadow-lg transition-all cursor-pointer">
              <div className={`w-12 h-12 rounded-xl mx-auto mb-3 flex items-center justify-center text-xl ${l.color}`}>
                <i className={`fa-solid ${l.icon}`}></i>
              </div>
              <div className="text-sm font-semibold text-slate-700">{l.label}</div>
            </GlassCard>
          </Link>
        ))}
      </div>

      {/* Info Grid */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <GlassCard>
          <h3 className="font-bold text-slate-700 mb-3">Leave Balances</h3>
          <div className="space-y-3">
            {[{ label: "Casual Leave", remaining: 9, total: 12, color: "bg-blue-500" }, { label: "Sick Leave", remaining: 9, total: 10, color: "bg-red-500" }, { label: "Paid Leave", remaining: 10, total: 15, color: "bg-emerald-500" }].map((l) => (
              <div key={l.label}>
                <div className="flex justify-between text-sm text-slate-600 mb-1">
                  <span>{l.label}</span><span className="font-bold">{l.remaining} left</span>
                </div>
                <div className="w-full h-1.5 bg-slate-100 rounded-full overflow-hidden">
                  <div className={`h-full ${l.color} rounded-full`} style={{ width: `${(l.remaining / l.total) * 100}%` }}></div>
                </div>
              </div>
            ))}
          </div>
        </GlassCard>

        <GlassCard>
          <h3 className="font-bold text-slate-700 mb-3">This Month Attendance</h3>
          <div className="grid grid-cols-3 gap-3 text-center">
            {[{ label: "Present", val: 18, color: "text-emerald-600" }, { label: "Absent", val: 1, color: "text-red-500" }, { label: "WFH", val: 3, color: "text-blue-500" }].map((s) => (
              <div key={s.label} className="bg-slate-50 rounded-xl p-3">
                <div className={`text-2xl font-extrabold ${s.color}`}>{s.val}</div>
                <div className="text-xs text-slate-400 mt-1">{s.label}</div>
              </div>
            ))}
          </div>
        </GlassCard>

        <GlassCard>
          <h3 className="font-bold text-slate-700 mb-3">My Tasks Summary</h3>
          <div className="space-y-3">
            {[{ label: "Pending", val: 3, color: "text-amber-500" }, { label: "In Progress", val: 2, color: "text-blue-500" }, { label: "Completed", val: 8, color: "text-emerald-600" }].map((s) => (
              <div key={s.label} className="flex justify-between items-center">
                <span className="text-sm text-slate-600">{s.label}</span>
                <span className={`font-bold text-lg ${s.color}`}>{s.val}</span>
              </div>
            ))}
          </div>
        </GlassCard>
      </div>
    </div>
  );
}