import { Link, useLocation } from "react-router-dom";
import { useState } from "react";

const nav = [
  {
    section: "MAIN",
    items: [
      { name: "Dashboard", href: "/", icon: "fas fa-house" },
      { name: "Calendar", href: "/calendar", icon: "fas fa-calendar-days" },
      { name: "Team Chat", href: "/chat", icon: "fas fa-comments" },
    ],
  },
  {
    section: "BUSINESS",
    items: [
      { name: "Clients (CRM)", href: "/clients", icon: "fas fa-users" },
      { name: "Billing & Quotes", href: "/billing", icon: "fas fa-file-invoice" },
      { name: "Sales & Leads", href: "/sales", icon: "fas fa-chart-line" },
    ],
  },
  {
    section: "OPERATIONS",
    items: [
      { name: "Projects", href: "/projects", icon: "fas fa-diagram-project" },
      { name: "Task Manager", href: "/tasks", icon: "fas fa-bars-progress" },
      { name: "Marketing", href: "/marketing", icon: "fas fa-bullhorn" },
    ],
  },
  {
    section: "HR",
    items: [
      { name: "Employees", href: "/hr", icon: "fas fa-id-card" },
      { name: "Attendance", href: "/hr/attendance", icon: "fas fa-clock" },
      { name: "Leave Management", href: "/hr/leaves", icon: "fas fa-calendar-minus" },
      { name: "Payroll", href: "/hr/payroll", icon: "fas fa-money-bill-wave" },
      { name: "Employee Portal", href: "/employee-portal", icon: "fas fa-user-circle" },
    ],
  },
  {
    section: "FINANCE",
    items: [
      { name: "Finance Overview", href: "/finance", icon: "fas fa-wallet" },
      { name: "Transactions", href: "/finance/transactions", icon: "fas fa-list" },
    ],
  },
  {
    section: "DOCUMENTS",
    items: [
      { name: "Legal Docs", href: "/legal", icon: "fas fa-file-contract" },
      { name: "Certificates & MoUs", href: "/certificates", icon: "fas fa-certificate" },
      { name: "Research & Dev", href: "/research", icon: "fas fa-flask" },
    ],
  },
  {
    section: "ADMIN",
    items: [
      { name: "Social Accounts", href: "/social", icon: "fas fa-share-nodes" },
      { name: "System Users", href: "/users", icon: "fas fa-users-gear" },
      { name: "Settings", href: "/settings", icon: "fas fa-gear" },
    ],
  },
];

