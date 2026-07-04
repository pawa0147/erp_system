import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

const platformIcon = {
  Google: { icon: "fa-google", color: "text-blue-500" },
  Facebook: { icon: "fa-facebook", color: "text-blue-700" },
  Instagram: { icon: "fa-instagram", color: "text-pink-500" },
  LinkedIn: { icon: "fa-linkedin", color: "text-blue-600" },
};

export default function MarketingPage() {
  const [selectedDay, setSelectedDay] = useState(null);
  const [campaigns, setCampaigns] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/marketing/campaigns`)
      .then(res => res.json())
      .then(data => {
        setCampaigns(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Failed to fetch campaigns:', err);
        setLoading(false);
      });
  }, []);

  const today = new Date();
  const monthDays = new Date(today.getFullYear(), today.getMonth() + 1, 0).getDate();
  const firstDayOffset = new Date(today.getFullYear(), today.getMonth(), 1).getDay() || 7;

  return (
    <div className="space-y-8">
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <div className="flex items-center gap-4">
            <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
            <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Marketing Command Center</h2>
          </div>
          <p className="text-slate-500 dark:text-slate-400 text-sm mt-1 ml-6">Real-time analytics from your active campaigns.</p>
        </div>
        <div className="flex gap-3">
          <Link to="/marketing/campaigns"><Button variant="secondary"><i className="fa-solid fa-list"></i> All Campaigns</Button></Link>
          <Link to="/marketing/create-campaign"><Button variant="primary" className="!bg-gradient-to-r !from-indigo-500 !to-purple-500"><i className="fa-solid fa-rocket"></i> Launch Campaign</Button></Link>
        </div>
      </div>

      {/* KPIs */}
      {loading ? (
        <div className="p-8 text-center text-slate-500"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>
      ) : (
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
          {[
            { label: "Total Ad Spend", value: `₹${campaigns.reduce((acc, c) => acc + (Number(c.spend) || 0), 0).toLocaleString()}`, icon: "fa-coins", color: "border-indigo-400", bg: "bg-indigo-50 dark:bg-indigo-500/10 text-indigo-600 dark:text-indigo-400" },
            { label: "Total Clicks", value: campaigns.reduce((acc, c) => acc + (Number(c.clicks) || 0), 0).toLocaleString(), icon: "fa-computer-mouse", color: "border-amber-400", bg: "bg-amber-50 dark:bg-amber-500/10 text-amber-600 dark:text-amber-400" },
            { 
              label: "Conversions", 
              value: campaigns.reduce((acc, c) => acc + (Number(c.conversions) || 0), 0).toLocaleString(), 
              sub: campaigns.reduce((acc, c) => acc + (Number(c.clicks) || 0), 0) > 0 ? `${((campaigns.reduce((acc, c) => acc + (Number(c.conversions) || 0), 0) / campaigns.reduce((acc, c) => acc + (Number(c.clicks) || 0), 0)) * 100).toFixed(1)}% Rate` : "0% Rate",
              icon: "fa-filter", color: "border-emerald-400", bg: "bg-emerald-50 dark:bg-emerald-500/10 text-emerald-600 dark:text-emerald-400" 
            },
            { 
              label: "Total Reach", 
              value: (() => {
                const tr = campaigns.reduce((acc, c) => acc + (Number(c.reach) || 0), 0);
                return tr >= 1000 ? `${(tr / 1000).toFixed(1)}K` : tr.toLocaleString();
              })(), 
              icon: "fa-users-viewfinder", color: "border-pink-400", bg: "bg-pink-50 dark:bg-pink-500/10 text-pink-600 dark:text-pink-400" 
            },
          ].map((k) => (
            <GlassCard key={k.label} className={`border-b-4 ${k.color} flex items-center gap-4`}>
              <div className={`w-12 h-12 rounded-xl flex items-center justify-center text-xl ${k.bg}`}><i className={`fa-solid ${k.icon}`}></i></div>
              <div>
                <div className="text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-wide">{k.label}</div>
                <div className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">{k.value}</div>
                {k.sub && <div className="text-xs text-slate-400 dark:text-slate-500">{k.sub}</div>}
              </div>
            </GlassCard>
          ))}
        </div>
      )}

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Live Campaigns */}
        <div className="lg:col-span-2 space-y-4">
          <GlassCard>
            <div className="flex justify-between items-center mb-4">
              <h3 className="font-bold text-slate-800 dark:text-slate-100">Live Campaigns</h3>
              <Link to="/marketing/campaigns" className="text-sm text-indigo-500 font-medium hover:underline">View All</Link>
            </div>
            <div className="space-y-4">
              {campaigns.length === 0 && !loading && <div className="text-slate-500 p-4 text-center">No active campaigns.</div>}
              {campaigns.map((cam) => {
                const pct = Math.min(((Number(cam.spend) || 0) / (Number(cam.budget) || 1)) * 100, 100);
                const plt = platformIcon[cam.platform] || { icon: "fa-globe", color: "text-slate-500" };
                return (
                  <div key={cam.id} className="p-4 border border-slate-100 dark:border-white/5 rounded-xl hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors">
                    <div className="flex justify-between items-start">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 bg-slate-50 dark:bg-white/5 rounded-xl flex items-center justify-center text-xl">
                          <i className={`fa-brands ${plt.icon} ${plt.color}`}></i>
                        </div>
                        <div>
                          <div className="font-semibold text-slate-800 dark:text-slate-200">{cam.name}</div>
                          <div className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">
                            <span className="text-emerald-500">• Active</span> | Conv: {cam.conversions} | Reach: {cam.reach.toLocaleString()}
                          </div>
                        </div>
                      </div>
                      <div className="text-right">
                        <div className="font-bold text-slate-800 dark:text-slate-200">₹{(Number(cam.spend) || 0).toLocaleString()}</div>
                        <div className="text-xs text-slate-400 dark:text-slate-500">of ₹{(Number(cam.budget) || 0).toLocaleString()}</div>
                        <Link to={`/marketing/${cam.id}/edit`} className="text-xs text-indigo-500 mt-1 inline-block"><i className="fa-solid fa-pen text-xs"></i> Edit</Link>
                      </div>
                    </div>
                    <div className="mt-3 w-full h-1.5 bg-slate-100 dark:bg-white/10 rounded-full overflow-hidden">
                      <div className="h-full bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full" style={{ width: `${pct}%` }}></div>
                    </div>
                  </div>
                );
              })}
            </div>
          </GlassCard>
        </div>

        {/* Campaign Calendar */}
        <div>
          <GlassCard>
            <div className="flex justify-between items-center mb-4">
              <h3 className="font-bold text-slate-800 dark:text-slate-100 flex items-center gap-2"><i className="fa-regular fa-calendar text-indigo-500"></i> {today.toLocaleDateString("en-IN", { month: "long", year: "numeric" })}</h3>
            </div>
            <div className="grid grid-cols-7 gap-1 text-center">
              {["M", "T", "W", "T", "F", "S", "S"].map((d, i) => (
                <div key={i} className="text-xs font-bold text-slate-400 dark:text-slate-500 pb-1">{d}</div>
              ))}
              {Array.from({ length: firstDayOffset - 1 }).map((_, i) => <div key={`e${i}`}></div>)}
              {Array.from({ length: monthDays }).map((_, i) => {
                const day = i + 1;
                const isToday = day === today.getDate();
                return (
                  <button key={day} onClick={() => setSelectedDay(day)}
                    className={`aspect-square rounded-lg text-xs font-medium transition-all flex items-center justify-center
                      ${isToday ? "bg-indigo-500 text-white font-bold shadow-md shadow-indigo-300 dark:shadow-none" :
                        selectedDay === day ? "bg-indigo-100 dark:bg-indigo-500/20 text-indigo-700 dark:text-indigo-400" :
                        "text-slate-600 dark:text-slate-300 hover:bg-indigo-50 dark:hover:bg-white/5 hover:text-indigo-600 dark:hover:text-indigo-400"}`}>
                    {day}
                  </button>
                );
              })}
            </div>
            {selectedDay && (
              <div className="mt-4 pt-4 border-t border-slate-100 dark:border-white/10">
                <p className="text-sm text-slate-500 dark:text-slate-400 italic">No events for {today.toLocaleDateString("en-IN", { month: "long" })} {selectedDay}.</p>
              </div>
            )}
          </GlassCard>
        </div>
      </div>
    </div>
  );
}
