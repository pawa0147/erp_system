import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";

export default function SettingsPage() {
  const sections = [
    {
      title: "Company Profile",
      icon: "fa-building",
      color: "text-blue-500",
      fields: [
        <Input key="name" label="Company Name" defaultValue="Webworks Digital Agency" />,
        <Input key="email" label="Company Email" type="email" defaultValue="info@webworks.com" />,
        <Input key="phone" label="Phone Number" defaultValue="+91 98765 43210" />,
        <Input key="address" label="Address" defaultValue="Mumbai, India" />,
      ],
    },
    {
      title: "Security",
      icon: "fa-shield-halved",
      color: "text-emerald-500",
      fields: [
        <Input key="cur" label="Current Password" type="password" placeholder="••••••••" />,
        <Input key="new" label="New Password" type="password" placeholder="••••••••" />,
        <Input key="con" label="Confirm Password" type="password" placeholder="••••••••" />,
      ],
    },
  ];

  return (
    <div className="space-y-6 max-w-3xl">
      <div className="flex items-center gap-4 mb-8">
        <div className="w-2 h-8 bg-gradient-to-b from-slate-500 to-slate-700 dark:from-slate-400 dark:to-slate-600 rounded-full"></div>
        <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">System Settings</h2>
      </div>

      {sections.map((sec) => (
        <GlassCard key={sec.title}>
          <div className="flex items-center gap-3 mb-6">
            <div className={`w-9 h-9 rounded-xl bg-slate-100 dark:bg-white/10 flex items-center justify-center ${sec.color}`}>
              <i className={`fa-solid ${sec.icon}`}></i>
            </div>
            <h3 className="font-bold text-slate-800 dark:text-slate-100 text-lg">{sec.title}</h3>
          </div>
          <form className="space-y-4" onSubmit={(e) => e.preventDefault()}>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">{sec.fields}</div>
            <div className="flex justify-end pt-4 border-t border-slate-100 dark:border-white/10">
              <Button type="submit" variant="primary"><i className="fa-solid fa-check"></i> Save Changes</Button>
            </div>
          </form>
        </GlassCard>
      ))}

      <GlassCard>
        <div className="flex items-center gap-3 mb-6">
          <div className="w-9 h-9 rounded-xl bg-slate-100 dark:bg-white/10 flex items-center justify-center text-purple-500">
            <i className="fa-solid fa-bell"></i>
          </div>
          <h3 className="font-bold text-slate-800 dark:text-slate-100 text-lg">Notification Preferences</h3>
        </div>
        <div className="space-y-4">
          {["Email Notifications", "Push Notifications", "Payroll Alerts", "Leave Request Alerts", "Project Deadline Reminders"].map((n) => (
            <div key={n} className="flex items-center justify-between py-3 border-b border-slate-100 dark:border-white/5 last:border-0">
              <span className="text-sm font-medium text-slate-700 dark:text-slate-300">{n}</span>
              <label className="relative inline-flex items-center cursor-pointer">
                <input type="checkbox" className="sr-only peer" defaultChecked />
                <div className="w-11 h-6 bg-slate-200 dark:bg-slate-700 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-slate-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-blue-500"></div>
              </label>
            </div>
          ))}
        </div>
      </GlassCard>
    </div>
  );
}
