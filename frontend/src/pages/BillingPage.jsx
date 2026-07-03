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

export default function BillingPage() {
  const [bills, setBills] = useState([]);
  const [quotes, setQuotes] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([
      fetch(`${API_URL}/api/bills`).then(res => res.ok ? res.json() : []),
      fetch(`${API_URL}/api/quotes`).then(res => res.ok ? res.json() : [])
    ])
    .then(([billsData, quotesData]) => {
      setBills(billsData);
      setQuotes(quotesData);
      setLoading(false);
    })
    .catch(err => {
      console.error('Failed to fetch billing data:', err);
      setLoading(false);
    });
  }, []);

  const handleDeleteSuccess = (id, type) => {
    if (type === 'bill') {
      setBills(bills.filter(b => b.id !== id));
    } else {
      setQuotes(quotes.filter(q => q.id !== id));
    }
  };

  if (loading) {
    return <div className="p-8 text-center text-slate-500"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>;
  }

  return (
    <div className="space-y-8 max-w-7xl mx-auto">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-blue-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Dashboard</h2>
        </div>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <GlassCard className="p-6 flex justify-between items-start">
          <div>
            <div className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-4">Total Quotations</div>
            <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{quotes.length}</div>
          </div>
          <div className="w-12 h-12 rounded-2xl bg-slate-100 dark:bg-slate-800/50 flex items-center justify-center text-slate-600 dark:text-slate-400">
            <i className="fa-solid fa-file-invoice text-xl"></i>
          </div>
        </GlassCard>
        
        <GlassCard className="p-6 flex justify-between items-start">
          <div>
            <div className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-4">Total Bills Generate</div>
            <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{bills.length}</div>
          </div>
          <div className="w-12 h-12 rounded-2xl bg-slate-100 dark:bg-slate-800/50 flex items-center justify-center text-slate-600 dark:text-slate-400">
            <i className="fa-solid fa-file-invoice-dollar text-xl"></i>
          </div>
        </GlassCard>

        <GlassCard className="p-6 flex justify-between items-start">
          <div>
            <div className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-4">Pending Payment</div>
            <div className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">
              ₹{bills.filter(b => String(b.status || "").toLowerCase() === "unpaid").reduce((sum, b) => sum + Number(b.total_amount || 0), 0).toLocaleString(undefined, {minimumFractionDigits: 2})}
            </div>
          </div>
          <div className="w-12 h-12 rounded-2xl bg-rose-100 dark:bg-rose-500/20 flex items-center justify-center text-rose-500">
            <i className="fa-solid fa-clock text-xl"></i>
          </div>
        </GlassCard>

        <GlassCard className="p-6 flex justify-between items-start">
          <div>
            <div className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-4">Total Revenue</div>
            <div className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">
              ₹{bills.filter(b => String(b.status || "").toLowerCase() === "paid").reduce((sum, b) => sum + Number(b.total_amount || 0), 0).toLocaleString(undefined, {minimumFractionDigits: 2})}
            </div>
          </div>
          <div className="w-12 h-12 rounded-2xl bg-emerald-100 dark:bg-emerald-500/20 flex items-center justify-center text-emerald-500">
            <i className="fa-solid fa-coins text-xl"></i>
          </div>
        </GlassCard>
      </div>

      <div className="space-y-4">
        <h3 className="text-xl font-bold text-slate-800 dark:text-slate-200 border-l-4 border-indigo-500 pl-3">Recent Actions</h3>
        <div className="flex flex-wrap gap-4">
          <Link to="/billing/add?type=quote">
            <Button variant="primary" className="!bg-indigo-500 hover:!bg-indigo-600 !shadow-indigo-500/30">
              <i className="fa-solid fa-plus mr-2"></i> Create Quotation
            </Button>
          </Link>
          <Link to="/billing/add?type=bill">
            <Button variant="primary" className="!bg-indigo-500 hover:!bg-indigo-600 !shadow-indigo-500/30">
              <i className="fa-solid fa-plus mr-2"></i> Create Bill
            </Button>
          </Link>
          <Link to="/billing/quotes">
            <Button variant="secondary" className="!bg-white dark:!bg-slate-800 !border-slate-200 dark:!border-slate-700">
              <i className="fa-solid fa-list mr-2"></i> All Quotes
            </Button>
          </Link>
          <Link to="/billing/bills">
            <Button variant="secondary" className="!bg-white dark:!bg-slate-800 !border-slate-200 dark:!border-slate-700">
              <i className="fa-solid fa-list mr-2"></i> All Bills
            </Button>
          </Link>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        {/* Recent Quotations Table */}
        <div className="space-y-4">
          <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 border-l-4 border-indigo-500 pl-3">
            Recent Quotations
          </h3>
          <GlassCard className="p-0 overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-slate-50 dark:bg-slate-800/50 border-b border-slate-100 dark:border-slate-700/50 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                    <th className="px-4 py-4">ID</th>
                    <th className="px-4 py-4">Client</th>
                    <th className="px-4 py-4">Date</th>
                    <th className="px-4 py-4">Amount</th>
                    <th className="px-4 py-4 text-center">Action</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 dark:divide-slate-700/50">
                  {quotes.slice(0, 5).map((quote) => (
                    <tr key={quote.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-800/30 transition-colors">
                      <td className="px-4 py-4 text-sm font-semibold text-slate-500 dark:text-slate-400">Q-{String(quote.id).padStart(3, '0')}</td>
                      <td className="px-4 py-4 text-sm">
                        <div className="font-bold text-slate-800 dark:text-slate-200 truncate max-w-[120px]">{quote.client_name}</div>
                      </td>
                      <td className="px-4 py-4 text-sm text-slate-600 dark:text-slate-400">
                        {quote.quotation_date ? new Date(quote.quotation_date).toLocaleDateString('en-US', {month: 'short', day: 'numeric'}) : "N/A"}
                      </td>
                      <td className="px-4 py-4 text-sm font-bold text-slate-800 dark:text-slate-200">
                        ₹{Number(quote.total_amount || 0).toLocaleString(undefined, {minimumFractionDigits: 2})}
                      </td>
                      <td className="px-4 py-4 flex justify-center">
                        <Link to={`/billing/view/${quote.id}?type=quote`} className="w-8 h-8 rounded-lg bg-black/5 dark:bg-white/5 text-slate-600 dark:text-slate-300 hover:bg-black/10 dark:hover:bg-white/10 transition-colors flex items-center justify-center">
                          <i className="fa-solid fa-eye text-xs"></i>
                        </Link>
                      </td>
                    </tr>
                  ))}
                  {quotes.length === 0 && (
                    <tr>
                      <td colSpan={5} className="px-6 py-8 text-center text-sm text-slate-500 dark:text-slate-400">No quotations found.</td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </GlassCard>
        </div>

        {/* Recent Bills Table */}
        <div className="space-y-4">
          <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 border-l-4 border-indigo-500 pl-3">
            Recent Bills
          </h3>
          <GlassCard className="p-0 overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-slate-50 dark:bg-slate-800/50 border-b border-slate-100 dark:border-slate-700/50 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                    <th className="px-4 py-4">ID</th>
                    <th className="px-4 py-4">Client</th>
                    <th className="px-4 py-4">Status</th>
                    <th className="px-4 py-4">Amount</th>
                    <th className="px-4 py-4 text-center">Action</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 dark:divide-slate-700/50">
                  {bills.slice(0, 5).map((bill) => (
                    <tr key={bill.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-800/30 transition-colors">
                      <td className="px-4 py-4 text-sm font-semibold text-slate-500 dark:text-slate-400">INV-{String(bill.id).padStart(3, '0')}</td>
                      <td className="px-4 py-4 text-sm">
                        <div className="font-bold text-slate-800 dark:text-slate-200 truncate max-w-[120px]">{bill.client_name}</div>
                      </td>
                      <td className="px-4 py-4">
                        <span className="text-xs font-extrabold uppercase text-slate-800 dark:text-slate-200">
                          {bill.status}
                        </span>
                      </td>
                      <td className="px-4 py-4 text-sm font-bold text-slate-800 dark:text-slate-200">
                        ₹{Number(bill.total_amount || 0).toLocaleString(undefined, {minimumFractionDigits: 2})}
                      </td>
                      <td className="px-4 py-4 flex justify-center">
                        <Link to={`/billing/view/${bill.id}?type=bill`} className="w-8 h-8 rounded-lg bg-black/5 dark:bg-white/5 text-slate-600 dark:text-slate-300 hover:bg-black/10 dark:hover:bg-white/10 transition-colors flex items-center justify-center">
                          <i className="fa-solid fa-eye text-xs"></i>
                        </Link>
                      </td>
                    </tr>
                  ))}
                  {bills.length === 0 && (
                    <tr>
                      <td colSpan={5} className="px-6 py-8 text-center text-sm text-slate-500 dark:text-slate-400">No bills found.</td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </GlassCard>
        </div>
      </div>

    </div>
  );
}
