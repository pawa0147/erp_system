"use client";

import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { updateEmployee } from "@/app/actions/hr";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function EditEmployeeForm({ employee }: { employee: any }) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleSubmit(formData: FormData) {
    setLoading(true);
    setError("");
    const res = await updateEmployee(employee.id, formData);
    if (res.success) {
      router.push("/hr");
    } else {
      setError(res.error || "An error occurred");
      setLoading(false);
    }
  }

  // Format date to YYYY-MM-DD for the input type="date"
  const formattedJoiningDate = employee.joining_date 
    ? new Date(employee.joining_date).toISOString().split('T')[0] 
    : "";

  return (
    <form action={handleSubmit} className="space-y-8">
      {error && <div className="mb-4 text-sm font-semibold text-red-500">{error}</div>}
      
      {/* Section 1: Personal Info */}
      <div>
        <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4 border-b border-slate-200 dark:border-white/10 pb-2">
          Personal Information
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Input name="full_name" label="Full Name" defaultValue={employee.full_name} required />
          <Input name="email" label="Email Address" type="email" defaultValue={employee.email || ""} />
          <Input name="phone" label="Phone Number" defaultValue={employee.phone || ""} />
          <Input name="address" label="Home Address" defaultValue={employee.address || ""} />
        </div>
      </div>

      {/* Section 2: Employment Details */}
      <div>
        <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4 border-b border-slate-200 dark:border-white/10 pb-2">
          Employment Details
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Input name="designation" label="Designation / Role" defaultValue={employee.designation} required />
          
          <div className="flex flex-col gap-1.5 w-full">
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
              Employment Type
            </label>
            <select
              name="employment_type"
              defaultValue={employee.employment_type}
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
            >
              <option value="Full Time">Full Time</option>
              <option value="Part Time">Part Time</option>
              <option value="Contract">Contract</option>
              <option value="Internship">Internship</option>
            </select>
          </div>

          <Input name="base_salary" label="Base Salary (₹)" type="number" step="0.01" defaultValue={employee.base_salary} required />
          <Input name="joining_date" label="Date of Joining" type="date" defaultValue={formattedJoiningDate} />
          <Input name="college_name" label="College/University" defaultValue={employee.college_name || ""} />
        </div>
      </div>

      {/* Section 3: Financials & ID */}
      <div>
        <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200 mb-4 border-b border-slate-200 dark:border-white/10 pb-2">
          Banking & Identity
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Input name="bank_name" label="Bank Name" defaultValue={employee.bank_name || ""} />
          <Input name="account_number" label="Account Number" defaultValue={employee.account_number || ""} />
          <Input name="ifsc_code" label="IFSC Code" defaultValue={employee.ifsc_code || ""} />
          <Input name="pan_card" label="PAN Card Number" defaultValue={employee.pan_card || ""} />
        </div>
      </div>

      <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
        <Link href="/hr">
          <Button type="button" variant="secondary">Cancel</Button>
        </Link>
        <Button type="submit" variant="primary" disabled={loading}>
          <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-check"}></i> 
          {loading ? "Updating..." : "Update Employee"}
        </Button>
      </div>
    </form>
  );
}
