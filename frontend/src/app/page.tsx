"use client";
import Link from "next/link";
import { useState, useEffect } from "react";

const modules = [
  { title: "Billing & Quotes", icon: "fa-file-invoice", desc: "Invoices, Quotations, PDFs", href: "/billing", accent: "from-indigo-500 to-indigo-600", shadow: "rgba(99,102,241,0.35)" },
  { title: "Clients CRM", icon: "fa-users", desc: "Manage Client Database", href: "/clients", accent: "from-pink-500 to-pink-600", shadow: "rgba(236,72,153,0.35)" },
  { title: "Projects", icon: "fa-diagram-project", desc: "Track Progress & Deadlines", href: "/projects", accent: "from-orange-500 to-orange-600", shadow: "rgba(249,115,22,0.35)" },
  { title: "Task Manager", icon: "fa-bars-progress", desc: "Kanban Task Board", href: "/tasks", accent: "from-purple-500 to-purple-600", shadow: "rgba(168,85,247,0.35)" },
  { title: "Employees", icon: "fa-id-card", desc: "Staff Records", href: "/hr", accent: "from-slate-500 to-slate-600", shadow: "rgba(71,85,105,0.35)" },
  { title: "Attendance", icon: "fa-clock", desc: "Daily Tracker", href: "/hr/attendance", accent: "from-teal-500 to-teal-600", shadow: "rgba(20,184,166,0.35)" },
  { title: "Payroll", icon: "fa-money-bill-wave", desc: "Salary Processing", href: "/hr/payroll", accent: "from-emerald-500 to-emerald-600", shadow: "rgba(16,185,129,0.35)" },
  { title: "Leave Manager", icon: "fa-calendar-minus", desc: "Leave Applications", href: "/hr/leaves", accent: "from-cyan-500 to-cyan-600", shadow: "rgba(6,182,212,0.35)" },
  { title: "Finance", icon: "fa-wallet", desc: "Income, Expense, Profit", href: "/finance", accent: "from-lime-500 to-lime-600", shadow: "rgba(132,204,22,0.3)" },
  { title: "Marketing Hub", icon: "fa-bullhorn", desc: "Ads, Campaigns & Posts", href: "/marketing", accent: "from-violet-500 to-violet-600", shadow: "rgba(139,92,246,0.35)" },
  { title: "Sales & Leads", icon: "fa-chart-line", desc: "CRM Pipeline", href: "/sales", accent: "from-amber-500 to-amber-600", shadow: "rgba(245,158,11,0.35)" },
  { title: "Legal Docs", icon: "fa-file-contract", desc: "Contracts, NDAs", href: "/legal", accent: "from-slate-500 to-slate-600", shadow: "rgba(100,116,139,0.3)" },
  { title: "Certificates", icon: "fa-certificate", desc: "Internship & MoUs", href: "/certificates", accent: "from-yellow-500 to-yellow-600", shadow: "rgba(234,179,8,0.35)" },
  { title: "Social Media", icon: "fa-share-nodes", desc: "Manage Accounts", href: "/social", accent: "from-rose-500 to-rose-600", shadow: "rgba(244,63,94,0.35)" },
  { title: "Research & Dev", icon: "fa-flask", desc: "Documents & Research", href: "/research", accent: "from-indigo-500 to-indigo-600", shadow: "rgba(99,102,241,0.3)" },
  { title: "Team Chat", icon: "fa-comments", desc: "Internal Messaging", href: "/chat", accent: "from-purple-600 to-purple-700", shadow: "rgba(124,58,237,0.35)" },
  { title: "Calendar", icon: "fa-calendar-days", desc: "Schedule & Events", href: "/calendar", accent: "from-sky-500 to-sky-600", shadow: "rgba(14,165,233,0.35)" },
  { title: "System Users", icon: "fa-users-gear", desc: "Access & Permissions", href: "/users", accent: "from-gray-500 to-gray-600", shadow: "rgba(75,85,99,0.3)" },
  { title: "Settings", icon: "fa-gear", desc: "System Configuration", href: "/settings", accent: "from-gray-500 to-gray-600", shadow: "rgba(107,114,128,0.3)" },
];

const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000';

const kpis = [
  { label: "Total Clients", key: "total_clients", icon: "fa-users", grad: "bg-gradient-to-br from-pink-500 to-rose-700", shadow: "rgba(236,72,153,0.4)" },
  { label: "Active Projects", key: "active_projects", icon: "fa-diagram-project", grad: "bg-gradient-to-br from-orange-500 to-red-700", shadow: "rgba(249,115,22,0.4)" },
  { label: "Monthly Revenue", key: "monthly_revenue", icon: "fa-wallet", grad: "bg-gradient-to-br from-emerald-500 to-emerald-700", shadow: "rgba(16,185,129,0.4)" },
  { label: "Pending Tasks", key: "pending_tasks", icon: "fa-bars-progress", grad: "bg-gradient-to-br from-violet-500 to-purple-700", shadow: "rgba(139,92,246,0.4)" },
];

