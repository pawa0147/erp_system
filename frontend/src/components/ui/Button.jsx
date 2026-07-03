import React from "react";

export function Button({
  children,
  variant = "primary",
  className = "",
  ...props
}) {
  const base =
    "inline-flex items-center justify-center gap-2 px-5 py-2.5 rounded-xl font-semibold text-sm cursor-pointer transition-all duration-200 select-none hover:-translate-y-0.5 active:translate-y-0";

  const variants = {
    primary: {
      background: "linear-gradient(135deg, #FBBF24, #F59E0B)",
      color: "#ffffff",
      border: "none",
      boxShadow: "0 4px 14px rgba(245,158,11,0.40), 0 1px 0 rgba(255,255,255,0.20) inset",
    },
    secondary: {
      background: "var(--glass-input-bg)",
      color: "var(--text-primary)",
      border: "1.5px solid var(--glass-input-border)",
      boxShadow: "0 2px 6px rgba(0,0,0,0.04)",
    },
    danger: {
      background: "linear-gradient(135deg, #F87171, #EF4444)",
      color: "#ffffff",
      border: "none",
      boxShadow: "0 4px 14px rgba(239,68,68,0.38)",
    },
  };

  return (
    <button
      className={`${base} ${className}`}
      style={variants[variant]}
      {...props}
    >
      {children}
    </button>
  );
}
