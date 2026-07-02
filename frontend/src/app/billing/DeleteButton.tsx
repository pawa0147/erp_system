"use client";

import { deleteBill, deleteQuote } from "../actions/billing";
import { useState } from "react";

export function DeleteButton({ id, type }: { id: number, type: "bill" | "quote" }) {
  const [loading, setLoading] = useState(false);

  async function handleDelete() {
    if (!confirm(`Are you sure you want to delete this ${type}?`)) return;
    setLoading(true);
    if (type === "bill") {
      await deleteBill(id);
    } else {
      await deleteQuote(id);
    }
    setLoading(false);
  }

  return (
    <button
      onClick={handleDelete}
      disabled={loading}
      className="w-8 h-8 rounded-lg bg-rose-50 dark:bg-rose-500/10 text-rose-600 dark:text-rose-400 hover:bg-rose-100 dark:hover:bg-rose-500/20 transition-colors flex items-center justify-center disabled:opacity-50"
      title={`Delete ${type === "bill" ? "Bill" : "Quote"}`}
    >
      <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-trash"}></i>
    </button>
  );
}