export default function Home() {
  const [mounted, setMounted] = useState(false);
  const [time, setTime] = useState<Date | null>(null);
  const [stats, setStats] = useState<Record<string, number>>({});
  const [statsLoading, setStatsLoading] = useState(true);

  useEffect(() => {
    setMounted(true);
    setTime(new Date());

    fetch(`${API_URL}/api/dashboard/stats`)
      .then(res => res.json())
      .then(data => {
        setStats(data);
        setStatsLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch stats:', err);
        setStatsLoading(false);
      });
  }, []);

  const getGreeting = () => {
    if (!time) return "Welcome";
    const hour = time.getHours();
    return hour < 12 ? "Good Morning" : hour < 17 ? "Good Afternoon" : "Good Evening";
  };

  const getDateString = () => {
    if (!time) return "";
    return time.toLocaleDateString("en-IN", { weekday: "long", day: "numeric", month: "long", year: "numeric" });
  };

  return (
    <div className="flex flex-col gap-8">

      {/* Header */}
      <div>
        <div className="flex items-center gap-3 mb-1.5">
          <div className="w-[3px] h-[28px] rounded-full bg-gradient-to-b from-indigo-500 to-purple-500 shadow-[0_0_12px_rgba(99,102,241,0.6)]" />
          <h1 className="text-[26px] font-extrabold text-slate-900 dark:text-white m-0 tracking-tight">
            {getGreeting()}, Admin 👋
          </h1>
        </div>
        <p className="text-sm text-slate-500 dark:text-slate-400 ml-[15px] m-0 min-h-[20px]">
          {getDateString()}
        </p>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {kpis.map((k) => (
          <div
            key={k.label}
            className={`relative overflow-hidden rounded-[20px] p-[22px] text-white border border-white/15 dark:border-white/10 ${k.grad}`}
            style={{ boxShadow: `0 8px 32px ${k.shadow}` }}
          >
            <div className="absolute -top-5 -right-5 w-20 h-20 rounded-full bg-white/10" />
            <div className="flex justify-between items-start mb-4">
              <div>
                <div className="text-[11px] font-bold uppercase tracking-widest opacity-80 mb-1.5">{k.label}</div>
                <div className="text-[28px] font-extrabold">
                  {statsLoading ? (
                    <span className="inline-block w-8 h-8 border-3 border-white/30 border-t-white rounded-full animate-spin" />
                  ) : (
                    k.key === 'monthly_revenue'
                      ? `₹${Number(stats[k.key] || 0).toLocaleString('en-IN')}`
                      : (stats[k.key] ?? '—')
                  )}
                </div>
              </div>
              <div className="w-11 h-11 rounded-xl bg-white/20 flex items-center justify-center text-lg">
                <i className={`fa-solid ${k.icon}`}></i>
              </div>
            </div>
            <div className="text-[11px] opacity-70">
              {statsLoading ? 'Loading...' : 'Live from database'}
            </div>
          </div>
        ))}
      </div>

      {/* Module Grid */}
      <div>
        <div className="flex items-center gap-2.5 mb-4">
          <i className="fas fa-grid-2 text-indigo-500"></i>
          <span className="text-[16px] font-bold text-slate-800 dark:text-white/90">All Modules</span>
          <span className="text-[11px] font-semibold px-2.5 py-0.5 rounded-full bg-indigo-500/10 text-indigo-600 dark:text-indigo-400 border border-indigo-500/20">
            {modules.length}
          </span>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-3.5">
          {modules.map((m) => (
            <Link
              key={m.title}
              href={m.href}
              className="group block p-5 rounded-[18px] bg-[var(--glass-card-bg)] backdrop-blur-[20px] border border-[var(--glass-card-border)] no-underline transition-all duration-250 cursor-pointer relative overflow-hidden hover:-translate-y-1 hover:bg-[var(--glass-panel-bg)] hover:border-indigo-500/30"
              style={{ boxShadow: `0 4px 15px rgba(0,0,0,0.03)` }}
            >
              <div
                className={`w-11 h-11 rounded-[13px] bg-gradient-to-br ${m.accent} flex items-center justify-center text-lg text-white mb-3.5`}
                style={{ boxShadow: `0 6px 16px ${m.shadow}` }}
              >
                <i className={`fa-solid ${m.icon}`}></i>
              </div>
              <div className="text-[13px] font-bold text-slate-800 dark:text-white/95 mb-1.5 leading-tight">
                {m.title}
              </div>
              <div className="text-[11px] text-slate-500 dark:text-slate-400 leading-snug">
                {m.desc}
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
