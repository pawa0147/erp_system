import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

const txns = [
  { id: 1, date: "2025-06-18", type: "Income", category: "Project Payment", description: "Website project - Acme Corp", amount: 45000 },
  { id: 2, date: "2025-06-15", type: "Expense", category: "Office Supplies", description: "Stationery & misc", amount: 2500 },
  { id: 3, date: "2025-06-12", type: "Income", category: "Consultation", description: "Strategy session - Globex", amount: 15000 },
  { id: 4, date: "2025-06-10", type: "Expense", category: "Advertising", description: "Google Ads campaign", amount: 8000 },
  { id: 5, date: "2025-06-05", type: "Income", category: "Retainer", description: "Monthly retainer - TechCo", amount: 30000 },
  { id: 6, date: "2025-05-30", type: "Expense", category: "Salaries", description: "Employee payroll May", amount: 180000 },
];

export default function TransactionsPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Transaction History</h2>
        </div>
        <div className="flex gap-3">
          <Link href="/finance"><Button variant="secondary"><i className="fa-solid fa-chart-pie"></i> Dashboard</Button></Link>
          <Link href="/finance/add-transaction"><Button variant="primary"><i className="fa-solid fa-plus"></i> Add Transaction</Button></Link>
        </div>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Date</th>
                <th className="px-6 py-4">Type</th>
                <th className="px-6 py-4">Category</th>
                <th className="px-6 py-4">Description</th>
                <th className="px-6 py-4">Amount</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {txns.map((txn) => (
                <tr key={txn.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4 text-sm text-slate-600">{new Date(txn.date).toLocaleDateString("en-IN", { day: "2-digit", month: "short" })}</td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${txn.type === "Income" ? "bg-emerald-100 text-emerald-700" : "bg-red-100 text-red-600"}`}>{txn.type}</span>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600">{txn.category}</td>
                  <td className="px-6 py-4 text-sm text-slate-500">{txn.description}</td>
                  <td className={`px-6 py-4 font-bold text-base ${txn.type === "Income" ? "text-emerald-600" : "text-red-500"}`}>
                    {txn.type === "Income" ? "+" : "-"} ₹{txn.amount.toLocaleString()}
                  </td>
                  <td className="px-6 py-4">
                    <button className="w-8 h-8 rounded-lg bg-red-50 text-red-500 hover:bg-red-100 flex items-center justify-center transition-colors">
                      <i className="fa-solid fa-trash"></i>
                    </button>
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