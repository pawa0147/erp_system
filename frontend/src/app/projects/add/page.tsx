import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function AddProjectPage() {
  return (
    <div className="space-y-6 max-w-3xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-orange-500 to-amber-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">New Project</h2>
        </div>
        <Link href="/projects"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6">
          <Input 
            label={<>Project Title <span className="text-red-500">*</span></>} 
            placeholder="e.g. E-Commerce Website Redesign" 
            required 
          />

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">
                Client <span className="text-red-500">*</span>
              </label>
              <select required className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-orange-500 transition-all">
                <option value="">Select a Client</option>
                <option>Acme Corp</option>
                <option>Globex Inc</option>
                <option>TechCo</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Status</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-orange-500 transition-all">
                <option>In Progress</option>
                <option>On Hold</option>
                <option>Completed</option>
                <option>Cancelled</option>
              </select>
            </div>
            <Input label="Start Date" type="date" defaultValue={new Date().toISOString().split("T")[0]} />
            <Input label="Deadline" type="date" />
          </div>

          <Input label="Budget (₹)" type="number" placeholder="0" />

          <div>
            <label className="text-sm font-semibold text-slate-700 mb-2 block">Project Description</label>
            <textarea rows={4} placeholder="Describe the project scope, deliverables, and objectives..."
              className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10 transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-100 flex justify-end gap-4">
            <Link href="/projects"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-orange-500 !to-amber-500 !shadow-orange-500/30">
              <i className="fa-solid fa-plus"></i> Create Project
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}