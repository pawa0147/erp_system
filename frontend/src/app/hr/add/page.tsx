"use client";

import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { addEmployee } from "../../actions/hr";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function AddEmployeePage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleSubmit(formData: FormData) {
    setLoading(true);
    setError("");
    const res = await addEmployee(formData);
    if (res.success) {
      router.push("/hr");
    } else {
      setError(res.error || "An error occurred");
      setLoading(false);
    }
  }

  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-600 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Add New Employee</h2>
        </div>
        <Link href="/hr">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to Directory
          </Button>
        </Link>
      </div>

      <GlassCard>
        {error && <div className="mb-4 text-sm font-semibold text-red-500">{error}</div>}
        <form action={handleSubmit} className="space-y-8">
          
          {/* Section 1: Personal Info */}
          <div>
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4 border-b border-slate-200 dark:border-white/10 pb-2">
              Personal Information
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <Input name="full_name" label={<>Full Name <span className="text-red-500">*</span></>} placeholder="e.g. John Doe" required />
              <Input name="email" label="Email Address" type="email" placeholder="john@example.com" />
              <Input name="phone" label="Phone Number" placeholder="+91..." />
              <Input name="address" label="Home Address" placeholder="Full address..." />
            </div>
          </div>

          {/* Section 2: Employment Details */}
          <div>
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4 border-b border-slate-200 dark:border-white/10 pb-2">
              Employment Details
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <Input name="designation" label={<>Designation / Role <span className="text-red-500">*</span></>} placeholder="e.g. Software Engineer" required />
              
              <div className="flex flex-col gap-1.5 w-full">
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                  Employment Type
                </label>
                <select
                  name="employment_type"
                  className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
                >
                  <option value="Full Time">Full Time</option>
                  <option value="Part Time">Part Time</option>
                  <option value="Contract">Contract</option>
                  <option value="Internship">Internship</option>
                </select>
              </div>

              <Input name="base_salary" label={<>Base Salary (₹) <span className="text-red-500">*</span></>} type="number" step="0.01" placeholder="0.00" required />
              <Input name="joining_date" label="Date of Joining" type="date" />
              <Input name="college_name" label="College/University" placeholder="Highest degree..." />
            </div>
          </div>

          {/* Section 3: Financials & ID */}
          <div>
            <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4 border-b border-slate-200 dark:border-white/10 pb-2">
              Banking & Identity
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <Input name="bank_name" label="Bank Name" placeholder="e.g. HDFC Bank" />
              <Input name="account_number" label="Account Number" placeholder="Account No." />
              <Input name="ifsc_code" label="IFSC Code" placeholder="IFSC" />
              <Input name="pan_card" label="PAN Card Number" placeholder="PAN No." />
            </div>
          </div>

          <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
            <Link href="/hr">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary" disabled={loading}>
              <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-check"}></i> 
              {loading ? "Saving..." : "Save Employee"}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
