"use client";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { useState, useEffect } from "react";

const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000';

interface Project {
  id: number;
  title: string;
  client_name: string;
  deadline: string;
  budget: number;
  status: string;
  done_tasks: number;
  total_tasks: number;
}

const statusConfig: Record<string, { bg: string; text: string }> = {
  "Not Started": { bg: "bg-slate-100", text: "text-slate-600" },
  "In Progress": { bg: "bg-blue-100", text: "text-blue-700" },
  Completed: { bg: "bg-emerald-100", text: "text-emerald-700" },
  "On Hold": { bg: "bg-amber-100", text: "text-amber-700" },
  Cancelled: { bg: "bg-red-100", text: "text-red-600" },
};

export default function ProjectsPage() {
  const [filter, setFilter] = useState("All");
  const [projects, setProjects] = useState<Project[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/projects`)
      .then(res => res.json())
      .then(data => {
        setProjects(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch projects:', err);
        setLoading(false);
      });
  }, []);

  const filtered = filter === "All" ? projects : projects.filter((p) => p.status === filter);

  const total = projects.length;
  const active = projects.filter((p) => p.status === "In Progress").length;
  const completed = projects.filter((p) => p.status === "Completed").length;
  const totalBudget = projects.reduce((sum, p) => sum + Number(p.budget || 0), 0);

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-orange-500 to-amber-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Projects</h2>
        </div>
        <Link href="/projects/add"><Button variant="primary"><i className="fa-solid fa-plus"></i> New Project</Button></Link>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        {[
          { label: "Total Projects", value: total, sub: "Lifetime Count", grad: "from-blue-500 to-indigo-500", text: "text-white" },
          { label: "Active Projects", value: active, sub: "In Progress", grad: "", text: "" },
          { label: "Completed", value: completed, sub: "Successfully Delivered", grad: "", text: "" },
          { label: "Total Budget", value: `₹${(totalBudget / 1000).toFixed(0)}K`, sub: "Project Value", grad: "", text: "" },
        ].map((s) => (
          <GlassCard 
            key={s.label} 
            className={s.grad ? "border-0 text-white" : ""}
            style={s.grad ? { background: "linear-gradient(135deg, #3b82f6, #4f46e5)", color: "white" } : undefined}
          >
            <div className={s.grad ? "text-white" : "text-slate-500 dark:text-slate-400"}>
              <div className="text-sm font-bold mb-1">{s.label}</div>
            </div>
            <div className={`text-3xl font-extrabold ${s.grad ? "text-white" : "text-slate-800 dark:text-slate-100"}`}>
              {loading ? '...' : s.value}
            </div>
            <div className={`text-xs mt-1 ${s.grad ? "text-white/80" : "text-slate-400 dark:text-slate-500"}`}>
              {s.sub}
            </div>
          </GlassCard>
        ))}
      </div>

      {/* Filter tabs + list */}
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div className="flex gap-2">
          {["All", "In Progress", "Completed", "On Hold"].map((f) => (
            <button key={f} onClick={() => setFilter(f)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all ${filter === f ? "bg-blue-500 text-white shadow-md" : "bg-white border border-slate-200 text-slate-600 hover:bg-slate-50"}`}>{f}</button>
          ))}
        </div>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Project Name</th>
                <th className="px-6 py-4">Client</th>
                <th className="px-6 py-4">Timeline</th>
                <th className="px-6 py-4">Tasks</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {loading ? (
                <tr><td colSpan={6} className="px-6 py-12 text-center text-slate-400">Loading projects from database...</td></tr>
              ) : filtered.length === 0 ? (
                <tr><td colSpan={6} className="px-6 py-12 text-center text-slate-400">No projects found.</td></tr>
              ) : filtered.map((proj) => {
                const prog = proj.total_tasks > 0 ? Math.round((proj.done_tasks / proj.total_tasks) * 100) : 0;
                const daysLeft = proj.deadline ? Math.ceil((new Date(proj.deadline).getTime() - Date.now()) / 86400000) : 0;
                const cfg = statusConfig[proj.status] || { bg: "bg-slate-100", text: "text-slate-600" };
                return (
                  <tr key={proj.id} className="hover:bg-slate-50 transition-colors cursor-pointer">
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800">{proj.title}</div>
                      <div className="text-sm text-slate-500" suppressHydrationWarning>Budget: ₹{Number(proj.budget || 0).toLocaleString()}</div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-2">
                        <div className="w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center font-bold text-sm">{(proj.client_name || '?').charAt(0)}</div>
                        <span className="text-sm font-medium text-slate-700">{proj.client_name || 'Unknown'}</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm">
                      <div className={`font-semibold ${daysLeft < 0 ? "text-red-500" : daysLeft < 7 ? "text-amber-500" : "text-slate-600"}`}>
                        <i className="fa-regular fa-clock mr-1"></i>
                        {proj.status === "Completed" ? "Completed" : daysLeft < 0 ? `${Math.abs(daysLeft)} Days Overdue` : `${daysLeft} Days Left`}
                      </div>
                      {proj.deadline && <div className="text-xs text-slate-400" suppressHydrationWarning>Due: {new Date(proj.deadline).toLocaleDateString()}</div>}
                    </td>
                    <td className="px-6 py-4 w-40">
                      <div className="flex justify-between text-xs text-slate-500 mb-1">
                        <span>Progress</span><span>{prog}%</span>
                      </div>
                      <div className="w-full h-1.5 bg-slate-100 rounded-full overflow-hidden">
                        <div className={`h-full rounded-full ${prog === 100 ? "bg-emerald-500" : "bg-blue-500"}`} style={{ width: `${prog}%` }}></div>
                      </div>
                      <div className="text-xs text-slate-400 mt-1">{proj.done_tasks}/{proj.total_tasks} Tasks</div>
                    </td>
                    <td className="px-6 py-4">
                      <span className={`px-3 py-1 rounded-full text-xs font-bold ${cfg.bg} ${cfg.text}`}>{proj.status}</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <button className="w-8 h-8 rounded-lg bg-slate-100 text-slate-600 hover:bg-slate-200 flex items-center justify-center transition-colors">
                          <i className="fa-solid fa-chevron-right"></i>
                        </button>
                        <button className="w-8 h-8 rounded-lg bg-red-50 text-red-500 hover:bg-red-100 flex items-center justify-center transition-colors">
                          <i className="fa-solid fa-trash"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}