import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function AddPersonalTransactionPage() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    type: "Expense",
    category: "Food & Dining",
    amount: "",
    transaction_date: new Date().toISOString().split("T")[0],
    note: "",
    user_id: 1 // Default user for personal tracker
  });

  const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await fetch(`${API_URL}/api/personal`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
      });
      if (res.ok) {
        navigate('/personal');
      } else {
        alert("Failed to add transaction");
      }
    } catch (err) {
      console.error(err);
      alert("Error adding transaction");
    } finally {
      setLoading(false);
    }
  };
  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-sky-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(14,165,233,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Add Personal Transaction</h2>
        </div>
        <Link to="/personal">
          <Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-6" onSubmit={handleSubmit}>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Transaction Type</label>
              <select name="type" value={formData.type} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option value="Expense" className="text-slate-800 dark:bg-slate-800">Expense</option>
                <option value="Income" className="text-slate-800 dark:bg-slate-800">Income</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Category</label>
              <select name="category" value={formData.category} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Food & Dining</option>
                <option className="text-slate-800 dark:bg-slate-800">Transport</option>
                <option className="text-slate-800 dark:bg-slate-800">Shopping</option>
                <option className="text-slate-800 dark:bg-slate-800">Bills & Utilities</option>
                <option className="text-slate-800 dark:bg-slate-800">Entertainment</option>
                <option className="text-slate-800 dark:bg-slate-800">Salary/Income</option>
                <option className="text-slate-800 dark:bg-slate-800">Other</option>
              </select>
            </div>
            <Input label="Amount (₹)" name="amount" value={formData.amount} onChange={handleChange} type="number" placeholder="0.00" required />
            <Input label="Date" name="transaction_date" value={formData.transaction_date} onChange={handleChange} type="date" required />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Note / Description</label>
            <textarea rows={3} name="note" value={formData.note} onChange={handleChange} placeholder="What was this transaction for?"
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/personal"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" disabled={loading} className="!bg-gradient-to-r !from-sky-500 !to-indigo-500 !shadow-sky-500/30">
              {loading ? "Saving..." : <><i className="fa-solid fa-check"></i> Save Transaction</>}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
