"use client";
import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { DeleteButton } from "./DeleteButton";

const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000';

export default function ClientsPage() {
  const [clients, setClients] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/clients`)
      .then(res => res.json())
      .then(data => {
        setClients(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch clients:', err);
        setLoading(false);
      });
  }, []);

  if (loading) {
    return <div className="p-8 text-center text-slate-500">Loading clients...</div>;
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-pink-500 to-rose-500 rounded-full shadow-[0_0_10px_rgba(236,72,153,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Clients Directory</h2>
        </div>
        <Link href="/clients/add">
          <Button variant="primary">
            <i className="fa-solid fa-user-plus"></i> Add New Client
          </Button>
        </Link>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">ID</th>
                <th className="px-6 py-4">Name / Company</th>
                <th className="px-6 py-4">Contact Info</th>
                <th className="px-6 py-4">Financials</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Created</th>
                <th className="px-6 py-4">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-black/5 dark:divide-white/5">
              {clients.map((client) => (
                <tr key={client.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4 font-semibold text-slate-500 dark:text-slate-400">#{client.id}</td>
                  <td className="px-6 py-4">
                    <div className="font-bold text-slate-800 dark:text-slate-200">{client.name}</div>
                    {client.company_name && <div className="text-sm text-slate-500 dark:text-slate-400">{client.company_name}</div>}
                    <div className="text-xs text-slate-400 dark:text-slate-500 mt-1">Source: {client.referral_source || "N/A"}</div>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-300 space-y-1">
                    {client.email && <div><i className="fa-regular fa-envelope w-4 mr-1 opacity-70"></i>{client.email}</div>}
                    {client.phone && <div><i className="fa-solid fa-phone w-4 mr-1 opacity-70"></i>{client.phone}</div>}
                  </td>
                  <td className="px-6 py-4 text-sm">
                    <div className="font-semibold text-slate-700 dark:text-slate-300">Total: ₹{(client.total_project_amount || 0).toLocaleString()}</div>
                    <div className="text-emerald-600 dark:text-emerald-400">Received: ₹{(client.amount_received || 0).toLocaleString()}</div>
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase ${
                      client.payment_status === "completed" 
                        ? "bg-emerald-100 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400" 
                        : client.payment_status === "partial"
                        ? "bg-amber-100 text-amber-700 dark:bg-amber-500/10 dark:text-amber-400"
                        : "bg-rose-100 text-rose-700 dark:bg-rose-500/10 dark:text-rose-400"
                    }`}>
                      {client.payment_status || "Pending"}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-xs text-slate-500 dark:text-slate-400">
                    {new Date(client.created_at).toLocaleDateString()}<br/>
                    {new Date(client.created_at).toLocaleTimeString([], {hour: "2-digit", minute:"2-digit"})}
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <Link href={`/clients/edit/${client.id}`} className="w-8 h-8 rounded-lg bg-blue-50 dark:bg-blue-500/10 text-blue-600 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-500/20 transition-colors flex items-center justify-center">
                        <i className="fa-solid fa-pen-to-square"></i>
                      </Link>
                      <DeleteButton id={client.id} />
                    </div>
                  </td>
                </tr>
              ))}
              
              {clients.length === 0 && (
                <tr>
                  <td colSpan={7} className="px-6 py-12 text-center text-slate-500 dark:text-slate-400">
                    <div className="mb-3 text-4xl opacity-30"><i className="fa-solid fa-users-slash"></i></div>
                    <div className="font-semibold text-lg mb-1">No clients found</div>
                    <div>Add your first client to get started.</div>
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );
}