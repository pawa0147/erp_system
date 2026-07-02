"use client";

import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { addBill, addQuote } from "../../actions/billing";
import { useRouter, useSearchParams } from "next/navigation";
import { useState, useMemo } from "react";

export default function AddBillingPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const type = searchParams.get("type") === "quote" ? "quote" : "bill";
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const [items, setItems] = useState([{ id: Date.now(), description: "", quantity: 1, unit_price: 0 }]);
  const [taxPercent, setTaxPercent] = useState(18);

  const subtotal = useMemo(() => {
    return items.reduce((sum, item) => sum + (item.quantity * item.unit_price), 0);
  }, [items]);

  const taxAmount = (subtotal * taxPercent) / 100;
  const totalAmount = subtotal + taxAmount;

  function addItem() {
    setItems([...items, { id: Date.now(), description: "", quantity: 1, unit_price: 0 }]);
  }

  function removeItem(id: number) {
    if (items.length === 1) return;
    setItems(items.filter(item => item.id !== id));
  }

  function updateItem(id: number, field: string, value: string | number) {
    setItems(items.map(item => {
      if (item.id === id) {
        return { ...item, [field]: value };
      }
      return item;
    }));
  }

  async function handleSubmit(formData: FormData) {
    setLoading(true);
    setError("");
    
    // Add calculated fields & JSON stringified items
    formData.append("subtotal", subtotal.toString());
    formData.append("tax_amount", taxAmount.toString());
    formData.append("total_amount", totalAmount.toString());
    formData.append("items", JSON.stringify(items));

    let res;
    if (type === "bill") {
      res = await addBill(formData);
    } else {
      res = await addQuote(formData);
    }

    if (res.success) {
      router.push("/billing");
    } else {
      setError(res.error || "An error occurred");
      setLoading(false);
    }
  }

  return (
    <div className="space-y-6 max-w-5xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Create New {type === "bill" ? "Bill" : "Quotation"}</h2>
        </div>
        <Link href="/billing">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to List
          </Button>
        </Link>
      </div>

      <GlassCard>
        {error && <div className="mb-4 text-sm font-semibold text-red-500">{error}</div>}
        <form action={handleSubmit} className="space-y-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input name="client_name" label="Client Name" required />
            <Input name="client_email" label="Client Email" type="email" />
            <Input name="client_phone" label="Client Phone" />
            
            {type === "bill" ? (
              <>
                <Input name="bill_date" label="Bill Date" type="date" defaultValue={new Date().toISOString().split('T')[0]} required />
                <Input name="due_date" label="Due Date" type="date" />
                <div className="flex flex-col gap-1.5 w-full">
                  <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                    Status
                  </label>
                  <select
                    name="status"
                    className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
                  >
                    <option value="Unpaid">Unpaid</option>
                    <option value="Paid">Paid</option>
                    <option value="Overdue">Overdue</option>
                  </select>
                </div>
              </>
            ) : (
              <Input name="quotation_date" label="Quotation Date" type="date" defaultValue={new Date().toISOString().split('T')[0]} required />
            )}
            
            <div className="md:col-span-2">
              <div className="flex flex-col gap-1.5 w-full">
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                  Client Address
                </label>
                <textarea 
                  name="client_address" 
                  rows={2} 
                  className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
                ></textarea>
              </div>
            </div>
          </div>
          
          <div>
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200">Items</h3>
            </div>
            
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                    <th className="px-4 py-3 w-1/2">Description</th>
                    <th className="px-4 py-3 w-32">Quantity</th>
                    <th className="px-4 py-3 w-40">Unit Price</th>
                    <th className="px-4 py-3 w-32">Total</th>
                    <th className="px-4 py-3 w-16"></th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-black/5 dark:divide-white/5">
                  {items.map((item, index) => (
                    <tr key={item.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                      <td className="px-4 py-2">
                        <input 
                          type="text" 
                          required
                          value={item.description} 
                          onChange={(e) => updateItem(item.id, "description", e.target.value)}
                          className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                          placeholder="Item description..."
                        />
                      </td>
                      <td className="px-4 py-2">
                        <input 
                          type="number" 
                          min="0.1" step="0.1" required
                          value={item.quantity} 
                          onChange={(e) => updateItem(item.id, "quantity", parseFloat(e.target.value) || 0)}
                          className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                        />
                      </td>
                      <td className="px-4 py-2">
                        <input 
                          type="number" 
                          min="0" step="0.01" required
                          value={item.unit_price} 
                          onChange={(e) => updateItem(item.id, "unit_price", parseFloat(e.target.value) || 0)}
                          className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                        />
                      </td>
                      <td className="px-4 py-2 font-bold text-slate-700 dark:text-slate-300">
                        ₹{(item.quantity * item.unit_price).toFixed(2)}
                      </td>
                      <td className="px-4 py-2">
                        <button 
                          type="button" 
                          onClick={() => removeItem(item.id)}
                          disabled={items.length === 1}
                          className="w-8 h-8 rounded-lg bg-rose-50 text-rose-500 hover:bg-rose-100 dark:bg-rose-500/10 dark:text-rose-400 dark:hover:bg-rose-500/20 flex items-center justify-center disabled:opacity-30 transition-colors"
                        >
                          <i className="fa-solid fa-times"></i>
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div className="mt-4">
              <Button type="button" variant="secondary" onClick={addItem}>
                <i className="fa-solid fa-plus"></i> Add Item
              </Button>
            </div>
          </div>

          <div className="flex justify-end">
            <div className="w-full md:w-1/3 space-y-3 bg-black/5 dark:bg-white/5 p-6 rounded-2xl border border-black/5 dark:border-white/10">
              <div className="flex justify-between text-slate-600 dark:text-slate-400 font-medium">
                <span>Subtotal</span>
                <span>₹{subtotal.toFixed(2)}</span>
              </div>
              <div className="flex justify-between items-center text-slate-600 dark:text-slate-400 font-medium">
                <span>GST Rate (%)</span>
                <input 
                  type="number" 
                  name="tax_percent"
                  min="0" max="100" 
                  value={taxPercent}
                  onChange={(e) => setTaxPercent(parseFloat(e.target.value) || 0)}
                  className="glass-input-topbar w-20 py-1 px-2 rounded-lg font-medium outline-none transition-all duration-200 text-sm text-right"
                />
              </div>
              <div className="flex justify-between text-slate-600 dark:text-slate-400 font-medium pb-3 border-b border-black/10 dark:border-white/10">
                <span>Tax Amount</span>
                <span>₹{taxAmount.toFixed(2)}</span>
              </div>
              <div className="flex justify-between text-xl font-bold text-slate-800 dark:text-slate-100 pt-1">
                <span>Total</span>
                <span>₹{totalAmount.toFixed(2)}</span>
              </div>
            </div>
          </div>

          <div className="flex flex-col gap-1.5 w-full mt-4">
             <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
               Notes
             </label>
             <textarea 
               name="notes" 
               rows={3} 
               className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
               placeholder="Additional terms or notes..."
             ></textarea>
          </div>

          <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
            <Link href="/billing">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary" disabled={loading}>
              <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-save"}></i> 
              {loading ? "Saving..." : `Save ${type === "bill" ? "Bill" : "Quotation"}`}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
