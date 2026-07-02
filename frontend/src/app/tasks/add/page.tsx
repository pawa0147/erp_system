import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function AddTaskPage() {
  return (
    <div className="space-y-6 max-w-2xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-fuchsia-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Create Task</h2>
        </div>
        <Link href="/tasks"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back to Board</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6">
          <Input label="Task Title *" placeholder="e.g. Design homepage wireframes" required />

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Priority</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-purple-500 transition-all">
                <option>Medium</option>
                <option>Low</option>
                <option>High</option>
                <option>Urgent</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Status</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-purple-500 transition-all">
                <option>Pending</option>
                <option>In Progress</option>
                <option>Completed</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Assign To</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-purple-500 transition-all">
                <option>Amit Sharma</option>
                <option>Priya Patel</option>
                <option>Rahul Singh</option>
              </select>
            </div>
            <Input label="Due Date" type="date" defaultValue={new Date().toISOString().split("T")[0]} />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 mb-2 block">Description</label>
            <textarea rows={3} placeholder="Describe the task requirements..."
              className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-purple-500 focus:ring-4 focus:ring-purple-500/10 transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-100 flex justify-end gap-4">
            <Link href="/tasks"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-fuchsia-500 !to-purple-500 !shadow-purple-500/30">
              <i className="fa-solid fa-plus"></i> Create Task
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}