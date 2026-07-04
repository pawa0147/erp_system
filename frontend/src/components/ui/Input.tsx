import React from 'react';

export function Input({
  label,
  className = "",
  ...props
}: {
  label?: string;
  className?: string;
} & React.InputHTMLAttributes<HTMLInputElement>) {

  const inputProps = { ...props };
  if (inputProps.type === 'number' && inputProps.min === undefined) {
    inputProps.min = "0";
  }

  return (
    <div className="flex flex-col gap-1.5 w-full">
      {label && (
        <label className={`text-sm font-semibold ${props.required ? 'text-red-500' : 'text-slate-700 dark:text-slate-300'}`}>
          {label} {props.required && <span>*</span>}
        </label>
      )}
      <input
        className={`glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200 ${className}`}
        onKeyDown={(e) => {
          if (inputProps.type === 'number' && e.key === '-') {
            e.preventDefault();
          }
          if (props.onKeyDown) props.onKeyDown(e);
        }}
        {...inputProps}
      />
    </div>
  );
}
