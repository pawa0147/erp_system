export function GlassCard({
  children,
  className = "",
  style,
}: {
  children: React.ReactNode;
  className?: string;
  style?: React.CSSProperties;
}) {
  // Detect padding override from className (e.g., "p-0 overflow-hidden")
  const noPadding = className.includes("p-0");

  return (
    <div
      className={`glass-card relative ${!noPadding ? "p-6" : ""} ${className}`}
      style={style}
    >
      {children}
    </div>
  );
}
