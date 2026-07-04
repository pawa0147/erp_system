import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";

const roleColors = {
  admin: "bg-red-100 dark:bg-red-500/20 text-red-700 dark:text-red-400",
  manager: "bg-purple-100 dark:bg-purple-500/20 text-purple-700 dark:text-purple-400",
  employee: "bg-blue-100 dark:bg-blue-500/20 text-blue-700 dark:text-blue-400",
  college_staff: "bg-amber-100 dark:bg-amber-500/20 text-amber-700 dark:text-amber-400",
  editor: "bg-teal-100 dark:bg-teal-500/20 text-teal-700 dark:text-teal-400",
  viewer: "bg-slate-100 dark:bg-white/10 text-slate-600 dark:text-slate-400",
};

const modules = ["billing", "clients", "projects", "hr", "attendance", "finance", "legal", "social", "marketing", "tasks", "certificates", "research", "personal"];

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';


export default function SystemUsersPage() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    fetch(`${API_URL}/api/admin/users`)
      .then(res => res.ok ? res.json() : [])
      .then(data => setUsers(data))
      .catch(err => console.error(err));
  }, []);
  const [showAdd, setShowAdd] = useState(false);
  const [editUser, setEditUser] = useState(null);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-slate-600 to-slate-800 dark:from-slate-400 dark:to-slate-600 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">System Users</h2>
        </div>
        <Button variant="primary" onClick={() => setShowAdd(true)}><i className="fa-solid fa-user-plus"></i> Add New User</Button>
      </div>

      <GlassCard className="p-0 overflow-hidden">
        <div className="px-6 py-4 flex justify-between items-center border-b border-slate-100 dark:border-white/10">
          <h3 className="font-bold text-slate-700 dark:text-slate-300">User Directory</h3>
          <span className="text-xs text-slate-500 dark:text-slate-400 bg-slate-100 dark:bg-slate-800 px-3 py-1.5 rounded-full">
            <i className="fa-solid fa-users text-emerald-500 text-xs mr-1"></i>
            {users.length} Total
          </span>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 dark:bg-white/5 border-b border-slate-200 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">User</th>
                <th className="px-6 py-4">Role</th>
                <th className="px-6 py-4">Status</th>
                <th className="px-6 py-4">Location</th>
                <th className="px-6 py-4 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-white/5">
              {users.map((user) => (
                <tr key={user.id} className="hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className={`w-10 h-10 rounded-full flex items-center justify-center font-bold text-sm border-2 border-white dark:border-slate-800 shadow-sm bg-slate-100 dark:bg-white/10 text-slate-500 dark:text-slate-400`}>
                        {user.username.charAt(0).toUpperCase()}
                      </div>
                      <div>
                        <div className="font-bold text-slate-800 dark:text-slate-200">{user.username}</div>
                        <div className="text-xs text-slate-500 dark:text-slate-400">{user.email}</div>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wide ${roleColors[user.role] || "bg-slate-100 dark:bg-white/10 text-slate-600 dark:text-slate-400"}`}>{user.role}</span>
                  </td>
                  <td className="px-6 py-4 text-sm">
                    <span className="text-slate-400">Offline</span>
                  </td>
                  <td className="px-6 py-4 text-sm text-slate-600 dark:text-slate-400">Not recorded</td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2 justify-end">
                      <button onClick={() => setEditUser(user)} className="w-8 h-8 bg-blue-50 dark:bg-blue-500/10 text-blue-600 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-500/20 rounded-lg flex items-center justify-center transition-colors">
                        <i className="fa-solid fa-pen-to-square"></i>
                      </button>
                      {user.username !== "admin" && (
                        <button onClick={() => setUsers(users.filter((u) => u.id !== user.id))} className="w-8 h-8 bg-red-50 dark:bg-red-500/10 text-red-500 dark:text-red-400 hover:bg-red-100 dark:hover:bg-red-500/20 rounded-lg flex items-center justify-center transition-colors">
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
          <GlassCard className="w-full max-w-md bg-white dark:bg-slate-900 max-h-[90vh] overflow-y-auto">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100">Create New User</h3>
              <button onClick={() => setShowAdd(false)} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 text-xl"><i className="fa-solid fa-xmark"></i></button>
            </div>
            <form className="space-y-4" onSubmit={(e) => { e.preventDefault(); setShowAdd(false); }}>
              <div className="grid grid-cols-2 gap-4">
                <Input label="Username" placeholder="john.doe" required />
                <div className="flex flex-col gap-2">
                  <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Role</label>
                  <select className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                    {Object.keys(roleColors).map((r) => <option key={r} value={r} className="bg-white dark:bg-slate-800">{r}</option>)}
                  </select>
                </div>
              </div>
              <Input label="Email" type="email" required />
              <Input label="Password" type="password" required />
              <div>
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Access Permissions</label>
                <div className="grid grid-cols-2 gap-2 p-3 border-2 border-slate-200 dark:border-white/10 rounded-xl bg-slate-50 dark:bg-white/5 max-h-36 overflow-y-auto">
                  {modules.map((m) => (
                    <label key={m} className="flex items-center gap-2 text-xs text-slate-600 dark:text-slate-400 cursor-pointer">
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

      {/* Edit User Modal */}
      {editUser && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <GlassCard className="w-full max-w-md bg-white dark:bg-slate-900 max-h-[90vh] overflow-y-auto">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100">Edit User</h3>
              <button onClick={() => setEditUser(null)} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 text-xl"><i className="fa-solid fa-xmark"></i></button>
            </div>
            <form className="space-y-4" onSubmit={(e) => { 
              e.preventDefault(); 
              const formData = new FormData(e.target);
              const permissions = Array.from(e.target.querySelectorAll('input[type="checkbox"]:checked')).map(cb => cb.value);
              setUsers(users.map(u => u.id === editUser.id ? {
                ...u,
                username: formData.get('username'),
                email: formData.get('email'),
                role: formData.get('role'),
                permissions
              } : u));
              setEditUser(null); 
            }}>
              <div className="grid grid-cols-2 gap-4">
                <Input name="username" label="Username" defaultValue={editUser.username} required />
                <div className="flex flex-col gap-2">
                  <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Role</label>
                  <select name="role" defaultValue={editUser.role} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                    {Object.keys(roleColors).map((r) => <option key={r} value={r} className="bg-white dark:bg-slate-800">{r}</option>)}
                  </select>
                </div>
              </div>
              <Input name="email" label="Email" type="email" defaultValue={editUser.email} required />
              <Input name="password" label="Password (Leave blank to keep)" type="password" />
              <div>
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Access Permissions</label>
                <div className="grid grid-cols-2 gap-2 p-3 border-2 border-slate-200 dark:border-white/10 rounded-xl bg-slate-50 dark:bg-white/5 max-h-36 overflow-y-auto">
                  {modules.map((m) => (
                    <label key={m} className="flex items-center gap-2 text-xs text-slate-600 dark:text-slate-400 cursor-pointer">
                      <input type="checkbox" value={m} defaultChecked={editUser.permissions?.includes(m)} className="accent-indigo-500 w-4 h-4" /> {m}
                    </label>
                  ))}
                </div>
              </div>
              <Button type="submit" variant="primary" className="w-full !justify-center">Save Changes</Button>
            </form>
          </GlassCard>
        </div>
      )}
    </div>
  );
}
