import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

export default function AddTaskPage() {
  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-fuchsia-500 to-purple-500 rounded-full shadow-[0_0_10px_rgba(217,70,239,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Create Task</h2>
        </div>
        <Link to="/tasks"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back to Board</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6">
          <Input label="Task Title *" placeholder="e.g. Design homepage wireframes" required />

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Priority</label>
              <select className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Medium</option>
                <option className="text-slate-800 dark:bg-slate-800">Low</option>
                <option className="text-slate-800 dark:bg-slate-800">High</option>
                <option className="text-slate-800 dark:bg-slate-800">Urgent</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Status</label>
              <select className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Pending</option>
                <option className="text-slate-800 dark:bg-slate-800">In Progress</option>
                <option className="text-slate-800 dark:bg-slate-800">Completed</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Assign To</label>
              <select className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800">Amit Sharma</option>
                <option className="text-slate-800 dark:bg-slate-800">Priya Patel</option>
                <option className="text-slate-800 dark:bg-slate-800">Rahul Singh</option>
              </select>
            </div>
            <Input label="Due Date" type="date" defaultValue={new Date().toISOString().split("T")[0]} />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Description</label>
            <textarea rows={3} placeholder="Describe the task requirements..."
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/tasks"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-fuchsia-500 !to-purple-500 !shadow-purple-500/30">
              <i className="fa-solid fa-plus"></i> Create Task
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
