import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function CreateMouPage() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    party_a: "Webwork Studios",
    party_b: "",
    effective_date: new Date().toISOString().split("T")[0],
    expiry_date: "",
    status: "draft",
    terms: ""
  });

  const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    
    try {
      const res = await fetch(`${API_URL}/api/documents/mous`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
      });
      if (res.ok) {
        navigate('/certificates');
      } else {
        alert("Failed to create MoU");
      }
    } catch (err) {
      console.error(err);
      alert("Error creating MoU");
    } finally {
      setLoading(false);
    }
  };
  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Create MoU</h2>
        </div>
        <Link to="/certificates">
          <Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-8" onSubmit={handleSubmit}>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input label="Party A (Our Company)" name="party_a" value={formData.party_a} onChange={handleChange} />
            <Input label="Party B (Partner/Institution) *" name="party_b" value={formData.party_b} onChange={handleChange} placeholder="e.g. ABC University" required />
            
            <Input label="Effective Date *" name="effective_date" value={formData.effective_date} onChange={handleChange} type="date" required />
            <Input label="Expiry Date *" name="expiry_date" value={formData.expiry_date} onChange={handleChange} type="date" required />
            
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">MoU Status</label>
              <select name="status" value={formData.status} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800" value="draft">Draft</option>
                <option className="text-slate-800 dark:bg-slate-800" value="active">Active</option>
                <option className="text-slate-800 dark:bg-slate-800" value="expired">Expired</option>
              </select>
            </div>
            
            <Input label="Signatory Email" type="email" placeholder="signatory@partner.com" />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">MoU Details & Terms</label>
            <textarea rows={6} name="terms" value={formData.terms} onChange={handleChange} placeholder="Enter the key terms, scope of work, and mutual agreements..."
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/certificates"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" disabled={loading} className="!bg-gradient-to-r !from-blue-500 !to-indigo-500 !shadow-blue-500/30">
              {loading ? "Generating..." : <><i className="fa-solid fa-handshake"></i> Generate MoU</>}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
