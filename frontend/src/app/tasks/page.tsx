"use client";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { useState, useEffect } from "react";

const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000';

const priorityColors: Record<string, string> = {
  Urgent: "text-red-500",
  High: "text-amber-500",
  Medium: "text-blue-500",
  Low: "text-emerald-500",
};
const priorityDot: Record<string, string> = {
  Urgent: "bg-red-500",
  High: "bg-amber-500",
  Medium: "bg-blue-500",
  Low: "bg-emerald-500",
};

export default function TasksPage() {
  const [tasks, setTasks] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");

  useEffect(() => {
    fetch(`${API_URL}/api/tasks`)
      .then(res => res.json())
      .then(data => {
        setTasks(Array.isArray(data) ? data : []);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch tasks:', err);
        setLoading(false);
      });
  }, []);

  const filtered = tasks.filter((t) => (t.title || "").toLowerCase().includes(search.toLowerCase()));
  const columns: { label: string; status: string; color: string; dot: string; badge: string }[] = [
    { label: "To Do / Pending", status: "Pending", color: "border-amber-400", dot: "bg-amber-400", badge: "bg-amber-50 text-amber-700" },
    { label: "In Progress", status: "In Progress", color: "border-blue-500", dot: "bg-blue-500", badge: "bg-blue-50 text-blue-700" },
    { label: "Completed", status: "Completed", color: "border-emerald-500", dot: "bg-emerald-500", badge: "bg-emerald-50 text-emerald-700" },
  ];

  const markDone = (id: number) => setTasks(tasks.map((t) => t.id === id ? { ...t, status: "Completed" } : t));
  const deleteTask = (id: number) => setTasks(tasks.filter((t) => t.id !== id));

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-4 mb-4">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-fuchsia-500 to-purple-500 rounded-full"></div>
          <span className="text-2xl font-extrabold text-slate-800">Task Board</span>
          <span className="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-bold">{tasks.length} Tasks</span>
        </div>
        <div className="flex items-center gap-3">
          <div className="relative">
            <i className="fa-solid fa-magnifying-glass absolute left-4 top-1/2 -translate-y-1/2 text-slate-400"></i>
            <input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Search tasks..."
              className="py-2.5 px-4 pl-10 rounded-xl border-2 border-slate-200 bg-white text-slate-800 text-sm outline-none focus:border-purple-500 focus:ring-4 focus:ring-purple-500/10 w-64 transition-all" />
          </div>
          <Link href="/tasks/add"><Button variant="primary" className="!bg-gradient-to-r !from-fuchsia-500 !to-purple-500 !shadow-fuchsia-500/30"><i className="fa-solid fa-plus"></i> Create Task</Button></Link>
        </div>
      </div>

      <div className="flex gap-6 overflow-x-auto pb-4" style={{ minHeight: "calc(100vh - 260px)" }}>
        {columns.map((col) => {
          const colTasks = filtered.filter((t) => t.status === col.status);
          return (
            <div key={col.status} className={`flex-none w-80 bg-slate-50 rounded-2xl border border-slate-200 shadow-sm flex flex-col`}>
              <div className={`sticky top-0 px-5 py-4 bg-white rounded-t-2xl border-b border-slate-200 border-t-4 ${col.color} flex justify-between items-center z-10`}>
                <span className="font-bold text-slate-800 text-sm">{col.label}</span>
                <span className={`px-2.5 py-0.5 rounded-full text-xs font-bold ${col.badge}`}>{colTasks.length}</span>
              </div>
              <div className="flex-1 overflow-y-auto p-4 space-y-4">
                {colTasks.map((task) => (
                  <div key={task.id} className="bg-white rounded-xl p-4 shadow-sm border border-slate-100 hover:-translate-y-1 hover:shadow-md transition-all cursor-pointer">
                    <div className="flex justify-between items-center mb-3">
                      <div className={`flex items-center gap-1.5 text-xs font-bold ${priorityColors[task.priority || "Medium"]}`}>
                        <span className={`w-2 h-2 rounded-full ${priorityDot[task.priority || "Medium"]}`}></span>
                        {task.priority || "Medium"}
                      </div>
                      <span className="text-xs text-slate-400 font-medium">{new Date(task.due_date || new Date()).toLocaleDateString("en-IN", { month: "short", day: "numeric" })}</span>
                    </div>
                    <h4 className="font-semibold text-slate-800 text-sm mb-3 leading-snug">{task.title}</h4>
                    <div className="flex justify-between items-center pt-3 border-t border-slate-100">
                      <div className="flex items-center gap-2">
                        <div className="w-7 h-7 rounded-full bg-purple-100 text-purple-600 flex items-center justify-center font-bold text-xs">{(task.assigned_to_name || "?").charAt(0).toUpperCase()}</div>
                        <span className="text-xs text-slate-500 truncate max-w-[80px]">{task.assigned_to_name || "Unassigned"}</span>
                      </div>
                      <div className="flex gap-1.5">
                        {task.status !== "Completed" && (
                          <button onClick={() => markDone(task.id)} className="text-emerald-500 hover:text-emerald-600 p-1.5 transition-colors" title="Mark Done">
                            <i className="fa-solid fa-check"></i>
                          </button>
                        )}
                        <button onClick={() => deleteTask(task.id)} className="text-red-400 hover:text-red-600 p-1.5 transition-colors" title="Delete">
                          <i className="fa-regular fa-trash-can"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                ))}
                {colTasks.length === 0 && (
                  <div className="text-center py-8 text-slate-400 text-sm">
                    <i className="fa-regular fa-clipboard text-2xl mb-2 block opacity-40"></i>
                    No tasks here
                  </div>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}