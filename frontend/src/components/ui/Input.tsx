"use client";
export function Input({
  label,
  className = "",
  ...props
}: React.InputHTMLAttributes<HTMLInputElement> & { label?: React.ReactNode }) {
  return (
    <div className="flex flex-col gap-1.5 w-full">
      {label && (
        <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
          {label}
        </label>
      )}
      <input
        className={`glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200 ${className}`}
        {...props}
      />
    </div>
  );
}
