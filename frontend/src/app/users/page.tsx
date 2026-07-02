"use client";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { useState } from "react";

const roleColors: Record<string, string> = {
  admin: "bg-red-100 text-red-700",
  manager: "bg-purple-100 text-purple-700",
  employee: "bg-blue-100 text-blue-700",
  college_staff: "bg-amber-100 text-amber-700",
  editor: "bg-teal-100 text-teal-700",
  viewer: "bg-slate-100 text-slate-600",
};

const modules = ["billing", "clients", "projects", "hr", "attendance", "finance", "legal", "social", "marketing", "tasks", "certificates", "research", "personal"];

const sampleUsers = [
  { id: 1, username: "admin", email: "admin@webworks.com", role: "admin", permissions: modules, is_online: true, location: "Mumbai" },
  { id: 2, username: "john.doe", email: "john@webworks.com", role: "employee", permissions: ["tasks", "attendance"], is_online: false, location: "Delhi" },
  { id: 3, username: "priya.patel", email: "priya@webworks.com", role: "manager", permissions: ["billing", "clients", "projects", "hr"], is_online: true, location: "Pune" },
];

export default function UsersPage() {
  const [users, setUsers] = useState(sampleUsers);
  const [showAdd, setShowAdd] = useState(false);
  const [editUser, setEditUser] = useState<any>(null);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-slate-600 to-slate-800 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">System Users</h2>
        </div>
        <Button variant="primary" onClick={() => setShowAdd(true)}><i className="fa-solid fa-user-plus"></i> Add New User</Button>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="px-6 py-4 flex justify-between items-center border-b border-slate-100">
          <h3 className="font-bold text-slate-700">User Directory</h3>
          <span className="text-xs text-slate-500 bg-slate-100 px-3 py-1.5 rounded-full">
            <i className="fa-solid fa-circle text-emerald-500 text-xs mr-1"></i>
            {users.filter((u) => u.is_online).length} Online
          </span>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">User</th>
                <th className="px-6 py-4">Role</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Location</th>
                <th className="px-6 py-4 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {users.map((user) => (
                <tr key={user.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className={`w-10 h-10 rounded-full flex items-center justify-center font-bold text-sm border-2 border-white shadow-sm ${user.is_online ? "bg-emerald-100 text-emerald-700" : "bg-slate-100 text-slate-500"}`}>
                        {user.username.charAt(0).toUpperCase()}
                      </div>
                      <div>
                        <div className="font-bold text-slate-800">{user.username}</div>
                        <div className="text-xs text-slate-500">{user.email}</div>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wide ${roleColors[user.role] || "bg-slate-100 text-slate-600"}`}>{user.role}</span>
                  </td>
                  <td className="px-6 py-4 text-sm">
                    {user.is_online ? (
                      <span className="text-emerald-600 font-semibold"><i className="fa-solid fa-wifi text-xs mr-1"></i>Online</span>
                    ) : (
                      <span className="text-slate-400">Offline</span>
                    )}
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600">{user.location}</td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2 justify-end">
                      <button onClick={() => setEditUser(user)} className="w-8 h-8 bg-blue-50 text-blue-600 hover:bg-blue-100 rounded-lg flex items-center justify-center transition-colors">
                        <i className="fa-solid fa-pen-to-square"></i>
                      </button>
                      {user.username !== "admin" && (
                        <button onClick={() => setUsers(users.filter((u) => u.id !== user.id))} className="w-8 h-8 bg-red-50 text-red-500 hover:bg-red-100 rounded-lg flex items-center justify-center transition-colors">
                          <i className="fa-solid fa-trash"></i>
                        </button>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </GlassCard>

      {/* Add User Modal */}
      {showAdd && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <GlassCard className="w-full max-w-md bg-white max-h-[90vh] overflow-y-auto">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-bold text-slate-800">Create New User</h3>
              <button onClick={() => setShowAdd(false)} className="text-slate-400 hover:text-slate-600 text-xl"><i className="fa-solid fa-xmark"></i></button>
            </div>
            <form className="space-y-4" onSubmit={(e) => { e.preventDefault(); setShowAdd(false); }}>
              <div className="grid grid-cols-2 gap-4">
                <Input label="Username" placeholder="john.doe" required />
                <div className="flex flex-col gap-2">
                  <label className="text-sm font-semibold text-slate-700">Role</label>
                  <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-indigo-500 transition-all">
                    {Object.keys(roleColors).map((r) => <option key={r} value={r}>{r}</option>)}
                  </select>
                </div>
              </div>
              <Input label="Email" type="email" required />
              <Input label="Password" type="password" required />
              <div>
                <label className="text-sm font-semibold text-slate-700 mb-2 block">Access Permissions</label>
                <div className="grid grid-cols-2 gap-2 p-3 border-2 border-slate-200 rounded-xl bg-slate-50 max-h-36 overflow-y-auto">
                  {modules.map((m) => (
                    <label key={m} className="flex items-center gap-2 text-xs text-slate-600 cursor-pointer">
                      <input type="checkbox" className="accent-indigo-500 w-4 h-4" /> {m}
                    </label>
                  ))}
                </div>
              </div>
              <Button type="submit" variant="primary" className="w-full !justify-center">Create Account</Button>
            </form>
          </GlassCard>
        </div>
      )}
    </div>
  );
}