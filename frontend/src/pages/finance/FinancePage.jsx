import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function FinancePage() {
  const [recentTxns, setRecentTxns] = useState([]);
  const [stats, setStats] = useState([
    { label: "Income", value: "₹0", sub: "This Month", icon: "fa-arrow-trend-up", color: "text-emerald-600 dark:text-emerald-400", bg: "bg-emerald-100 dark:bg-emerald-500/10", border: "border-l-4 border-emerald-500" },
    { label: "Expenses", value: "₹0", sub: "This Month", icon: "fa-arrow-trend-down", color: "text-red-500 dark:text-red-400", bg: "bg-red-100 dark:bg-red-500/10", border: "border-l-4 border-red-500" },
    { label: "Net Profit", value: "₹0", sub: "This Month", icon: "fa-wallet", color: "text-blue-600 dark:text-blue-400", bg: "bg-blue-100 dark:bg-blue-500/10", border: "border-l-4 border-blue-500" },
  ]);

  useEffect(() => {
    fetch(`${API_URL}/api/finance`)
      .then(res => res.ok ? res.json() : [])
      .then(data => {
        setRecentTxns(data.slice(0, 5)); // Just taking the most recent 5
        let income = 0;
        let expense = 0;
        const currentMonth = new Date().getMonth();
        data.forEach(txn => {
            const txnDate = new Date(txn.transaction_date);
            if(txnDate.getMonth() === currentMonth) {
                if(txn.type === 'Income') income += Number(txn.amount);
                if(txn.type === 'Expense') expense += Number(txn.amount);
            }
        });
        
        setStats([
            { label: "Income", value: `₹${income.toLocaleString()}`, sub: "This Month", icon: "fa-arrow-trend-up", color: "text-emerald-600 dark:text-emerald-400", bg: "bg-emerald-100 dark:bg-emerald-500/10", border: "border-l-4 border-emerald-500" },
            { label: "Expenses", value: `₹${expense.toLocaleString()}`, sub: "This Month", icon: "fa-arrow-trend-down", color: "text-red-500 dark:text-red-400", bg: "bg-red-100 dark:bg-red-500/10", border: "border-l-4 border-red-500" },
            { label: "Net Profit", value: `₹${(income - expense).toLocaleString()}`, sub: "This Month", icon: "fa-wallet", color: "text-blue-600 dark:text-blue-400", bg: "bg-blue-100 dark:bg-blue-500/10", border: "border-l-4 border-blue-500" },
        ]);
      })
      .catch(err => console.error(err));
  }, []);

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full"></div>
          <div>
            <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Financial Overview</h2>
            <p className="text-sm text-slate-500 dark:text-slate-400">Showing data for: <strong>This Month</strong></p>
          </div>
        </div>
        <div className="flex gap-3">
          <Link to="/finance/transactions"><Button variant="secondary"><i className="fa-solid fa-list"></i> History</Button></Link>
          <Link to="/finance/add-transaction"><Button variant="primary"><i className="fa-solid fa-plus"></i> Add New</Button></Link>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {stats.map((s) => (
          <GlassCard key={s.label} className={s.border}>
            <div className="flex items-center justify-between">
              <div>
                <div className="text-sm font-bold text-slate-500 dark:text-slate-400 mb-1">{s.label}</div>
                <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{s.value}</div>
                <div className="text-xs text-slate-400 dark:text-slate-500 mt-1">{s.sub}</div>
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
          <h3 className="font-bold text-slate-700 dark:text-slate-300 mb-4">Income vs Expense (Last 6 Months)</h3>
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
          <div className="flex gap-4 mt-3 text-xs text-slate-500 dark:text-slate-400">
            <span className="flex items-center gap-1"><span className="w-3 h-3 bg-emerald-400 rounded"></span>Income</span>
            <span className="flex items-center gap-1"><span className="w-3 h-3 bg-red-400 rounded"></span>Expense</span>
          </div>
        </GlassCard>
        <GlassCard>
          <h3 className="font-bold text-slate-700 dark:text-slate-300 mb-4">Expense Breakdown</h3>
          <div className="space-y-3">
            {[{ label: "Advertising", pct: 40, color: "bg-purple-500" }, { label: "Office", pct: 20, color: "bg-blue-500" }, { label: "Salaries", pct: 30, color: "bg-emerald-500" }, { label: "Other", pct: 10, color: "bg-slate-400" }].map((c) => (
              <div key={c.label}>
                <div className="flex justify-between text-sm text-slate-600 dark:text-slate-400 mb-1">
                  <span>{c.label}</span><span>{c.pct}%</span>
                </div>
                <div className="w-full h-2 bg-slate-100 dark:bg-white/10 rounded-full overflow-hidden">
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
          <h3 className="font-bold text-slate-800 dark:text-slate-100 text-lg">Recent Transactions</h3>
          <Link to="/finance/transactions" className="text-sm text-blue-500 hover:underline">View All <i className="fa-solid fa-arrow-right text-xs"></i></Link>
        </div>
        <GlassCard className="p-0 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-slate-50 dark:bg-white/5 border-b border-slate-200 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                  <th className="px-6 py-4">Date</th>
                  <th className="px-6 py-4">Type</th>
                  <th className="px-6 py-4">Category</th>
                  <th className="px-6 py-4">Description</th>
                  <th className="px-6 py-4">Amount</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100 dark:divide-white/5">
                {recentTxns.map((txn, i) => (
                  <tr key={i} className="hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                    <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">{new Date(txn.transaction_date).toLocaleDateString()}</td>
                    <td className="px-6 py-4">
                      <span className={`px-3 py-1 rounded-full text-xs font-bold ${txn.type === "Income" ? "bg-emerald-100 dark:bg-emerald-500/20 text-emerald-700 dark:text-emerald-400" : "bg-red-100 dark:bg-red-500/20 text-red-600 dark:text-red-400"}`}>{txn.type}</span>
                    </td>
                    <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-300">{txn.category}</td>
                    <td className="px-6 py-4 text-sm text-slate-500 dark:text-slate-400">{txn.description}</td>
                    <td className={`px-6 py-4 font-bold ${txn.type === "Income" ? "text-emerald-600 dark:text-emerald-500" : "text-red-500 dark:text-red-400"}`}>
                      {txn.type === "Income" ? "+" : "-"} ₹{Number(txn.amount).toLocaleString()}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </GlassCard>
      </div>
    </div>
  );
}
