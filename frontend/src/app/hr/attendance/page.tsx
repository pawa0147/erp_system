"use client";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { useState, useEffect } from "react";
import Link from "next/link";

type AttRecord = { status: string; work_mode: string; check_in: string; check_out: string };

const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000';

export default function AttendancePage() {
  const today = new Date().toISOString().split("T")[0];
  const [date, setDate] = useState(today);
  const [saved, setSaved] = useState(false);
  const [employees, setEmployees] = useState<any[]>([]);
  const [attendance, setAttendance] = useState<Record<number, AttRecord>>({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`${API_URL}/api/employees`)
      .then(res => res.json())
      .then(empData => {
        setEmployees(empData || []);
        const initialAtt: Record<number, AttRecord> = {};
        (empData || []).forEach((e: any) => {
          initialAtt[e.id] = { status: "Present", work_mode: "Office", check_in: "10:00", check_out: "18:00" };
        });
        setAttendance(initialAtt);
        setLoading(false);
      })
      .catch(err => {
        console.error("Failed to fetch employees", err);
        setLoading(false);
      });
  }, []);

  const update = (id: number, field: keyof AttRecord, value: string) => {
    setAttendance((prev) => ({ ...prev, [id]: { ...prev[id], [field]: value } }));
  };

  const markAllPresent = () => {
    const newAtt: Record<number, AttRecord> = {};
    employees.forEach((e) => {
      newAtt[e.id] = { status: "Present", work_mode: "Office", check_in: "10:00", check_out: "18:00" };
    });
    setAttendance(newAtt);
  };

  const statusColors: Record<string, string> = { Present: "text-emerald-600", Absent: "text-red-500", "Half Day": "text-amber-500", Leave: "text-blue-500" };

  if (loading) return <div className="p-8 text-center text-slate-500">Loading attendance...</div>;

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-4 mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-teal-400 to-emerald-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">
            Daily Attendance: {new Date(date + "T00:00:00").toLocaleDateString("en-IN", { day: "numeric", month: "long", year: "numeric" })}
          </h2>
        </div>
        <div className="flex gap-3 items-center">
          <Link href="/hr/attendance-report"><Button variant="secondary"><i className="fa-solid fa-table"></i> Monthly View</Button></Link>
          <input type="date" value={date} onChange={(e) => { setDate(e.target.value); setSaved(false); }}
            className="py-2.5 px-4 rounded-xl border-2 border-slate-200 bg-white text-slate-800 font-medium outline-none focus:border-teal-500 transition-all" />
        </div>
      </div>

      {saved && (
        <div className="bg-emerald-50 border border-emerald-200 text-emerald-700 px-4 py-3 rounded-xl">
          <i className="fas fa-check-circle mr-2"></i> Attendance saved for {date}!
        </div>
      )}

      <GlassCard className="p-0 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                <th className="px-6 py-4">Employee</th>
                <th className="px-6 py-4">Status / Mode</th>
                <th className="px-6 py-4">Check In</th>
                <th className="px-6 py-4">Check Out</th>
                <th className="px-6 py-4">Total Hours</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {employees.map((emp) => {
                const rec = attendance[emp.id] || { status: "Present", work_mode: "Office", check_in: "", check_out: "" };
                const ci = rec.check_in ? new Date(`2000-01-01T${rec.check_in}`) : null;
                const co = rec.check_out ? new Date(`2000-01-01T${rec.check_out}`) : null;
                const diffMs = ci && co ? co.getTime() - ci.getTime() : 0;
                const hours = Math.floor(diffMs / 3600000);
                const mins = Math.floor((diffMs % 3600000) / 60000);
                const isLate = ci && ci.getHours() > 10 || (ci && ci.getHours() === 10 && ci.getMinutes() > 15);

                return (
                  <tr key={emp.id} className="hover:bg-slate-50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-full bg-teal-100 text-teal-700 flex items-center justify-center font-bold">{(emp.full_name || "?").charAt(0).toUpperCase()}</div>
                        <div>
                          <div className="font-bold text-slate-800">{emp.full_name || "Unknown"}</div>
                          <div className="text-xs text-slate-500">{emp.designation}
                            {emp.employment_type === "Intern" && <span className="ml-2 px-2 py-0.5 bg-blue-100 text-blue-700 rounded-full text-xs">Intern</span>}
                          </div>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <select value={rec.status} onChange={(e) => update(emp.id, "status", e.target.value)}
                          className={`py-2 px-3 rounded-lg border border-slate-200 text-sm font-semibold outline-none ${statusColors[rec.status]}`}>
                          <option value="Present">Present</option>
                          <option value="Absent">Absent</option>
                          <option value="Half Day">Half Day</option>
                          <option value="Leave">On Leave</option>
                        </select>
                        <select value={rec.work_mode} onChange={(e) => update(emp.id, "work_mode", e.target.value)}
                          className="py-2 px-3 rounded-lg border border-slate-200 text-sm text-slate-600 outline-none">
                          <option>Office</option>
                          <option>WFH</option>
                          <option>Site</option>
                        </select>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-2">
                        <input type="time" value={rec.check_in} onChange={(e) => update(emp.id, "check_in", e.target.value)}
                          className="py-2 px-3 rounded-lg border border-slate-200 text-sm outline-none w-32" />
                        {isLate && <span className="text-xs bg-red-50 text-red-500 px-2 py-0.5 rounded-full font-semibold">Late</span>}
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <input type="time" value={rec.check_out} onChange={(e) => update(emp.id, "check_out", e.target.value)}
                        className="py-2 px-3 rounded-lg border border-slate-200 text-sm outline-none w-32" />
                    </td>
                    <td className="px-6 py-4">
                      {diffMs > 0 ? (
                        <span className="text-sm font-semibold text-slate-600 bg-slate-100 px-3 py-1.5 rounded-lg">{hours}h {mins}m</span>
                      ) : "—"}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </GlassCard>

      <div className="flex justify-end gap-4">
        <Button variant="secondary" onClick={markAllPresent}><i className="fa-solid fa-check-double"></i> Mark All Present</Button>
        <Button variant="primary" onClick={() => setSaved(true)} className="!bg-gradient-to-r !from-teal-500 !to-emerald-500 !shadow-teal-500/30">
          Save Attendance
        </Button>
      </div>
    </div>
  );
}