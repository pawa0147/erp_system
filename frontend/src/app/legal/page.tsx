import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

const docs = [
  { id: 1, title: "Service Agreement - Acme Corp", type: "Contract", date: "2025-06-01", status: "Active", size: "245 KB" },
  { id: 2, title: "NDA - Globex Inc", type: "NDA", date: "2025-05-20", status: "Active", size: "128 KB" },
  { id: 3, title: "Freelancer Agreement - Rahul Singh", type: "Employment", date: "2025-04-10", status: "Expired", size: "189 KB" },
  { id: 4, title: "Vendor Agreement - PrintMart", type: "Vendor", date: "2025-03-15", status: "Active", size: "310 KB" },
];

const statusCfg: Record<string, string> = {
  Active: "bg-emerald-100 text-emerald-700",
  Expired: "bg-red-100 text-red-600",
  Draft: "bg-slate-100 text-slate-600",
};

const typeIcons: Record<string, string> = {
  Contract: "fa-file-contract",
  NDA: "fa-user-secret",
  Employment: "fa-id-card",
  Vendor: "fa-truck",
};

export default function LegalPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-slate-600 to-slate-800 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Legal Documents</h2>
        </div>
        <Link href="/legal/add"><Button variant="primary"><i className="fa-solid fa-plus"></i> Upload Document</Button></Link>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Document</th>
                <th className="px-6 py-4">Type</th>
                <th className="px-6 py-4">Date Added</th>
                <th className="px-6 py-4">Size</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {docs.map((doc) => (
                <tr key={doc.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-slate-100 text-slate-600 rounded-xl flex items-center justify-center">
                        <i className={`fa-solid ${typeIcons[doc.type] || "fa-file"}`}></i>
                      </div>
                      <div className="font-semibold text-slate-800">{doc.title}</div>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600">{doc.type}</td>
                  <td className="px-6 py-4 text-sm text-slate-600">{new Date(doc.date).toLocaleDateString()}</td>
                  <td className="px-6 py-4 text-sm text-slate-500">{doc.size}</td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${statusCfg[doc.status]}`}>{doc.status}</span>
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <button className="w-8 h-8 rounded-lg bg-blue-50 text-blue-600 hover:bg-blue-100 flex items-center justify-center transition-colors">
                        <i className="fa-solid fa-download"></i>
                      </button>
                      <button className="w-8 h-8 rounded-lg bg-red-50 text-red-500 hover:bg-red-100 flex items-center justify-center transition-colors">
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