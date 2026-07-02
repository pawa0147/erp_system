import prisma from "@/lib/prisma";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { DeleteButton } from "./DeleteButton";

export const dynamic = "force-dynamic";

export default async function BillingPage() {
  const [bills, quotes] = await Promise.all([
    prisma.bill.findMany({ orderBy: { created_at: "desc" } }),
    prisma.quotation.findMany({ orderBy: { created_at: "desc" } })
  ]);

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-emerald-500 to-teal-500 rounded-full shadow-[0_0_10px_rgba(16,185,129,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Billing & Quotes</h2>
        </div>
        <div className="flex gap-3">
          <Link href="/billing/add?type=quote">
            <Button variant="secondary">
              <i className="fa-solid fa-file-invoice"></i> Create Quote
            </Button>
          </Link>
          <Link href="/billing/add?type=bill">
            <Button variant="primary">
              <i className="fa-solid fa-file-invoice-dollar"></i> Create Bill
            </Button>
          </Link>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Total Outstanding</div>
          <div className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">
            ₹{bills.filter(b => b.status === "Unpaid" || b.status === "Overdue").reduce((sum, b) => sum + b.total_amount, 0).toLocaleString()}
          </div>
        </GlassCard>
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Total Collected</div>
          <div className="text-3xl font-extrabold text-emerald-600 dark:text-emerald-400">
            ₹{bills.filter(b => b.status === "Paid").reduce((sum, b) => sum + b.total_amount, 0).toLocaleString()}
          </div>
        </GlassCard>
        <GlassCard className="p-6">
          <div className="text-sm font-semibold text-slate-500 dark:text-slate-400 mb-1">Active Quotes</div>
          <div className="text-3xl font-extrabold text-indigo-600 dark:text-indigo-400">
            {quotes.length}
          </div>
        </GlassCard>
      </div>

      <div className="space-y-6">
        <h3 className="text-xl font-bold text-slate-800 dark:text-slate-200">Recent Invoices</h3>
        <GlassCard className="p-0 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                  <th className="px-6 py-4">#ID</th>
                  <th className="px-6 py-4">Client</th>
                  <th className="px-6 py-4">Date</th>
                  <th className="px-6 py-4">Amount</th>
                  <th className="px-6 py-4">Status</th>
                  <th className="px-6 py-4">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-black/5 dark:divide-white/5">
                {bills.map((bill) => (
                  <tr key={bill.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                    <td className="px-6 py-4 font-semibold text-slate-500 dark:text-slate-400">INV-{String(bill.id).padStart(4, '0')}</td>
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800 dark:text-slate-200">{bill.client_name}</div>
                      {bill.client_email && <div className="text-sm text-slate-500 dark:text-slate-400">{bill.client_email}</div>}
                    </td>
                    <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-300">
                      <div>Issued: {bill.bill_date ? new Date(bill.bill_date).toLocaleDateString() : "N/A"}</div>
                      {bill.due_date && <div className="text-xs text-rose-500 dark:text-rose-400">Due: {new Date(bill.due_date).toLocaleDateString()}</div>}
                    </td>
                    <td className="px-6 py-4 font-bold text-slate-800 dark:text-slate-200">₹{bill.total_amount.toLocaleString()}</td>
                    <td className="px-6 py-4">
                      <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase ${
                        bill.status === "Paid" ? "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400" :
                        bill.status === "Overdue" ? "bg-rose-100 text-rose-700 dark:bg-rose-500/10 dark:text-rose-400" :
                        "bg-amber-100 text-amber-700 dark:bg-amber-500/10 dark:text-amber-400"
                      }`}>
                        {bill.status}
                      </span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <Link href={`/billing/view/${bill.id}?type=bill`} className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-500/10 text-indigo-600 dark:text-indigo-400 hover:bg-indigo-100 dark:hover:bg-indigo-500/20 transition-colors flex items-center justify-center">
                          <i className="fa-solid fa-eye"></i>
                        </Link>
                        <DeleteButton id={bill.id} type="bill" />
                      </div>
                    </td>
                  </tr>
                ))}
                {bills.length === 0 && (
                  <tr>
                    <td colSpan={6} className="px-6 py-12 text-center text-slate-500 dark:text-slate-400">
                      No invoices found.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </GlassCard>
      </div>

      <div className="space-y-6">
        <h3 className="text-xl font-bold text-slate-800 dark:text-slate-200">Recent Quotations</h3>
        <GlassCard className="p-0 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                  <th className="px-6 py-4">#ID</th>
                  <th className="px-6 py-4">Client</th>
                  <th className="px-6 py-4">Date</th>
                  <th className="px-6 py-4">Amount</th>
                  <th className="px-6 py-4">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-black/5 dark:divide-white/5">
                {quotes.map((quote) => (
                  <tr key={quote.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                    <td className="px-6 py-4 font-semibold text-slate-500 dark:text-slate-400">QT-{String(quote.id).padStart(4, '0')}</td>
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800 dark:text-slate-200">{quote.client_name}</div>
                    </td>
                    <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-300">
                      {quote.quotation_date ? new Date(quote.quotation_date).toLocaleDateString() : "N/A"}
                    </td>
                    <td className="px-6 py-4 font-bold text-slate-800 dark:text-slate-200">₹{quote.total_amount.toLocaleString()}</td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <Link href={`/billing/view/${quote.id}?type=quote`} className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-500/10 text-indigo-600 dark:text-indigo-400 hover:bg-indigo-100 dark:hover:bg-indigo-500/20 transition-colors flex items-center justify-center">
                          <i className="fa-solid fa-eye"></i>
                        </Link>
                        <DeleteButton id={quote.id} type="quote" />
                      </div>
                    </td>
                  </tr>
                ))}
                {quotes.length === 0 && (
                  <tr>
                    <td colSpan={5} className="px-6 py-12 text-center text-slate-500 dark:text-slate-400">
                      No quotations found.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </GlassCard>
      </div>

    </div>
  );
}