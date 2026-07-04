import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

const statusCfg = {
  Active: "bg-emerald-100 dark:bg-emerald-500/20 text-emerald-700 dark:text-emerald-400",
  Expired: "bg-red-100 dark:bg-red-500/20 text-red-600 dark:text-red-400",
  Draft: "bg-slate-100 dark:bg-white/10 text-slate-600 dark:text-slate-400",
};

const typeIcons = {
  Contract: "fa-file-contract",
  NDA: "fa-user-secret",
  Employment: "fa-id-card",
  Vendor: "fa-truck",
};

export default function LegalDocsPage() {
  const [docs, setDocs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/legal`)
      .then(res => res.ok ? res.json() : [])
      .then(data => {
        setDocs(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch legal documents:', err);
        setLoading(false);
      });
  }, []);

  const handleDelete = async (id) => {
    if(!window.confirm('Delete this document?')) return;
    try {
      const res = await fetch(`${API_URL}/api/legal/${id}`, { method: 'DELETE' });
      if (res.ok) setDocs(docs.filter(d => d.id !== id));
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-slate-600 to-slate-800 dark:from-slate-400 dark:to-slate-600 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Legal Documents</h2>
        </div>
        <Link to="/legal/add"><Button variant="primary"><i className="fa-solid fa-plus"></i> Upload Document</Button></Link>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 dark:bg-white/5 border-b border-slate-200 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Document</th>
                <th className="px-6 py-4">Type</th>
                <th className="px-6 py-4">Date Added</th>
                <th className="px-6 py-4">Size</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-white/5">
              {docs.length === 0 && !loading && (
                <tr><td colSpan="6" className="px-6 py-4 text-center text-slate-500">No documents found.</td></tr>
              )}
              {docs.map((doc) => (
                <tr key={doc.id} className="hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-slate-100 dark:bg-white/10 text-slate-600 dark:text-slate-300 rounded-xl flex items-center justify-center">
                        <i className={`fa-solid ${typeIcons[doc.doc_type] || "fa-file"}`}></i>
                      </div>
                      <div className="font-semibold text-slate-800 dark:text-slate-200">{doc.title}</div>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">{doc.doc_type}</td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">{new Date(doc.upload_date || doc.created_at).toLocaleDateString()}</td>
                  <td className="px-6 py-4 text-sm text-slate-500 dark:text-slate-500">{doc.size || 'N/A'}</td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${statusCfg[doc.status] || "bg-slate-100 text-slate-600"}`}>{doc.status}</span>
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <button className="w-8 h-8 rounded-lg bg-blue-50 dark:bg-blue-500/10 text-blue-600 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-500/20 flex items-center justify-center transition-colors" onClick={() => alert('Feature coming soon!')}>
                        <i className="fa-solid fa-download"></i>
                      </button>
                      <button className="w-8 h-8 rounded-lg bg-red-50 dark:bg-red-500/10 text-red-500 dark:text-red-400 hover:bg-red-100 dark:hover:bg-red-500/20 flex items-center justify-center transition-colors" onClick={() => handleDelete(doc.id)}>
                        <i className="fa-solid fa-trash"></i>
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}
