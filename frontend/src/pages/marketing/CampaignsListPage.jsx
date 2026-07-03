import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

const statusCfg = {
  active: "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400",
  paused: "bg-amber-100 text-amber-700 dark:bg-amber-500/10 dark:text-amber-400",
  draft: "bg-slate-100 text-slate-600 dark:bg-slate-500/10 dark:text-slate-400",
  completed: "bg-blue-100 text-blue-700 dark:bg-blue-500/10 dark:text-blue-400",
};

export default function CampaignsListPage() {
  const [campaigns, setCampaigns] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchCampaigns();
  }, []);

  const fetchCampaigns = async () => {
    try {
      const res = await fetch(`${API_URL}/api/marketing/campaigns`);
      const data = await res.json();
      setCampaigns(data);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (id) => {
    if (!confirm("Are you sure you want to delete this campaign?")) return;
    try {
      const res = await fetch(`${API_URL}/api/marketing/campaigns/${id}`, { method: 'DELETE' });
      if (res.ok) {
        setCampaigns(campaigns.filter(c => c.id !== id));
      }
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">All Campaigns</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/marketing"><Button variant="secondary"><i className="fa-solid fa-chart-pie"></i> Dashboard</Button></Link>
          <Link to="/marketing/create-campaign"><Button variant="primary"><i className="fa-solid fa-plus"></i> Create Campaign</Button></Link>
        </div>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Campaign</th>
                <th className="px-6 py-4">Platform</th>
                <th className="px-6 py-4">Budget / Spent</th>
                <th className="px-6 py-4">Performance</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-black/5 dark:divide-white/5">
              {loading ? (
                <tr><td colSpan="6" className="px-6 py-12 text-center text-slate-400">Loading campaigns...</td></tr>
              ) : campaigns.length === 0 ? (
                <tr><td colSpan="6" className="px-6 py-12 text-center text-slate-400">No campaigns found.</td></tr>
              ) : campaigns.map((cam) => {
                const pct = cam.budget > 0 ? Math.min((cam.spend / cam.budget) * 100, 100) : 0;
                return (
                  <tr key={cam.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800 dark:text-slate-200">{cam.name}</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Started: {new Date(cam.start_date).toLocaleDateString()}</div>
                    </td>
                    <td className="px-6 py-4 text-sm font-medium text-slate-700 dark:text-slate-300">{cam.platform}</td>
                    <td className="px-6 py-4">
                      <div className="text-sm font-semibold text-slate-700 dark:text-slate-300">₹{Number(cam.spend || 0).toLocaleString()} / ₹{Number(cam.budget || 0).toLocaleString()}</div>
                      <div className="mt-2 w-28 h-1.5 bg-black/10 dark:bg-white/10 rounded-full overflow-hidden">
                        <div className="h-full bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full" style={{ width: `${pct}%` }}></div>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400 space-y-0.5">
                      <div><i className="fa-solid fa-filter mr-1.5 w-4 opacity-50"></i>{cam.conversions || 0} conversions</div>
                      <div><i className="fa-solid fa-eye mr-1.5 w-4 opacity-50"></i>{Number(cam.reach || 0).toLocaleString()} reach</div>
                    </td>
                    <td className="px-6 py-4">
                      <span className={`px-3 py-1 rounded-full text-xs font-bold capitalize ${statusCfg[cam.status] || statusCfg.draft}`}>{cam.status}</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <Link to={`/marketing/create-campaign?edit=${cam.id}`}>
                          <button className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-500/10 text-indigo-600 dark:text-indigo-400 hover:bg-indigo-100 dark:hover:bg-indigo-500/20 flex items-center justify-center transition-colors"><i className="fa-solid fa-pen-to-square"></i></button>
                        </Link>
                        <button onClick={() => handleDelete(cam.id)} className="w-8 h-8 rounded-lg bg-rose-50 dark:bg-rose-500/10 text-rose-500 dark:text-rose-400 hover:bg-rose-100 dark:hover:bg-rose-500/20 flex items-center justify-center transition-colors"><i className="fa-solid fa-trash"></i></button>
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
