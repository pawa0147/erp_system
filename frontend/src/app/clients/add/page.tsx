"use client";

import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { addClient } from "../../actions/clients";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function AddClientPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleSubmit(formData: FormData) {
    setLoading(true);
    setError("");
    const res = await addClient(formData);
    if (res.success) {
      router.push("/clients");
    } else {
      setError(res.error || "An error occurred");
      setLoading(false);
    }
  }

  return (
    <div className="space-y-6 max-w-4xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Add New Client</h2>
        </div>
        <Link href="/clients">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to List
          </Button>
        </Link>
      </div>

      <GlassCard>
        {error && <div className="mb-4 text-sm font-semibold text-red-500">{error}</div>}
        <form action={handleSubmit} className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input name="name" label="Full Name" placeholder="e.g. John Doe" required />
            <Input name="company_name" label="Company Name" placeholder="e.g. Acme Corp" />
            <Input name="email" label="Email Address" type="email" placeholder="john@example.com" />
            <Input name="phone" label="Phone Number" placeholder="+1 234 567 890" />
            <Input name="referral_source" label="Referral Source" placeholder="e.g. Website, Friend, Ads" />
            <Input name="total_project_amount" label="Total Project Amount (₹)" type="number" placeholder="0" />
            <Input name="amount_received" label="Amount Received (₹)" type="number" placeholder="0" />
            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Payment Status
              </label>
              <select
                name="payment_status"
                className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
              >
                <option value="pending" className="text-slate-900">Pending</option>
                <option value="partial" className="text-slate-900">Partial</option>
                <option value="completed" className="text-slate-900">Completed</option>
              </select>
            </div>
          </div>
          
          <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
            <Link href="/clients">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary" disabled={loading}>
              <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-check"}></i> 
              {loading ? "Saving..." : "Save Client"}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}