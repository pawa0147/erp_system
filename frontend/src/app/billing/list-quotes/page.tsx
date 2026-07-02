import prisma from "@/lib/prisma";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default async function ListQuotesPage() {
  let quotes: any[] = [];
  let dbError = false;

  try {
    quotes = await prisma.quotation.findMany({
      orderBy: { created_at: "desc" },
    });
  } catch (error) {
    dbError = true;
    console.error("Database connection failed. Showing sample data.", error);
    quotes = [
      {
        id: 1,
        client_name: "Stark Industries",
        client_email: "procurement@stark.com",
        quotation_date: new Date(),
        total_amount: 150000,
      },
    ];
  }

  return (
    <div className="space-y-6 max-w-[1200px]">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-purple-500 to-indigo-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">All Quotations</h2>
        </div>
        <div className="flex gap-4">
          <Link href="/billing/list-bills">
            <Button variant="secondary">
              <i className="fa-solid fa-file-invoice"></i> View Bills
            </Button>
          </Link>
          <Link href="/billing/create-quote">
            <Button variant="primary">
              <i className="fa-solid fa-plus"></i> Create Quote
            </Button>
          </Link>
        </div>
      </div>

      {dbError && (
        <div className="bg-amber-50 border border-amber-200 text-amber-700 px-4 py-3 rounded-xl mb-6">
          <i className="fas fa-triangle-exclamation mr-2"></i>
          <strong>Database Error:</strong> Showing sample quotations. Ensure MySQL is connected.
        </div>
      )}

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">#ID</th>
                <th className="px-6 py-4">Client Name</th>
                <th className="px-6 py-4">Date</th>
                <th className="px-6 py-4">Total</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {quotes.map((quote) => (
                <tr key={quote.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4 font-bold text-slate-600">
                    Q-{String(quote.id).padStart(3, '0')}
                  </td>
                  <td className="px-6 py-4">
                    <div className="font-bold text-slate-800">{quote.client_name}</div>
                    <div className="text-sm text-slate-500">{quote.client_email}</div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600">
                    {new Date(quote.quotation_date).toLocaleDateString()}
                  </td>
                  <td className="px-6 py-4 font-bold text-slate-700">
                    ₹{quote.total_amount.toLocaleString()}
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <button className="w-8 h-8 rounded-lg bg-indigo-50 text-indigo-600 hover:bg-indigo-100 flex items-center justify-center">
                        <i className="fa-solid fa-eye"></i>
                      </button>
                      <button className="w-8 h-8 rounded-lg bg-red-50 text-red-600 hover:bg-red-100 flex items-center justify-center">
                        <i className="fa-solid fa-trash"></i>
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
              
              {quotes.length === 0 && (
                <tr>
                  <td colSpan={5} className="px-6 py-8 text-center text-slate-500">
                    No quotations generated yet.
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