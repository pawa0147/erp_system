import prisma from "@/lib/prisma";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { redirect } from "next/navigation";

export default async function ViewBillingPage({ params, searchParams }: { params: Promise<{ id: string }>, searchParams: Promise<{ type?: string }> }) {
  const resolvedParams = await params;
  const resolvedSearchParams = await searchParams;
  
  const id = parseInt(resolvedParams.id, 10);
  const type = resolvedSearchParams.type === "quote" ? "quote" : "bill";
  
  if (isNaN(id)) {
    redirect("/billing");
  }

  let record: any = null;
  let items: any[] = [];

  if (type === "bill") {
    record = await prisma.bill.findUnique({
      where: { id },
      include: { items: true }
    });
    if (record) items = record.items;
  } else {
    record = await prisma.quotation.findUnique({
      where: { id },
      include: { items: true }
    });
    if (record) items = record.items;
  }

  if (!record) {
    redirect("/billing");
  }

  const prefix = type === "bill" ? "INV" : "QT";
  const displayId = `${prefix}-${String(record.id).padStart(4, '0')}`;
  const dateField = type === "bill" ? record.bill_date : record.quotation_date;

  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-8 print:hidden">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">{type === "bill" ? "Invoice" : "Quotation"} {displayId}</h2>
        </div>
        <div className="flex gap-3">
          <Link href="/billing">
            <Button variant="secondary">
              <i className="fa-solid fa-arrow-left"></i> Back
            </Button>
          </Link>
          <Button variant="primary" className="!bg-slate-800 hover:!bg-slate-700 dark:!bg-white dark:hover:!bg-slate-200 dark:!text-slate-900">
            <i className="fa-solid fa-print"></i> Print
          </Button>
        </div>
      </div>

      <GlassCard className="p-10 print:shadow-none print:border-none print:bg-white print:text-black">
        <div className="flex justify-between items-start mb-12">
          <div>
            <h1 className="text-4xl font-extrabold text-slate-800 dark:text-slate-100 print:text-black mb-2 uppercase tracking-wider">
              {type === "bill" ? "Invoice" : "Quotation"}
            </h1>
            <div className="text-slate-500 dark:text-slate-400 print:text-slate-600 font-semibold">{displayId}</div>
          </div>
          <div className="text-right">
            <div className="text-2xl font-bold text-slate-800 dark:text-slate-100 print:text-black">Your Company Name</div>
            <div className="text-slate-500 dark:text-slate-400 print:text-slate-600 mt-1">123 Business Rd, Tech City</div>
            <div className="text-slate-500 dark:text-slate-400 print:text-slate-600">contact@yourcompany.com</div>
          </div>
        </div>

        <div className="flex justify-between mb-12">
          <div>
            <div className="text-sm font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider mb-2">Billed To</div>
            <div className="text-xl font-bold text-slate-800 dark:text-slate-100 print:text-black">{record.client_name}</div>
            {record.client_address && <div className="text-slate-600 dark:text-slate-300 print:text-slate-700 max-w-xs mt-1">{record.client_address}</div>}
            {record.client_email && <div className="text-slate-600 dark:text-slate-300 print:text-slate-700 mt-1">{record.client_email}</div>}
            {record.client_phone && <div className="text-slate-600 dark:text-slate-300 print:text-slate-700">{record.client_phone}</div>}
          </div>
          <div className="text-right flex gap-8">
            <div>
              <div className="text-sm font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider mb-1">Date</div>
              <div className="font-semibold text-slate-800 dark:text-slate-200 print:text-black">
                {dateField ? new Date(dateField).toLocaleDateString() : "N/A"}
              </div>
            </div>
            {type === "bill" && record.due_date && (
              <div>
                <div className="text-sm font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider mb-1">Due Date</div>
                <div className="font-semibold text-rose-600 dark:text-rose-400 print:text-black">
                  {new Date(record.due_date).toLocaleDateString()}
                </div>
              </div>
            )}
          </div>
        </div>

        <table className="w-full text-left border-collapse mb-12">
          <thead>
            <tr className="border-b-2 border-slate-200 dark:border-white/10 text-slate-800 dark:text-slate-200 print:text-black font-bold">
              <th className="py-3 px-2">Description</th>
              <th className="py-3 px-2 text-center">Qty</th>
              <th className="py-3 px-2 text-right">Unit Price</th>
              <th className="py-3 px-2 text-right">Amount</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100 dark:divide-white/5 print:divide-slate-200">
            {items.map((item: any) => (
              <tr key={item.id}>
                <td className="py-4 px-2 text-slate-700 dark:text-slate-300 print:text-slate-800 font-medium">{item.description}</td>
                <td className="py-4 px-2 text-center text-slate-600 dark:text-slate-400 print:text-slate-700">{item.quantity}</td>
                <td className="py-4 px-2 text-right text-slate-600 dark:text-slate-400 print:text-slate-700">₹{item.unit_price.toFixed(2)}</td>
                <td className="py-4 px-2 text-right font-bold text-slate-800 dark:text-slate-200 print:text-black">₹{item.total.toFixed(2)}</td>
              </tr>
            ))}
          </tbody>
        </table>

        <div className="flex justify-end">
          <div className="w-full md:w-1/2">
            <div className="flex justify-between py-2 text-slate-600 dark:text-slate-400 print:text-slate-700 font-medium">
              <span>Subtotal</span>
              <span>₹{record.subtotal.toFixed(2)}</span>
            </div>
            <div className="flex justify-between py-2 text-slate-600 dark:text-slate-400 print:text-slate-700 font-medium border-b border-slate-200 dark:border-white/10">
              <span>Tax ({record.tax_percent}%)</span>
              <span>₹{record.tax_amount.toFixed(2)}</span>
            </div>
            <div className="flex justify-between py-4 text-2xl font-extrabold text-slate-800 dark:text-slate-100 print:text-black">
              <span>Total</span>
              <span>₹{record.total_amount.toFixed(2)}</span>
            </div>
          </div>
        </div>

        {record.notes && (
          <div className="mt-12 pt-6 border-t border-slate-200 dark:border-white/10">
            <div className="text-sm font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider mb-2">Notes</div>
            <div className="text-slate-600 dark:text-slate-400 print:text-slate-700 whitespace-pre-wrap">{record.notes}</div>
          </div>
        )}
      </GlassCard>
    </div>
  );
}
