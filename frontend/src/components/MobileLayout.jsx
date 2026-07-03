

import { useState, useEffect } from "react";
import Sidebar from "@/components/Sidebar";
import TopBar from "@/components/TopBar";

export default function MobileLayout({ children }) {
  const [sidebarOpen, setSidebarOpen] = useState(false);

  // Lock body scroll when mobile sidebar is open
  useEffect(() => {
    if (sidebarOpen) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "";
    }
    return () => { document.body.style.overflow = ""; };
  }, [sidebarOpen]);

  return (
    <>
      {/* ══════════════════════════════════════════
          MOBILE LAYOUT  (< 1024px)
          Full screen, no gaps, no rounded boxes
      ══════════════════════════════════════════ */}
      <div className="flex flex-col h-screen lg:hidden print:flex print:min-h-0 print:h-auto print:w-full print:block">

        {/* Mobile TopBar — flat, full width */}
        <div
          className="shrink-0 w-full print:hidden"
          style={{
            background: "var(--glass-panel-bg)",
            backdropFilter: "var(--glass-blur)",
            WebkitBackdropFilter: "var(--glass-blur)",
            borderBottom: "1px solid var(--glass-panel-border)",
          }}
        >
          <TopBar onMenuClick={() => setSidebarOpen(true)} />
        </div>

        {/* Mobile main content — full width, scrollable */}
        <main
          className="flex-1 overflow-y-auto page-animate print:overflow-visible print:p-0 print:m-0 print:w-full print:block"
          style={{
            background: "var(--glass-panel-bg)",
            backdropFilter: "var(--glass-blur)",
            WebkitBackdropFilter: "var(--glass-blur)",
            padding: "20px 16px",
          }}
        >
          {children}
        </main>

        {/* Mobile sidebar — full-height slide-in drawer */}
        {/* Backdrop */}
        {sidebarOpen && (
          <div
            className="fixed inset-0 z-40 bg-black/50"
            style={{ backdropFilter: "blur(4px)" }}
            onClick={() => setSidebarOpen(false)}
          />
        )}

        {/* Drawer — full height, fixed width, no rounded corner on left edge */}
        <div
          className="fixed top-0 left-0 h-full z-50 transition-transform duration-300 ease-in-out"
          style={{
            width: "min(300px, 85vw)",
            transform: sidebarOpen ? "translateX(0)" : "translateX(-100%)",
            background: "var(--glass-panel-bg)",
            backdropFilter: "var(--glass-blur)",
            WebkitBackdropFilter: "var(--glass-blur)",
            borderRight: "1px solid var(--glass-panel-border)",
            boxShadow: "4px 0 32px rgba(0,0,0,0.18)",
          }}
        >
          <Sidebar onClose={() => setSidebarOpen(false)} />
        </div>
      </div>

      {/* ══════════════════════════════════════════
          DESKTOP LAYOUT  (≥ 1024px)
          Floating box style with gaps & rounded corners
          — completely unchanged
      ══════════════════════════════════════════ */}
      <div className="hidden lg:flex gap-3 p-3 h-screen print:flex-none print:block print:p-0 print:m-0 print:min-h-0 print:h-auto">

        {/* Sidebar box */}
        <aside
          className="shrink-0 w-[268px] sticky top-3 self-start print:hidden"
          style={{ height: "calc(100vh - 24px)" }}
        >
          <div
            className="h-full rounded-[22px] overflow-hidden"
            style={{
              background: "var(--glass-panel-bg)",
              backdropFilter: "var(--glass-blur)",
              WebkitBackdropFilter: "var(--glass-blur)",
              border: "1px solid var(--glass-panel-border)",
              boxShadow: "0 4px 24px rgba(0,0,0,0.06), inset 0 1px 0 rgba(255,255,255,0.80)",
            }}
          >
            <Sidebar onClose={() => {}} />
          </div>
        </aside>

        {/* Main content box */}
        <div
          className="flex-1 min-w-0 sticky top-3 self-start print:block print:w-full print:min-h-0 print:h-auto print:static"
          style={{ height: "calc(100vh - 24px)" }}
        >
          <div
            className="flex flex-col h-full rounded-[22px] overflow-hidden print:block print:overflow-visible print:border-none print:shadow-none print:rounded-none print:p-0"
            style={{
              background: "var(--glass-panel-bg)",
              backdropFilter: "var(--glass-blur)",
              WebkitBackdropFilter: "var(--glass-blur)",
              border: "1px solid var(--glass-panel-border)",
              boxShadow: "0 4px 24px rgba(0,0,0,0.06), inset 0 1px 0 rgba(255,255,255,0.80)",
            }}
          >
            <div className="print:hidden">
              <TopBar onMenuClick={() => {}} />
            </div>
            <main
              className="page-animate flex-1 overflow-y-auto p-4 md:p-7 print:overflow-visible print:p-0 print:m-0 print:block print:h-auto"
            >
              {children}
            </main>
          </div>
        </div>

      </div>
    </>
  );
}
