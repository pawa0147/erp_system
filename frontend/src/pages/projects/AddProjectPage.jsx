import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

export default function AddProjectPage() {
  return (
    <div className="space-y-6 max-w-3xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-orange-500 to-amber-500 rounded-full shadow-[0_0_10px_rgba(249,115,22,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">New Project</h2>
        </div>
        <Link to="/projects"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button></Link>
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
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Client <span className="text-red-500">*</span>
              </label>
              <select required className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option value="" className="text-slate-800 dark:bg-slate-800">Select a Client</option>
                <option className="text-slate-800 dark:bg-slate-800">Acme Corp</option>
                <option className="text-slate-800 dark:bg-slate-800">Globex Inc</option>
                <option className="text-slate-800 dark:bg-slate-800">TechCo</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Status</label>
              <select className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">In Progress</option>
                <option className="text-slate-800 dark:bg-slate-800">On Hold</option>
                <option className="text-slate-800 dark:bg-slate-800">Completed</option>
                <option className="text-slate-800 dark:bg-slate-800">Cancelled</option>
              </select>
            </div>
            <Input label="Start Date" type="date" defaultValue={new Date().toISOString().split("T")[0]} />
            <Input label="Deadline" type="date" />
          </div>

          <Input label="Budget (₹)" type="number" placeholder="0" />

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Project Description</label>
            <textarea rows={4} placeholder="Describe the project scope, deliverables, and objectives..."
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/projects"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-orange-500 !to-amber-500 !shadow-orange-500/30">
              <i className="fa-solid fa-plus"></i> Create Project
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
