

import { useTheme } from "next-themes";
import { useEffect, useState } from "react";

export default function TopBar({ onMenuClick }) {
  const { theme, setTheme } = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

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
        <button className="glass-action-btn w-[34px] h-[34px] rounded-xl flex items-center justify-center relative">
          <i className="fas fa-bell text-[13px]" style={{ color: "var(--text-secondary)" }}></i>
          <span
            className="absolute top-[7px] right-[7px] w-[6px] h-[6px] rounded-full border-2"
            style={{
              background: "#EF4444",
              borderColor: "var(--glass-panel-bg)",
              boxShadow: "0 0 5px rgba(239,68,68,0.55)",
            }}
          />
        </button>

        {/* Divider */}
        <div className="w-px h-[22px] mx-1 hidden sm:block" style={{ background: "var(--glass-input-border)" }} />

        {/* Profile chip */}
        <div
          className="glass-profile-btn flex items-center gap-2 py-1.5 pl-1.5 pr-3 rounded-[13px] cursor-pointer"
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
        </div>

      </div>
    </header>
  );
}
