import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";
import { Button } from "@/components/ui/Button";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function PersonalDashboardPage() {
  const [transactions, setTransactions] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/personal`)
      .then(res => res.json())
      .then(data => {
        setTransactions(data);
        setLoading(false);
      })
      .catch(err => {
        console.error(err);
        setLoading(false);
      });
  }, []);

  const handleDelete = async (id) => {
    if (!confirm("Delete transaction?")) return;
    try {
      const res = await fetch(`${API_URL}/api/personal/${id}`, { method: 'DELETE' });
      if (res.ok) setTransactions(transactions.filter(t => t.id !== id));
    } catch (err) {
      console.error(err);
    }
  };

  const income = transactions.filter(t => t.type === 'Income').reduce((sum, t) => sum + Number(t.amount), 0);
  const expenses = transactions.filter(t => t.type === 'Expense').reduce((sum, t) => sum + Number(t.amount), 0);
  const balance = income - expenses;

  return (
    <div className="space-y-6 max-w-5xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-sky-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(14,165,233,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Personal Finance Tracker</h2>
        </div>
        <Link to="/personal/add-transaction">
          <Button variant="primary" className="!bg-gradient-to-r !from-sky-500 !to-indigo-500 !shadow-sky-500/30">
            <i className="fa-solid fa-plus mr-2"></i> Add Transaction
          </Button>
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Current Balance</div>
          <div className="text-4xl font-extrabold text-slate-800 dark:text-slate-100">₹{balance.toLocaleString()}</div>
          <div className="w-full h-1 bg-gradient-to-r from-sky-500 to-indigo-500 rounded-full mt-4"></div>
        </GlassCard>
        <GlassCard className="p-6">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 rounded-full bg-emerald-100 text-emerald-600 dark:bg-emerald-500/20 dark:text-emerald-400 flex items-center justify-center text-xl shrink-0"><i className="fa-solid fa-arrow-down"></i></div>
            <div>
              <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Total Income</div>
              <div className="text-2xl font-extrabold text-emerald-600 dark:text-emerald-400">₹{income.toLocaleString()}</div>
            </div>
          </div>
        </GlassCard>
        <GlassCard className="p-6">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 rounded-full bg-rose-100 text-rose-600 dark:bg-rose-500/20 dark:text-rose-400 flex items-center justify-center text-xl shrink-0"><i className="fa-solid fa-arrow-up"></i></div>
            <div>
              <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Total Expenses</div>
              <div className="text-2xl font-extrabold text-rose-600 dark:text-rose-400">₹{expenses.toLocaleString()}</div>
            </div>
          </div>
        </GlassCard>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="p-6 border-b border-black/5 dark:border-white/10 flex justify-between items-center bg-black/5 dark:bg-white/5">
          <h3 className="font-bold text-slate-800 dark:text-slate-200">Recent Transactions</h3>
          <select className="glass-input-topbar py-1.5 px-3 rounded-lg text-sm font-medium outline-none">
            <option>This Month</option>
            <option>Last Month</option>
            <option>All Time</option>
          </select>
        </div>
        <div className="divide-y divide-black/5 dark:divide-white/10">
          {loading ? (
            <div className="p-8 text-center text-slate-400">Loading...</div>
          ) : transactions.length === 0 ? (
            <div className="p-8 text-center text-slate-400">No transactions found.</div>
          ) : transactions.map(t => (
            <div key={t.id} className="p-4 flex items-center justify-between hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
              <div className="flex items-center gap-4">
                <div className={`w-12 h-12 rounded-xl flex items-center justify-center text-lg ${t.type === 'Income' ? 'bg-emerald-100 text-emerald-600 dark:bg-emerald-500/20 dark:text-emerald-400' : 'bg-rose-100 text-rose-600 dark:bg-rose-500/20 dark:text-rose-400'}`}>
                  <i className={`fa-solid ${t.type === 'Income' ? 'fa-wallet' : 'fa-credit-card'}`}></i>
                </div>
                <div>
                  <div className="font-bold text-slate-800 dark:text-slate-200">{t.category}</div>
                  <div className="text-xs font-semibold text-slate-500 dark:text-slate-400 mt-0.5">{new Date(t.transaction_date).toLocaleDateString()} • {t.note}</div>
                </div>
              </div>
              <div className="flex items-center gap-4">
                <div className={`font-extrabold text-lg ${t.type === 'Income' ? 'text-emerald-600 dark:text-emerald-400' : 'text-slate-800 dark:text-slate-200'}`}>
                  {t.type === 'Income' ? '+' : '-'}₹{Number(t.amount).toLocaleString()}
                </div>
                <button onClick={() => handleDelete(t.id)} className="w-8 h-8 rounded-lg bg-rose-50 text-rose-500 dark:bg-rose-500/10 dark:text-rose-400 flex items-center justify-center opacity-50 hover:opacity-100 transition-all">
                  <i className="fa-solid fa-trash text-sm"></i>
                </button>
              </div>
            </div>
          ))}
        </div>
      </GlassCard>
    </div>
  );
}
