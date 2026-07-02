import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function AddTransactionPage() {
  return (
    <div className="space-y-6 max-w-2xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Add Transaction</h2>
        </div>
        <Link href="/finance"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Transaction Type</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-emerald-500 focus:ring-4 focus:ring-emerald-500/10 transition-all">
                <option value="Income">Income</option>
                <option value="Expense">Expense</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Category</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-emerald-500 focus:ring-4 focus:ring-emerald-500/10 transition-all">
                <option>Project Payment</option>
                <option>Consultation</option>
                <option>Retainer</option>
                <option>Salaries</option>
                <option>Advertising</option>
                <option>Office Supplies</option>
                <option>Other</option>
              </select>
            </div>
            <Input label="Amount (₹)" type="number" placeholder="0.00" required />
            <Input label="Transaction Date" type="date" defaultValue={new Date().toISOString().split("T")[0]} required />
          </div>
          <Input label="Description" placeholder="Brief description of this transaction..." />
          <div className="flex flex-col gap-2">
            <label className="text-sm font-semibold text-slate-700">Linked Client (Optional)</label>
            <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-emerald-500 focus:ring-4 focus:ring-emerald-500/10 transition-all">
              <option value="">None</option>
              <option>Acme Corp</option>
              <option>Globex Inc</option>
              <option>TechCo</option>
            </select>
          </div>
          <div className="pt-4 border-t border-slate-100 flex justify-end gap-4">
            <Link href="/finance"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary"><i className="fa-solid fa-check"></i> Save Transaction</Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}