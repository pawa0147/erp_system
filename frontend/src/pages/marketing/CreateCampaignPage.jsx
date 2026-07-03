import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useSearchParams, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function CreateCampaignPage() {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const isEditing = searchParams.get("edit");
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    name: "",
    platform: "Google Ads",
    objective: "Brand Awareness",
    budget: "",
    start_date: new Date().toISOString().split("T")[0],
    end_date: "",
    status: "draft",
    notes: ""
  });

  const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await fetch(`${API_URL}/api/marketing/campaigns`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
      });
      if (res.ok) {
        navigate('/marketing/campaigns');
      } else {
        alert("Failed to save campaign");
      }
    } catch (err) {
      console.error(err);
      alert("Error saving campaign");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="space-y-6 max-w-3xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">
            {isEditing ? "Edit Campaign" : "New Campaign"}
          </h2>
        </div>
        <Link to="/marketing/campaigns">
          <Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-6" onSubmit={handleSubmit}>
          <Input label="Campaign Name *" name="name" value={formData.name} onChange={handleChange} placeholder="e.g. Summer Mega Sale 2025" required />

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Platform</label>
              <select name="platform" value={formData.platform} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Google Ads</option>
                <option className="text-slate-800 dark:bg-slate-800">Facebook</option>
                <option className="text-slate-800 dark:bg-slate-800">Instagram</option>
                <option className="text-slate-800 dark:bg-slate-800">LinkedIn</option>
                <option className="text-slate-800 dark:bg-slate-800">Twitter (X)</option>
                <option className="text-slate-800 dark:bg-slate-800">Email Marketing</option>
              </select>
            </div>
            
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Objective</label>
              <select name="objective" value={formData.objective} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Brand Awareness</option>
                <option className="text-slate-800 dark:bg-slate-800">Lead Generation</option>
                <option className="text-slate-800 dark:bg-slate-800">Sales</option>
                <option className="text-slate-800 dark:bg-slate-800">Website Traffic</option>
              </select>
            </div>

            <Input label="Budget (₹)" name="budget" value={formData.budget} onChange={handleChange} type="number" placeholder="5000" required />
            <Input label="Start Date" name="start_date" value={formData.start_date} onChange={handleChange} type="date" required />
            <Input label="End Date" name="end_date" value={formData.end_date} onChange={handleChange} type="date" />
            
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Status</label>
              <select name="status" value={formData.status} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800" value="draft">Draft</option>
                <option className="text-slate-800 dark:bg-slate-800" value="active">Active</option>
                <option className="text-slate-800 dark:bg-slate-800" value="paused">Paused</option>
              </select>
            </div>
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Target Audience & Notes</label>
            <textarea rows={4} name="notes" value={formData.notes} onChange={handleChange} placeholder="Describe target demographics, keywords, or special instructions..."
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/marketing/campaigns"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" disabled={loading} className="!bg-gradient-to-r !from-indigo-500 !to-purple-500 !shadow-indigo-500/30">
              {loading ? "Saving..." : <><i className="fa-solid fa-rocket"></i> {isEditing ? "Update Campaign" : "Launch Campaign"}</>}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
