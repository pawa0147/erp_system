import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";
import { useState, useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

function DeleteButton({ id, onDelete }) {
  const [loading, setLoading] = useState(false);

  async function handleDelete() {
    if (!window.confirm("Are you sure you want to delete this lead?")) return;
    setLoading(true);
    try {
      const res = await fetch(`${API_URL}/api/leads/${id}`, { method: 'DELETE' });
      if (res.ok) {
        onDelete(id);
      } else {
        console.error('Failed to delete lead');
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
      title="Delete Lead"
    >
      <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-trash"}></i>
    </button>
  );
}

export default function SalesPage() {
  const [leads, setLeads] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/leads`)
      .then(res => res.ok ? res.json() : [])
      .then(data => {
        setLeads(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch leads:', err);
        setLoading(false);
      });
  }, []);

  const handleDeleteSuccess = (id) => {
    setLeads(leads.filter(l => l.id !== id));
  };

  if (loading) {
    return <div className="p-8 text-center"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>;
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Sales & Leads Pipeline</h2>
        </div>
        <Link to="/sales/add">
          <Button variant="primary">
            <i className="fa-solid fa-plus"></i> New Lead
          </Button>
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        {[
          { title: "Total Leads", value: leads.length, icon: "fa-bullseye", color: "indigo" },
          { title: "Converted", value: leads.filter(l => l.status === "Converted").length, icon: "fa-check-circle", color: "emerald" },
          { title: "In Negotiation", value: leads.filter(l => l.status === "Negotiation").length, icon: "fa-handshake", color: "amber" },
          { title: "Lost", value: leads.filter(l => l.status === "Lost").length, icon: "fa-times-circle", color: "rose" },
        ].map((stat, i) => (
          <GlassCard key={i} className="p-6 flex items-center justify-between">
            <div>
              <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">{stat.title}</div>
              <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{stat.value}</div>
            </div>
            <div className={`w-12 h-12 rounded-xl bg-${stat.color}-500/10 text-${stat.color}-500 flex items-center justify-center text-xl`}>
              <i className={`fa-solid ${stat.icon}`}></i>
            </div>
          </GlassCard>
        ))}
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Company / Lead</th>
                <th className="px-6 py-4">Contact</th>
                <th className="px-6 py-4">Type</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Added On</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-black/5 dark:divide-white/5">
              {leads.map((lead) => (
                <tr key={lead.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="font-bold text-slate-800 dark:text-slate-200">{lead.company_name}</div>
                    <div className="text-sm text-slate-500 dark:text-slate-400">{lead.founder_name || "N/A"}</div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-300">
                    {lead.email && <div><i className="fa-regular fa-envelope w-4 mr-1 opacity-70"></i>{lead.email}</div>}
                    {lead.contact_number && <div><i className="fa-solid fa-phone w-4 mr-1 opacity-70"></i>{lead.contact_number}</div>}
                  </td>
                  <td className="px-6 py-4">
                    <div className="font-semibold text-slate-700 dark:text-slate-300">{lead.business_type || "N/A"}</div>
                    <div className="text-xs text-slate-500 dark:text-slate-400">{lead.category || "N/A"}</div>
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase ${
                      lead.status === "Converted" ? "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400" :
                      lead.status === "Lost" ? "bg-rose-100 text-rose-700 dark:bg-rose-500/10 dark:text-rose-400" :
                      lead.status === "Negotiation" ? "bg-amber-100 text-amber-700 dark:bg-amber-500/10 dark:text-amber-400" :
                      "bg-blue-100 text-blue-700 dark:bg-blue-500/10 dark:text-blue-400"
                    }`}>
                      {lead.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-xs text-slate-500 dark:text-slate-400">
                    {new Date(lead.created_at).toLocaleDateString()}
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <Link to={`/sales/edit/${lead.id}`} className="w-8 h-8 rounded-lg bg-blue-50 dark:bg-blue-500/10 text-blue-600 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-500/20 transition-colors flex items-center justify-center">
                        <i className="fa-solid fa-pen-to-square"></i>
                      </Link>
                      <DeleteButton id={lead.id} onDelete={handleDeleteSuccess} />
                    </div>
                  </td>
                </tr>
              ))}
              
              {leads.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-slate-500 dark:text-slate-400">
                    <div className="mb-3 text-4xl opacity-30"><i className="fa-solid fa-bullseye"></i></div>
                    <div className="font-semibold text-lg mb-1">No leads found</div>
                    <div>Add your first lead to start building the pipeline.</div>
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
