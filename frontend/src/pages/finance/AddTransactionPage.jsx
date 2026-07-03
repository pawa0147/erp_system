import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function AddTransactionPage() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    type: "Income",
    category: "Project Payment",
    amount: "",
    transaction_date: new Date().toISOString().split("T")[0],
    description: "",
    client_id: ""
  });
  const [clients, setClients] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetch(`${API_URL}/api/clients`)
      .then(res => res.json())
      .then(data => setClients(data))
      .catch(err => console.error(err));
  }, []);

  const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await fetch(`${API_URL}/api/finance`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
      });
      if (res.ok) {
        navigate('/finance');
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
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full shadow-[0_0_10px_rgba(16,185,129,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Add Transaction</h2>
        </div>
        <Link to="/finance"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6" onSubmit={handleSubmit}>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Transaction Type</label>
              <select name="type" value={formData.type} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option value="Income" className="text-slate-800 dark:bg-slate-800">Income</option>
                <option value="Expense" className="text-slate-800 dark:bg-slate-800">Expense</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Category</label>
              <select name="category" value={formData.category} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Project Payment</option>
                <option className="text-slate-800 dark:bg-slate-800">Consultation</option>
                <option className="text-slate-800 dark:bg-slate-800">Retainer</option>
                <option className="text-slate-800 dark:bg-slate-800">Salaries</option>
                <option className="text-slate-800 dark:bg-slate-800">Advertising</option>
                <option className="text-slate-800 dark:bg-slate-800">Office Supplies</option>
                <option className="text-slate-800 dark:bg-slate-800">Other</option>
              </select>
            </div>
            <Input label="Amount (₹)" type="number" name="amount" value={formData.amount} onChange={handleChange} placeholder="0.00" required />
            <Input label="Transaction Date" type="date" name="transaction_date" value={formData.transaction_date} onChange={handleChange} required />
          </div>
          
          <Input label="Description" name="description" value={formData.description} onChange={handleChange} placeholder="Brief description of this transaction..." />
          
          <div className="flex flex-col gap-2">
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Linked Client (Optional)</label>
            <select name="client_id" value={formData.client_id} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
              <option value="" className="text-slate-800 dark:bg-slate-800">None</option>
              {clients.map(c => (
                <option key={c.id} value={c.id} className="text-slate-800 dark:bg-slate-800">{c.name}</option>
              ))}
            </select>
          </div>
          
          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/finance"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" disabled={loading}>
              {loading ? "Saving..." : <><i className="fa-solid fa-check"></i> Save Transaction</>}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
