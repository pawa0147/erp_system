import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

function DeleteButton({ id, type, onDelete }) {
  const [loading, setLoading] = useState(false);

  async function handleDelete() {
    if (!window.confirm(`Are you sure you want to delete this ${type}?`)) return;
    setLoading(true);
    try {
      const endpoint = type === 'bill' ? 'bills' : 'quotes';
      const res = await fetch(`${API_URL}/api/${endpoint}/${id}`, { method: 'DELETE' });
      if (res.ok) {
        onDelete(id, type);
      } else {
        console.error(`Failed to delete ${type}`);
      }
    } catch (err) {
      console.error(err);
    }
    setLoading(false);
  }

  return (
    <button
      onClick={handleDelete}
      disabled={loading}
      className="w-8 h-8 rounded-lg bg-rose-50 dark:bg-rose-500/10 text-rose-600 dark:text-rose-400 hover:bg-rose-100 dark:hover:bg-rose-500/20 transition-colors flex items-center justify-center disabled:opacity-50"
      title={`Delete ${type}`}
    >
      <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-trash"}></i>
    </button>
  );
}

export default function BillsListPage() {
  const [bills, setBills] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/bills`)
      .then(res => res.json())
      .then(data => {
        setBills(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch bills:', err);
        setLoading(false);
      });
  }, []);

  function handleDelete(id, type) {
    setBills(prev => prev.filter(b => b.id !== id));
  }

  if (loading) {
    return <div className="p-8 text-center text-slate-500"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>;
  }

  return (
    <div className="space-y-6 max-w-7xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">All Bills</h2>
        </div>
        <Link to="/billing">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to Dashboard
          </Button>
        </Link>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 dark:bg-slate-800/50 border-b border-slate-100 dark:border-slate-700/50 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">ID</th>
                <th className="px-6 py-4">Client Name</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Date</th>
                <th className="px-6 py-4">Amount</th>
                <th className="px-6 py-4 text-center">Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-slate-700/50">
              {bills.map((bill) => (
                <tr key={bill.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-800/30 transition-colors">
                  <td className="px-6 py-4 text-sm font-semibold text-slate-500 dark:text-slate-400">INV-{String(bill.id).padStart(3, '0')}</td>
                  <td className="px-6 py-4 text-sm">
                    <div className="font-bold text-slate-800 dark:text-slate-200">{bill.client_name}</div>
                    {bill.client_email && <div className="text-xs text-slate-500">{bill.client_email}</div>}
                  </td>
                  <td className="px-6 py-4">
                    <span className="text-xs font-extrabold uppercase text-slate-800 dark:text-slate-200">
                      {bill.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">
                    {bill.bill_date ? new Date(bill.bill_date).toLocaleDateString() : "N/A"}
                  </td>
                  <td className="px-6 py-4 text-sm font-bold text-slate-800 dark:text-slate-200">
                    ₹{Number(bill.total_amount || 0).toLocaleString(undefined, {minimumFractionDigits: 2})}
                  </td>
                  <td className="px-6 py-4 flex justify-center gap-2">
                    <Link to={`/billing/view/${bill.id}?type=bill`} className="w-8 h-8 rounded-lg bg-black/5 dark:bg-white/5 text-slate-600 dark:text-slate-300 hover:bg-black/10 dark:hover:bg-white/10 transition-colors flex items-center justify-center">
                      <i className="fa-solid fa-eye text-xs"></i>
                    </Link>
                    <Link to={`/billing/add?type=bill&id=${bill.id}`} className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-500/10 text-indigo-600 dark:text-indigo-400 hover:bg-indigo-100 dark:hover:bg-indigo-500/20 transition-colors flex items-center justify-center">
                      <i className="fa-solid fa-pen text-xs"></i>
                    </Link>
                    <DeleteButton id={bill.id} type="bill" onDelete={handleDelete} />
                  </td>
                </tr>
              ))}
              {bills.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-8 text-center text-sm text-slate-500 dark:text-slate-400">No bills found.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
