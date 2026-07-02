"use client";
import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { useState } from "react";

export default function AddEmployeePage() {
  const [empType, setEmpType] = useState("Full Time");

  return (
    <div className="space-y-6 max-w-4xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-teal-400 to-emerald-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Employee Onboarding</h2>
        </div>
        <Link href="/hr">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to Directory
          </Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-8">
          {/* Personal Info */}
          <div>
            <h3 className="text-lg font-bold text-teal-600 mb-4 border-b border-slate-100 pb-2">Personal Information</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <Input label="Full Name *" placeholder="e.g. Amit Sharma" required />
              <Input label="Designation *" placeholder="e.g. Senior Developer" required />
              
              <div className="flex flex-col gap-2">
                <label className="text-sm font-semibold text-slate-700">Employment Type</label>
                <select 
                  className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 transition-all"
                  value={empType}
                  onChange={(e) => setEmpType(e.target.value)}
                >
                  <option value="Full Time">Full Time</option>
                  <option value="Part Time">Part Time</option>
                  <option value="Intern">Intern</option>
                  <option value="Contract">Contract</option>
                </select>
              </div>

              {empType === "Intern" && (
                <Input label="College Name" placeholder="Enter college name" />
              )}
              
              <Input label="Email Address" type="email" placeholder="amit@example.com" />
              <Input label="Phone Number" placeholder="+91 98765 43210" />
            </div>
            
            <div className="mt-6">
              <Input label="Current Address" placeholder="Enter full residential address..." />
            </div>
          </div>

          {/* Payroll Info */}
          <div>
            <h3 className="text-lg font-bold text-teal-600 mb-4 border-b border-slate-100 pb-2">Payroll & Banking</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <Input label="Base Monthly Salary (₹) *" type="number" placeholder="0" required />
              <Input label="Joining Date" type="date" defaultValue={new Date().toISOString().split('T')[0]} />
              <Input label="Bank Name" placeholder="e.g. HDFC Bank" />
              <Input label="Account Number" />
              <Input label="IFSC Code" />
              <Input label="PAN Card (Optional)" />
            </div>
          </div>

          <div className="pt-6 border-t border-slate-100 flex justify-end gap-4">
            <Link href="/hr">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-teal-500 !to-emerald-500 !shadow-teal-500/30">
              <i className="fa-solid fa-user-check"></i> Complete Onboarding
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}