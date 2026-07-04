import { useTheme } from "next-themes";
import { useEffect, useState } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function TopBar({ onMenuClick }) {
  const { theme, setTheme } = useTheme();
  const [mounted, setMounted] = useState(false);
  const [showDropdown, setShowDropdown] = useState(false);
  const [showNotifications, setShowNotifications] = useState(false);
  const [notifications, setNotifications] = useState([]);
  
  const unreadCount = notifications.filter(n => !n.is_read).length;

  useEffect(() => {
    setMounted(true);
    fetchNotifications();
    
    // Poll for notifications every 30 seconds
    const interval = setInterval(fetchNotifications, 30000);
    return () => clearInterval(interval);
  }, []);
  
  async function fetchNotifications() {
    try {
      const res = await fetch(`${API_URL}/api/notifications?user_id=1`);
      if (res.ok) {
        const data = await res.json();
        setNotifications(data);
      }
    } catch (error) {
      console.error('Failed to fetch notifications', error);
    }
  }
  
  async function markAllAsRead() {
    if (unreadCount === 0) return;
    try {
      await fetch(`${API_URL}/api/notifications/mark-read`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_id: 1 })
      });
      // Update local state immediately
      setNotifications(notifications.map(n => ({ ...n, is_read: 1 })));
    } catch (error) {
      console.error('Failed to mark notifications as read', error);
    }
  }

  return (
    <header className="glass-topbar flex items-center gap-3 px-4 md:px-7 h-[62px] shrink-0">

      {/* Hamburger — mobile only */}
      <button
        onClick={onMenuClick}
        className="lg:hidden glass-action-btn w-[36px] h-[36px] rounded-xl flex items-center justify-center shrink-0"
        aria-label="Open menu"
      >
        <i className="fas fa-bars text-[14px]" style={{ color: "var(--text-secondary)" }}></i>
      </button>

      {/* Title */}
      <div className="flex items-center gap-2.5">
        <div
          className="w-[3px] h-[20px] rounded-full hidden sm:block"
          style={{ background: "linear-gradient(to bottom, #FBBF24, #F59E0B)" }}
        />
        <h1 className="text-[15px] md:text-[17px] font-extrabold tracking-tight m-0 whitespace-nowrap" style={{ color: "var(--text-primary)" }}>
          Webworks <span style={{ color: "var(--accent)" }}>ERP</span>
        </h1>
      </div>

      {/* Search — hidden on very small screens */}
      <div className="flex-1 max-w-[320px] mx-2 md:mx-4 relative hidden sm:block">
        <i
          className="fas fa-magnifying-glass absolute left-[13px] top-1/2 -translate-y-1/2 text-[12px]"
          style={{ color: "var(--text-muted)" }}
        ></i>
        <input
          type="text"
          placeholder="Search anything..."
          className="glass-input-topbar w-full py-[8px] pr-3 pl-[34px] rounded-xl text-[13px] outline-none"
        />
      </div>

      {/* Spacer */}
      <div className="flex-1" />

      {/* Actions */}
      <div className="flex items-center gap-1.5">

        {/* Search icon on mobile */}
        <button className="sm:hidden glass-action-btn w-[34px] h-[34px] rounded-xl flex items-center justify-center">
          <i className="fas fa-magnifying-glass text-[13px]" style={{ color: "var(--text-secondary)" }}></i>
        </button>

        {/* Theme toggle */}
        {mounted && (
          <button
            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
            className="glass-action-btn w-[34px] h-[34px] rounded-xl flex items-center justify-center"
            title={theme === "dark" ? "Switch to Light" : "Switch to Dark"}
          >
            <i
              className={`fas ${theme === "dark" ? "fa-sun" : "fa-moon"} text-[13px]`}
              style={{ color: "var(--accent)" }}
            ></i>
          </button>
        )}

        {/* Notifications */}
        <div className="relative">
          <button 
            onClick={() => setShowNotifications(!showNotifications)}
            className="glass-action-btn w-[34px] h-[34px] rounded-xl flex items-center justify-center relative hover:opacity-80 transition-opacity"
          >
            <i className="fas fa-bell text-[13px]" style={{ color: "var(--text-secondary)" }}></i>
            {unreadCount > 0 && (
              <span
                className="absolute top-[7px] right-[7px] w-[6px] h-[6px] rounded-full border-2"
                style={{
                  background: "#EF4444",
                  borderColor: "var(--glass-panel-bg)",
                  boxShadow: "0 0 5px rgba(239,68,68,0.55)",
                }}
              />
            )}
          </button>

          {showNotifications && (
            <div className="absolute top-[45px] right-[-60px] sm:right-0 w-[300px] bg-white dark:bg-slate-800 border border-slate-200 dark:border-white/10 rounded-xl shadow-lg p-3 z-50">
              <div className="flex justify-between items-center mb-3">
                <span className="text-[13px] font-bold text-slate-800 dark:text-slate-100">Notifications {unreadCount > 0 && `(${unreadCount})`}</span>
                <button onClick={markAllAsRead} className="text-[10px] font-semibold text-blue-600 dark:text-blue-400 cursor-pointer hover:underline bg-transparent border-none p-0">Mark all read</button>
              </div>
              <div className="space-y-2 max-h-[300px] overflow-y-auto">
                {notifications.length > 0 ? (
                  notifications.map(notification => (
                    <div key={notification.id} className={`p-2 rounded-lg border ${!notification.is_read ? 'bg-blue-50 dark:bg-blue-500/10 border-blue-100 dark:border-blue-500/20' : 'bg-slate-50 dark:bg-white/5 border-slate-100 dark:border-white/5'}`}>
                      <div className="text-[12px] font-semibold text-slate-700 dark:text-slate-200 flex items-center justify-between">
                        {notification.type || 'System Alert'}
                        {!notification.is_read && <span className="w-1.5 h-1.5 bg-blue-500 rounded-full"></span>}
                      </div>
                      <div className="text-[10px] text-slate-500 dark:text-slate-400 mt-0.5">{notification.message}</div>
                      <div className="text-[9px] text-slate-400 mt-1">{new Date(notification.created_at).toLocaleString()}</div>
                    </div>
                  ))
                ) : (
                  <div className="text-center py-4 text-xs text-slate-500">No notifications yet.</div>
                )}
              </div>
              <button 
                onClick={() => setShowNotifications(false)}
                className="w-full mt-3 py-1.5 text-center text-[11px] font-semibold text-slate-500 dark:text-slate-400 hover:text-slate-700 dark:hover:text-slate-200 transition-colors"
              >
                Close
              </button>
            </div>
          )}
        </div>

        {/* Divider */}
        <div className="w-px h-[22px] mx-1 hidden sm:block" style={{ background: "var(--glass-input-border)" }} />

        {/* Profile chip */}
        <div className="relative">
          <button
            onClick={() => setShowDropdown(!showDropdown)}
            className="glass-profile-btn flex items-center gap-2 py-1.5 pl-1.5 pr-3 rounded-[13px] cursor-pointer hover:opacity-80 transition-opacity outline-none text-left"
          >
            <div
              className="w-[30px] h-[30px] rounded-[8px] flex items-center justify-center text-white font-bold text-[12px] shrink-0"
              style={{
                background: "linear-gradient(135deg, #FBBF24, #F59E0B)",
                boxShadow: "0 3px 8px rgba(245,158,11,0.38)",
              }}
            >
              A
            </div>
            <div className="hidden md:block">
              <div className="text-[12px] font-semibold leading-tight" style={{ color: "var(--text-primary)" }}>
                Admin
              </div>
              <div className="text-[10px]" style={{ color: "var(--text-muted)" }}>Administrator</div>
            </div>
            <i className="fas fa-chevron-down text-[9px] hidden md:block" style={{ color: "var(--text-muted)" }}></i>
          </button>
          
          {showDropdown && (
            <div className="absolute top-[45px] right-0 w-[140px] bg-white dark:bg-slate-800 border border-slate-200 dark:border-white/10 rounded-xl shadow-lg p-1 z-50">
              <a href="/settings" onClick={() => setShowDropdown(false)} className="flex items-center px-3 py-2 text-[12px] font-semibold text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-white/5 rounded-[9px] transition-colors no-underline">
                <i className="fas fa-gear mr-2 w-4 text-center text-slate-400"></i> Settings
              </a>
              <div className="my-1 border-t border-slate-200 dark:border-white/10 mx-2"></div>
              <button onClick={() => { setShowDropdown(false); alert("Logout feature coming soon"); }} className="flex items-center w-full px-3 py-2 text-[12px] font-semibold text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-500/10 rounded-[9px] transition-colors text-left">
                <i className="fas fa-sign-out-alt mr-2 w-4 text-center"></i> Log Out
              </button>
            </div>
          )}
        </div>

      </div>
    </header>
  );
}
