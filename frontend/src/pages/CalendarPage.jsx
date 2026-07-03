import { useState } from "react";
import { GlassCard } from "@/components/ui/GlassCard";

const events = [
  { date: 5, title: "Q2 Review Meeting", type: "meeting", color: "bg-blue-500" },
  { date: 10, title: "Product Launch", type: "launch", color: "bg-purple-500" },
  { date: 15, title: "Team Outing", type: "event", color: "bg-emerald-500" },
  { date: 20, title: "Client Presentation", type: "meeting", color: "bg-amber-500" },
  { date: 25, title: "Invoice Due - Acme", type: "billing", color: "bg-red-500" },
];

export default function CalendarPage() {
  const today = new Date();
  const [currentDate, setCurrentDate] = useState(new Date(today.getFullYear(), today.getMonth(), 1));
  const [selectedDay, setSelectedDay] = useState(today.getDate());

  const year = currentDate.getFullYear();
  const month = currentDate.getMonth();
  const daysInMonth = new Date(year, month + 1, 0).getDate();
  const firstDayOffset = (new Date(year, month, 1).getDay() + 6) % 7; // Mon=0

  const prevMonth = () => setCurrentDate(new Date(year, month - 1, 1));
  const nextMonth = () => setCurrentDate(new Date(year, month + 1, 1));

  const dayEvents = events.filter((e) => e.date === selectedDay);
  const eventDays = events.map((e) => e.date);

  return (
    <div className="space-y-6">
      <div className="flex items-center gap-4 mb-8">
        <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
        <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Calendar</h2>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Calendar */}
        <div className="lg:col-span-2">
          <GlassCard>
            <div className="flex justify-between items-center mb-6">
              <button onClick={prevMonth} className="w-9 h-9 rounded-xl bg-slate-100 dark:bg-white/5 text-slate-600 dark:text-slate-400 hover:bg-slate-200 dark:hover:bg-white/10 flex items-center justify-center transition-colors">
                <i className="fa-solid fa-chevron-left"></i>
              </button>
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100">
                {currentDate.toLocaleDateString("en-IN", { month: "long", year: "numeric" })}
              </h3>
              <button onClick={nextMonth} className="w-9 h-9 rounded-xl bg-slate-100 dark:bg-white/5 text-slate-600 dark:text-slate-400 hover:bg-slate-200 dark:hover:bg-white/10 flex items-center justify-center transition-colors">
                <i className="fa-solid fa-chevron-right"></i>
              </button>
            </div>

            <div className="grid grid-cols-7 gap-2 text-center mb-3">
              {["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"].map((d) => (
                <div key={d} className="text-xs font-bold text-slate-400 dark:text-slate-500 uppercase">{d}</div>
              ))}
            </div>

            <div className="grid grid-cols-7 gap-2">
              {Array.from({ length: firstDayOffset }).map((_, i) => <div key={`e${i}`}></div>)}
              {Array.from({ length: daysInMonth }).map((_, i) => {
                const day = i + 1;
                const isToday = day === today.getDate() && month === today.getMonth() && year === today.getFullYear();
                const hasEvent = eventDays.includes(day);
                const isSelected = day === selectedDay;
                return (
                  <button key={day} onClick={() => setSelectedDay(day)}
                    className={`aspect-square rounded-xl flex flex-col items-center justify-center gap-1 text-sm font-medium transition-all
                      ${isSelected ? "bg-blue-500 text-white shadow-lg shadow-blue-200 dark:shadow-none" :
                        isToday ? "bg-blue-100 dark:bg-blue-500/20 text-blue-700 dark:text-blue-400 font-bold" :
                        "text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-white/5"}`}>
                    {day}
                    {hasEvent && <div className={`w-1.5 h-1.5 rounded-full ${isSelected ? "bg-white" : "bg-blue-500"}`}></div>}
                  </button>
                );
              })}
            </div>
          </GlassCard>
        </div>

        {/* Events Sidebar */}
        <div>
          <GlassCard className="h-full">
            <h3 className="font-bold text-slate-800 dark:text-slate-100 mb-4">
              {selectedDay ? `Events for ${currentDate.toLocaleDateString("en-IN", { month: "long" })} ${selectedDay}` : "Select a day"}
            </h3>
            {dayEvents.length > 0 ? (
              <div className="space-y-3">
                {dayEvents.map((ev, i) => (
                  <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-white/[0.02] rounded-xl">
                    <div className={`w-3 h-3 rounded-full mt-1 flex-none ${ev.color}`}></div>
                    <div>
                      <div className="font-semibold text-sm text-slate-800 dark:text-slate-200">{ev.title}</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 capitalize mt-0.5">{ev.type}</div>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-8 text-slate-400 dark:text-slate-500">
                <i className="fa-regular fa-calendar text-3xl mb-3 block opacity-40"></i>
                <p className="text-sm">No events scheduled</p>
              </div>
            )}
          </GlassCard>
        </div>
      </div>
    </div>
  );
}
