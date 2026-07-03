import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function CreateCertificatePage() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    recipient_name: "",
    recipient_email: "",
    type: "",
    issue_date: new Date().toISOString().split("T")[0],
    description: ""
  });

  const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    
    // Auto-generate a dummy certificate ID based on timestamp
    const cert_id = `CERT-${new Date().getFullYear()}-${Math.floor(1000 + Math.random() * 9000)}`;
    const payload = { ...formData, cert_id, issued_by: 1 };

    try {
      const res = await fetch(`${API_URL}/api/certificates`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (res.ok) {
        navigate('/certificates');
      } else {
        alert("Failed to issue certificate");
      }
    } catch (err) {
      console.error(err);
      alert("Error issuing certificate");
    } finally {
      setLoading(false);
    }
  };
  return (
    <div className="space-y-6 max-w-3xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full shadow-[0_0_10px_rgba(59,130,246,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Issue Certificate</h2>
        </div>
        <Link to="/certificates">
          <Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-6" onSubmit={handleSubmit}>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Certificate Type *</label>
              <select name="type" value={formData.type} onChange={handleChange} required className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option value="" className="text-slate-800 dark:bg-slate-800">Select Type</option>
                <option className="text-slate-800 dark:bg-slate-800">Internship Completion</option>
                <option className="text-slate-800 dark:bg-slate-800">Course Completion</option>
                <option className="text-slate-800 dark:bg-slate-800">Excellence Award</option>
                <option className="text-slate-800 dark:bg-slate-800">Participation</option>
              </select>
            </div>
            
            <Input label="Recipient Name *" name="recipient_name" value={formData.recipient_name} onChange={handleChange} placeholder="e.g. Rahul Singh" required />
            <Input label="Recipient Email" name="recipient_email" value={formData.recipient_email} onChange={handleChange} type="email" placeholder="rahul@example.com" />
            <Input label="Issue Date" name="issue_date" value={formData.issue_date} onChange={handleChange} type="date" required />
            <Input label="Certificate ID (Auto-generated)" placeholder="CERT-2025-XXXX" disabled />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Custom Message / Description</label>
            <textarea rows={4} name="description" value={formData.description} onChange={handleChange} placeholder="Enter the exact text to appear on the certificate..."
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all resize-none"></textarea>
          </div>
          
          <div className="flex items-center gap-3 bg-blue-50/50 dark:bg-blue-500/10 p-4 rounded-xl border border-blue-100 dark:border-blue-500/20">
            <input type="checkbox" id="email_cert" className="w-5 h-5 text-blue-600 rounded border-gray-300 focus:ring-blue-500" defaultChecked />
            <label htmlFor="email_cert" className="text-sm font-medium text-slate-700 dark:text-slate-300">
              Automatically email this certificate to the recipient upon generation
            </label>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/certificates"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" disabled={loading} className="!bg-gradient-to-r !from-blue-500 !to-indigo-500 !shadow-blue-500/30">
              {loading ? "Generating..." : <><i className="fa-solid fa-certificate"></i> Generate Certificate</>}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
