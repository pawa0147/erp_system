import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

const campaigns = [
  { id: 1, name: "Summer Sale 2025", platform: "Google", budget: 20000, spend: 14500, conversions: 180, reach: 120000, status: "active", start_date: "2025-06-01" },
  { id: 2, name: "Brand Awareness Q2", platform: "Facebook", budget: 15000, spend: 10000, conversions: 80, reach: 85000, status: "active", start_date: "2025-05-15" },
  { id: 3, name: "Product Launch Post", platform: "Instagram", budget: 10000, spend: 9800, conversions: 124, reach: 40000, status: "paused", start_date: "2025-06-10" },
  { id: 4, name: "Year End Sale", platform: "LinkedIn", budget: 30000, spend: 0, conversions: 0, reach: 0, status: "draft", start_date: "2025-12-01" },
];

const statusCfg: Record<string, string> = {
  active: "bg-emerald-100 text-emerald-700",
  paused: "bg-amber-100 text-amber-700",
  draft: "bg-slate-100 text-slate-600",
  completed: "bg-blue-100 text-blue-700",
};

export default function CampaignsListPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">All Campaigns</h2>
        </div>
        <div className="flex gap-3">
          <Link href="/marketing"><Button variant="secondary"><i className="fa-solid fa-chart-pie"></i> Dashboard</Button></Link>
          <Link href="/marketing/create-campaign"><Button variant="primary"><i className="fa-solid fa-plus"></i> Create Campaign</Button></Link>
        </div>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Campaign</th>
                <th className="px-6 py-4">Platform</th>
                <th className="px-6 py-4">Budget / Spent</th>
                <th className="px-6 py-4">Performance</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {campaigns.map((cam) => {
                const pct = cam.budget > 0 ? Math.min((cam.spend / cam.budget) * 100, 100) : 0;
                return (
                  <tr key={cam.id} className="hover:bg-slate-50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800">{cam.name}</div>
                      <div className="text-xs text-slate-400 mt-0.5">Started: {new Date(cam.start_date).toLocaleDateString()}</div>
                    </td>
                    <td className="px-6 py-4 text-sm font-medium text-slate-700">{cam.platform}</td>
                    <td className="px-6 py-4">
                      <div className="text-sm font-semibold text-slate-700">₹{cam.spend.toLocaleString()} / ₹{cam.budget.toLocaleString()}</div>
                      <div className="mt-2 w-28 h-1.5 bg-slate-100 rounded-full overflow-hidden">
                        <div className="h-full bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full" style={{ width: `${pct}%` }}></div>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-slate-600 space-y-0.5">
                      <div><i className="fa-solid fa-filter mr-1.5 text-slate-400 w-4"></i>{cam.conversions} conversions</div>
                      <div><i className="fa-solid fa-eye mr-1.5 text-slate-400 w-4"></i>{cam.reach.toLocaleString()} reach</div>
                    </td>
                    <td className="px-6 py-4">
                      <span className={`px-3 py-1 rounded-full text-xs font-bold capitalize ${statusCfg[cam.status]}`}>{cam.status}</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <Link href={`/marketing/create-campaign?edit=${cam.id}`}>
                          <button className="w-8 h-8 rounded-lg bg-indigo-50 text-indigo-600 hover:bg-indigo-100 flex items-center justify-center transition-colors"><i className="fa-solid fa-pen-to-square"></i></button>
                        </Link>
                        <button className="w-8 h-8 rounded-lg bg-red-50 text-red-500 hover:bg-red-100 flex items-center justify-center transition-colors"><i className="fa-solid fa-trash"></i></button>
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