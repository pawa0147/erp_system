import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function FinancialReportsPage() {
  return (
    <div className="space-y-6 max-w-6xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full shadow-[0_0_10px_rgba(16,185,129,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Financial Reports</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/finance"><button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors" onClick={() => alert('Feature coming soon!')}><i className="fa-solid fa-arrow-left mr-2"></i> Back to Finance</button></Link>
          <button className="px-4 py-2 rounded-xl bg-emerald-500 text-white font-semibold hover:bg-emerald-600 shadow-lg shadow-emerald-500/30 transition-all" onClick={() => alert('Feature coming soon!')}><i className="fa-solid fa-download mr-2"></i> Download Full Report</button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <GlassCard className="p-5">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Total Revenue (YTD)</div>
          <div className="text-3xl font-extrabold text-emerald-600 dark:text-emerald-400">₹24.5M</div>
          <div className="text-xs font-bold text-emerald-500 mt-2"><i className="fa-solid fa-arrow-trend-up mr-1"></i> +12.5% vs last year</div>
        </GlassCard>
        <GlassCard className="p-5">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Total Expenses (YTD)</div>
          <div className="text-3xl font-extrabold text-rose-500 dark:text-rose-400">₹8.2M</div>
          <div className="text-xs font-bold text-rose-500 mt-2"><i className="fa-solid fa-arrow-trend-up mr-1"></i> +4.1% vs last year</div>
        </GlassCard>
        <GlassCard className="p-5">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Net Profit Margin</div>
          <div className="text-3xl font-extrabold text-blue-600 dark:text-blue-400">66.5%</div>
          <div className="text-xs font-bold text-emerald-500 mt-2"><i className="fa-solid fa-arrow-trend-up mr-1"></i> +2.3% vs last year</div>
        </GlassCard>
        <GlassCard className="p-5">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Outstanding Receivables</div>
          <div className="text-3xl font-extrabold text-amber-500 dark:text-amber-400">₹1.4M</div>
          <div className="text-xs font-bold text-slate-500 dark:text-slate-400 mt-2">Across 18 invoices</div>
        </GlassCard>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <GlassCard>
          <div className="flex justify-between items-center mb-6">
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200">Revenue Breakdown</h3>
            <select className="glass-input-topbar py-1 px-3 rounded-lg text-sm font-medium outline-none">
              <option>2025</option>
              <option>2024</option>
            </select>
          </div>
          <div className="space-y-4">
            {[
              { label: "Software Development Projects", val: "₹15,200,000", pct: 62, color: "bg-blue-500" },
              { label: "Design Services", val: "₹5,400,000", pct: 22, color: "bg-purple-500" },
              { label: "Consulting Retainers", val: "₹2,500,000", pct: 10, color: "bg-emerald-500" },
              { label: "Maintenance & Support", val: "₹1,400,000", pct: 6, color: "bg-amber-500" },
            ].map(item => (
              <div key={item.label}>
                <div className="flex justify-between text-sm font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                  <span>{item.label}</span><span>{item.val} ({item.pct}%)</span>
                </div>
                <div className="w-full h-2.5 bg-black/5 dark:bg-white/5 rounded-full overflow-hidden">
                  <div className={`h-full ${item.color} rounded-full`} style={{ width: `${item.pct}%` }}></div>
                </div>
              </div>
            ))}
          </div>
        </GlassCard>

        <GlassCard>
          <div className="flex justify-between items-center mb-6">
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200">Expense Breakdown</h3>
            <select className="glass-input-topbar py-1 px-3 rounded-lg text-sm font-medium outline-none">
              <option>2025</option>
              <option>2024</option>
            </select>
          </div>
          <div className="space-y-4">
            {[
              { label: "Employee Salaries & Benefits", val: "₹5,500,000", pct: 67, color: "bg-rose-500" },
              { label: "Software Subscriptions & Cloud", val: "₹1,200,000", pct: 15, color: "bg-indigo-500" },
              { label: "Marketing & Advertising", val: "₹800,000", pct: 10, color: "bg-orange-500" },
              { label: "Office & Operations", val: "₹700,000", pct: 8, color: "bg-slate-500" },
            ].map(item => (
              <div key={item.label}>
                <div className="flex justify-between text-sm font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                  <span>{item.label}</span><span>{item.val} ({item.pct}%)</span>
                </div>
                <div className="w-full h-2.5 bg-black/5 dark:bg-white/5 rounded-full overflow-hidden">
                  <div className={`h-full ${item.color} rounded-full`} style={{ width: `${item.pct}%` }}></div>
                </div>
              </div>
            ))}
          </div>
        </GlassCard>
      </div>
    </div>
  );
}