export default function Sidebar({ onClose }) {
  const location = useLocation();
  const pathname = location.pathname;
  const [collapsed, setCollapsed] = useState({});

  const toggle = (sec) =>
    setCollapsed((p) => ({ ...p, [sec]: !p[sec] }));

  const handleNavClick = () => {
    // Close drawer on mobile when a link is clicked
    onClose?.();
  };

  return (
    <aside className="w-full h-full flex flex-col overflow-hidden">

      {/* Logo row */}
      <div
        className="h-[64px] flex items-center px-4 border-b shrink-0"
        style={{ borderColor: "var(--glass-panel-border)" }}
      >
        {/* Gold icon */}
        <div
          className="w-[34px] h-[34px] rounded-[10px] flex items-center justify-center mr-3 shrink-0"
          style={{
            background: "linear-gradient(135deg, #FBBF24, #F59E0B)",
            boxShadow: "0 4px 12px rgba(245,158,11,0.38)",
          }}
        >
          <i className="fas fa-layer-group text-white text-[13px]"></i>
        </div>
        <div className="flex-1 min-w-0">
          <div className="font-extrabold text-[14px] tracking-tight truncate" style={{ color: "var(--text-primary)" }}>
            Webworks
          </div>
          <div className="text-[9px] font-bold tracking-widest uppercase" style={{ color: "var(--accent)" }}>
            ERP System
          </div>
        </div>
        {/* Close button — mobile only */}
        {onClose && (
          <button
            onClick={onClose}
            className="lg:hidden ml-2 w-[28px] h-[28px] rounded-lg flex items-center justify-center shrink-0 transition-colors"
            style={{ background: "var(--accent-bg)", color: "var(--accent-dark)" }}
            aria-label="Close menu"
          >
            <i className="fas fa-xmark text-[13px]"></i>
          </button>
        )}
      </div>

      {/* Nav */}
      <nav className="flex-1 overflow-y-auto py-2.5 px-2">
        {nav.map((group) => (
          <div key={group.section} className="mb-0.5">

            {/* Section label */}
            <button
              onClick={() => toggle(group.section)}
              className="flex items-center justify-between w-full px-3 py-[5px] mb-0.5 text-[9px] font-bold tracking-widest uppercase transition-colors"
              style={{ color: "var(--text-muted)" }}
            >
              {group.section}
              <i className={`fas fa-chevron-down text-[8px] transition-transform duration-200 ${collapsed[group.section] ? "-rotate-90" : ""}`}></i>
            </button>

            {/* Items */}
            {!collapsed[group.section] &&
              group.items.map((item) => {
                const isActive =
                  pathname === item.href ||
                  (item.href !== "/" &&
                    pathname.startsWith(item.href + "/") &&
                    !nav.some((g) =>
                      g.items.some(
                        (i) => i.href === pathname && i.href !== item.href
                      )
                    ));
                const isDash = item.href === "/" && pathname === "/";
                const active = isActive || isDash;

                return (
                  <Link
                    key={item.name}
                    to={item.href}
                    onClick={handleNavClick}
                    className="flex items-center px-3 py-[8px] mb-[1px] rounded-[11px] text-[13px] font-medium transition-all duration-200 no-underline"
                    style={
                      active
                        ? {
                            background: "linear-gradient(135deg, #FBBF24, #F59E0B)",
                            color: "#ffffff",
                            fontWeight: 600,
                            boxShadow: "0 3px 10px rgba(245,158,11,0.32)",
                          }
                        : { color: "var(--text-secondary)" }
                    }
                    onMouseEnter={(e) => {
                      if (!active) {
                        e.currentTarget.style.background = "var(--accent-bg)";
                        e.currentTarget.style.color = "var(--accent-dark)";
                      }
                    }}
                    onMouseLeave={(e) => {
                      if (!active) {
                        e.currentTarget.style.background = "";
                        e.currentTarget.style.color = "var(--text-secondary)";
                      }
                    }}
                  >
                    <i
                      className={`${item.icon} w-[16px] mr-2.5 text-center shrink-0 text-[12px]`}
                      style={{ color: active ? "rgba(255,255,255,0.9)" : "var(--accent)" }}
                    ></i>
                    <span className="overflow-hidden text-ellipsis whitespace-nowrap text-[13px]">
                      {item.name}
                    </span>
                    {active && (
                      <span className="ml-auto w-1.5 h-1.5 rounded-full bg-white/80 shrink-0" />
                    )}
                  </Link>
                );
              })}
          </div>
        ))}
      </nav>

      {/* Footer */}
      <div
        className="p-2.5 border-t shrink-0"
        style={{ borderColor: "var(--glass-panel-border)" }}
      >
        <div
          className="flex items-center gap-2.5 p-2.5 rounded-[11px]"
          style={{
            background: "var(--accent-bg)",
            border: "1px solid var(--accent-border)",
          }}
        >
          <div
            className="w-[32px] h-[32px] rounded-[9px] flex items-center justify-center text-white font-bold text-[12px] shrink-0"
            style={{
              background: "linear-gradient(135deg, #FBBF24, #F59E0B)",
              boxShadow: "0 3px 8px rgba(245,158,11,0.32)",
            }}
          >
            A
          </div>
          <div className="min-w-0 flex-1">
            <div className="text-[12px] font-semibold truncate" style={{ color: "var(--text-primary)" }}>
              Admin User
            </div>
            <div className="text-[10px] truncate" style={{ color: "var(--text-muted)" }}>
              admin@webworks.com
            </div>
          </div>
          <i className="fas fa-ellipsis-vertical text-[12px] shrink-0" style={{ color: "var(--accent)" }}></i>
        </div>
      </div>

    </aside>
  );
}
