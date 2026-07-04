import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

const platformCfg = {
  Facebook: { color: "from-blue-600 to-blue-800", icon: "fa-facebook" },
  Instagram: { color: "from-pink-500 to-rose-600", icon: "fa-instagram" },
  LinkedIn: { color: "from-blue-500 to-sky-600", icon: "fa-linkedin" },
  "Twitter/X": { color: "from-slate-600 to-slate-800", icon: "fa-x-twitter" },
  Twitter: { color: "from-slate-600 to-slate-800", icon: "fa-x-twitter" },
  Youtube: { color: "from-red-500 to-red-700", icon: "fa-youtube" },
  Default: { color: "from-slate-400 to-slate-600", icon: "fa-hashtag" }
};

export default function SocialAccountsPage() {
  const [accounts, setAccounts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/social/accounts`)
      .then(res => res.ok ? res.json() : [])
      .then(data => {
        setAccounts(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch social accounts:', err);
        setLoading(false);
      });
  }, []);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-pink-500 to-rose-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Social Media Accounts</h2>
        </div>
        <Link to="/social/add-account"><Button variant="primary"><i className="fa-solid fa-plus"></i> Connect Account</Button></Link>
      </div>

      {loading ? (
        <div className="p-8 text-center text-slate-500"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {accounts.length === 0 && <div className="col-span-2 text-slate-500 text-center p-4">No social accounts connected.</div>}
          {accounts.map((acc) => {
            const cfg = platformCfg[acc.platform] || platformCfg.Default;
            return (
              <GlassCard key={acc.id} className="overflow-hidden p-0">
                <div className={`bg-gradient-to-r ${cfg.color} p-5 text-white`}>
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-3">
                      <div className="w-12 h-12 bg-white/20 rounded-xl flex items-center justify-center text-2xl">
                        <i className={`fa-brands ${cfg.icon}`}></i>
                      </div>
                  <div>
                    <div className="font-bold text-lg">{acc.platform}</div>
                    <div className="text-sm opacity-80">{acc.handle}</div>
                  </div>
                </div>
                <div className="text-right">
                  <div className="text-2xl font-extrabold">{acc.followers}</div>
                  <div className="text-xs opacity-70">Followers</div>
                </div>
              </div>
            </div>
            <div className="p-5 grid grid-cols-3 gap-4 border-b border-slate-100 dark:border-white/5">
              <div className="text-center">
                <div className="text-xl font-bold text-slate-800 dark:text-slate-200">{acc.posts}</div>
                <div className="text-xs text-slate-500 dark:text-slate-400">Posts</div>
              </div>
              <div className="text-center border-x border-slate-100 dark:border-white/10">
                <div className="text-xl font-bold text-slate-800 dark:text-slate-200">{acc.engagement}</div>
                <div className="text-xs text-slate-500 dark:text-slate-400">Engagement</div>
              </div>
              <div className="text-center">
                <div className="text-sm font-semibold text-slate-600 dark:text-slate-300">{acc.last_post}</div>
                <div className="text-xs text-slate-500 dark:text-slate-400">Last Post</div>
              </div>
            </div>
                <div className="px-5 py-4 flex gap-2">
                  <button className="flex-1 py-2 text-xs font-semibold text-slate-600 dark:text-slate-300 bg-slate-100 dark:bg-white/5 rounded-lg hover:bg-slate-200 dark:hover:bg-white/10 transition-colors" onClick={() => alert('Feature coming soon!')}>View Analytics</button>
                  <button className="w-9 h-9 bg-red-50 dark:bg-red-500/10 text-red-500 dark:text-red-400 rounded-lg flex items-center justify-center hover:bg-red-100 dark:hover:bg-red-500/20 transition-colors" onClick={() => alert('Feature coming soon!')}>
                    <i className="fa-solid fa-trash text-xs"></i>
                  </button>
                </div>
              </GlassCard>
            );
          })}
        </div>
      )}
    </div>
  );
}
