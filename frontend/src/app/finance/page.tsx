import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function FinancePage() {
  const stats = [
    { label: "Income", value: "₹0", sub: "This Month", icon: "fa-arrow-trend-up", color: "text-emerald-600", bg: "bg-emerald-100", border: "border-l-4 border-emerald-500" },
    { label: "Expenses", value: "₹0", sub: "This Month", icon: "fa-arrow-trend-down", color: "text-red-500", bg: "bg-red-100", border: "border-l-4 border-red-500" },
    { label: "Net Profit", value: "₹0", sub: "This Month", icon: "fa-wallet", color: "text-blue-600", bg: "bg-blue-100", border: "border-l-4 border-blue-500" },
  ];

  const recentTxns = [
    { date: "Jun 18", type: "Income", category: "Project Payment", description: "Website project - Acme Corp", amount: 45000 },
    { date: "Jun 15", type: "Expense", category: "Office Supplies", description: "Stationery & misc", amount: 2500 },
    { date: "Jun 12", type: "Income", category: "Consultation", description: "Strategy session - Globex", amount: 15000 },
    { date: "Jun 10", type: "Expense", category: "Advertising", description: "Google Ads campaign", amount: 8000 },
    { date: "Jun 05", type: "Income", category: "Retainer", description: "Monthly retainer - TechCo", amount: 30000 },
  ];

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full"></div>
          <div>
            <h2 className="text-2xl font-extrabold text-slate-800">Financial Overview</h2>
            <p className="text-sm text-slate-500">Showing data for: <strong>This Month</strong></p>
          </div>
        </div>
        <div className="flex gap-3">
          <Link href="/finance/transactions"><Button variant="secondary"><i className="fa-solid fa-list"></i> History</Button></Link>
          <Link href="/finance/add-transaction"><Button variant="primary"><i className="fa-solid fa-plus"></i> Add New</Button></Link>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {stats.map((s) => (
          <GlassCard key={s.label} className={s.border}>
            <div className="flex items-center justify-between">
              <div>
                <div className="text-sm font-bold text-slate-500 mb-1">{s.label}</div>
                <div className="text-3xl font-extrabold text-slate-800">{s.value}</div>
                <div className="text-xs text-slate-400 mt-1">{s.sub}</div>
              </div>
              <div className={`w-14 h-14 rounded-2xl flex items-center justify-center text-2xl ${s.bg} ${s.color}`}>
                <i className={`fa-solid ${s.icon}`}></i>
              </div>
            </div>
          </GlassCard>
        ))}
      </div>

      {/* Charts placeholder */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <GlassCard>
          <h3 className="font-bold text-slate-700 mb-4">Income vs Expense (Last 6 Months)</h3>
          <div className="flex items-end gap-3 h-40">
            {["Jan", "Feb", "Mar", "Apr", "May", "Jun"].map((m, i) => (
              <div key={m} className="flex-1 flex flex-col items-center gap-1">
                <div className="w-full flex gap-0.5 items-end justify-center h-32">
                  <div className="w-1/2 bg-emerald-400 rounded-t-sm opacity-80" style={{ height: `${20 + i * 10}%` }}></div>
                  <div className="w-1/2 bg-red-400 rounded-t-sm opacity-80" style={{ height: `${15 + i * 6}%` }}></div>
                </div>
                <div className="text-xs text-slate-400 font-medium">{m}</div>
              </div>
            ))}
          </div>
          <div className="flex gap-4 mt-3 text-xs text-slate-500">
            <span className="flex items-center gap-1"><span className="w-3 h-3 bg-emerald-400 rounded"></span>Income</span>
            <span className="flex items-center gap-1"><span className="w-3 h-3 bg-red-400 rounded"></span>Expense</span>
          </div>
        </GlassCard>
        <GlassCard>
          <h3 className="font-bold text-slate-700 mb-4">Expense Breakdown</h3>
          <div className="space-y-3">
            {[{ label: "Advertising", pct: 40, color: "bg-purple-500" }, { label: "Office", pct: 20, color: "bg-blue-500" }, { label: "Salaries", pct: 30, color: "bg-emerald-500" }, { label: "Other", pct: 10, color: "bg-slate-400" }].map((c) => (
              <div key={c.label}>
                <div className="flex justify-between text-sm text-slate-600 mb-1">
                  <span>{c.label}</span><span>{c.pct}%</span>
                </div>
                <div className="w-full h-2 bg-slate-100 rounded-full overflow-hidden">
                  <div className={`h-full ${c.color} rounded-full`} style={{ width: `${c.pct}%` }}></div>
                </div>
              </div>
            ))}
          </div>
        </GlassCard>
      </div>

      {/* Recent Transactions */}
      <div>
        <div className="flex justify-between items-center mb-4">
          <h3 className="font-bold text-slate-800 text-lg">Recent Transactions</h3>
          <Link href="/finance/transactions" className="text-sm text-blue-500 hover:underline">View All <i className="fa-solid fa-arrow-right text-xs"></i></Link>
        </div>
        <GlassCard className="p-0 overflow-hidden">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Date</th>
                <th className="px-6 py-4">Type</th>
                <th className="px-6 py-4">Category</th>
                <th className="px-6 py-4">Description</th>
                <th className="px-6 py-4">Amount</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {recentTxns.map((txn, i) => (
                <tr key={i} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4 text-sm text-slate-600">{txn.date}</td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${txn.type === "Income" ? "bg-emerald-100 text-emerald-700" : "bg-red-100 text-red-600"}`}>{txn.type}</span>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600">{txn.category}</td>
                  <td className="px-6 py-4 text-sm text-slate-500">{txn.description}</td>
                  <td className={`px-6 py-4 font-bold ${txn.type === "Income" ? "text-emerald-600" : "text-red-500"}`}>
                    {txn.type === "Income" ? "+" : "-"} ₹{txn.amount.toLocaleString()}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </GlassCard>
      </div>
    </div>
  );
}