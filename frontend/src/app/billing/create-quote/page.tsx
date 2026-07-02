import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function CreateQuotePage() {
  return (
    <div className="space-y-6 max-w-[1000px]">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-purple-500 to-indigo-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Create New Quotation</h2>
        </div>
        <Link href="/billing/list-quotes">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to Quotes
          </Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input label="Client/Prospect Name" placeholder="Select or type name" required />
            <Input label="Email Address" type="email" placeholder="prospect@example.com" />
            <Input label="Quotation Date" type="date" required />
            <Input label="Valid Until" type="date" />
          </div>

          <div className="border-t border-slate-200 pt-6">
            <h3 className="text-lg font-bold text-slate-800 mb-4">Proposed Services / Items</h3>
            <div className="bg-slate-50 p-4 rounded-xl border border-slate-200 space-y-4">
              <div className="grid grid-cols-12 gap-4 text-sm font-semibold text-slate-500">
                <div className="col-span-6">Description</div>
                <div className="col-span-2">Quantity</div>
                <div className="col-span-3">Unit Price (₹)</div>
                <div className="col-span-1"></div>
              </div>
              
              <div className="grid grid-cols-12 gap-4 items-center">
                <div className="col-span-6">
                  <Input placeholder="Service or product description" />
                </div>
                <div className="col-span-2">
                  <Input type="number" placeholder="1" defaultValue="1" />
                </div>
                <div className="col-span-3">
                  <Input type="number" placeholder="0.00" />
                </div>
                <div className="col-span-1 text-right">
                  <button type="button" className="text-red-500 hover:text-red-700 p-2">
                    <i className="fa-solid fa-trash"></i>
                  </button>
                </div>
              </div>
              
              <Button type="button" variant="secondary" className="w-full mt-4 border-dashed">
                <i className="fa-solid fa-plus"></i> Add Proposed Item
              </Button>
            </div>
          </div>

          <div className="border-t border-slate-200 pt-6">
            <Input label="Terms & Conditions" placeholder="Enter terms and conditions for this quote..." />
          </div>
          
          <div className="border-t border-slate-100 pt-6 flex justify-end gap-4">
            <Link href="/billing/list-quotes">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary">
              <i className="fa-solid fa-file-signature"></i> Generate Quote
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}