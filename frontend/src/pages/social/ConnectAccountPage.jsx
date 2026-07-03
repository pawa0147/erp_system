import { GlassCard } from "@/components/ui/GlassCard";
import { Link } from "react-router-dom";

export default function ConnectAccountPage() {
  const platforms = [
    { id: "facebook", name: "Facebook", icon: "fa-facebook", color: "text-blue-600", bg: "bg-blue-50 dark:bg-blue-900/20" },
    { id: "instagram", name: "Instagram", icon: "fa-instagram", color: "text-pink-600", bg: "bg-pink-50 dark:bg-pink-900/20" },
    { id: "twitter", name: "Twitter (X)", icon: "fa-x-twitter", color: "text-slate-900 dark:text-white", bg: "bg-slate-100 dark:bg-slate-800" },
    { id: "linkedin", name: "LinkedIn", icon: "fa-linkedin", color: "text-blue-700", bg: "bg-blue-50 dark:bg-blue-900/20" },
    { id: "youtube", name: "YouTube", icon: "fa-youtube", color: "text-red-600", bg: "bg-red-50 dark:bg-red-900/20" },
  ];

  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-cyan-500 rounded-full shadow-[0_0_10px_rgba(6,182,212,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Connect Social Account</h2>
        </div>
        <Link to="/social">
          <button className="px-4 py-2 rounded-xl bg-slate-100 dark:bg-white/10 text-slate-700 dark:text-slate-300 font-semibold hover:bg-slate-200 dark:hover:bg-white/20 transition-colors">
            <i className="fa-solid fa-arrow-left mr-2"></i> Back
          </button>
        </Link>
      </div>

      <GlassCard className="p-8">
        <div className="text-center max-w-lg mx-auto mb-10">
          <div className="w-16 h-16 bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 rounded-full flex items-center justify-center text-3xl mx-auto mb-4">
            <i className="fa-solid fa-link"></i>
          </div>
          <h3 className="text-xl font-bold text-slate-800 dark:text-slate-100 mb-2">Select a Platform</h3>
          <p className="text-slate-500 dark:text-slate-400">
            Connect your social media accounts to manage posts, track analytics, and interact with your audience from a single dashboard.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {platforms.map((platform) => (
            <div key={platform.id} className="group cursor-pointer">
              <div className={`h-full border-2 border-transparent hover:border-slate-300 dark:hover:border-slate-600 rounded-2xl p-6 transition-all duration-300 ${platform.bg} shadow-sm hover:shadow-md flex flex-col items-center justify-center gap-4`}>
                <i className={`fa-brands ${platform.icon} text-5xl ${platform.color} group-hover:scale-110 transition-transform`}></i>
                <div className="font-bold text-slate-800 dark:text-slate-200">{platform.name}</div>
                <button className="mt-2 px-6 py-2 rounded-full bg-white dark:bg-slate-800 shadow-sm font-semibold text-sm text-slate-700 dark:text-slate-300 group-hover:bg-slate-800 group-hover:text-white dark:group-hover:bg-white dark:group-hover:text-slate-800 transition-colors">
                  Connect
                </button>
              </div>
            </div>
          ))}
        </div>
      </GlassCard>
    </div>
  );
}
