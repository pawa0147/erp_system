import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";

export default function CalendarPage() {
  const today = new Date();
  const [currentDate, setCurrentDate] = useState(new Date(today.getFullYear(), today.getMonth(), 1));
  const [selectedDay, setSelectedDay] = useState(today.getDate());
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedColor, setSelectedColor] = useState('blue');
  const [events, setEvents] = useState([]);
  const [editingEvent, setEditingEvent] = useState(null);

  const fetchEvents = async () => {
    try {
      const res = await fetch(`${API_URL}/api/calendar`);
      const data = await res.json();
      setEvents(data);
    } catch (err) {
      console.error('Failed to fetch events:', err);
    }
  };

  useEffect(() => {
    fetchEvents();
  }, []);

  const handleSaveEvent = async (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    const title = formData.get('title');
    const start_date = formData.get('start_date');
    const end_date = formData.get('end_date');
    const description = formData.get('description');
    
    const colorMap = { blue: 'bg-blue-500', green: 'bg-emerald-500', orange: 'bg-amber-500', red: 'bg-red-500', purple: 'bg-purple-500' };
    const color = colorMap[selectedColor];

    try {
      const url = editingEvent ? `${API_URL}/api/calendar/${editingEvent.id}` : `${API_URL}/api/calendar`;
      const method = editingEvent ? 'PUT' : 'POST';
      
      const res = await fetch(url, {
        method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ title, description, start_date, end_date, color })
      });
      if (res.ok) {
        setIsModalOpen(false);
        setEditingEvent(null);
        fetchEvents();
      }
    } catch (err) {
      console.error(err);
    }
  };

  const formatDateForInput = (dateString) => {
    if (!dateString) return '';
    const d = new Date(dateString);
    const tzOffset = d.getTimezoneOffset() * 60000;
    return new Date(d - tzOffset).toISOString().slice(0, 16);
  };

  const getDefaultStartDate = () => {
    const year = currentDate.getFullYear();
    const month = currentDate.getMonth();
    const d = new Date(year, month, selectedDay || today.getDate(), 9, 0, 0);
    const tzOffset = d.getTimezoneOffset() * 60000;
    return new Date(d - tzOffset).toISOString().slice(0, 16);
  };

  const handleDeleteEvent = async (id) => {
    if (!window.confirm("Are you sure you want to delete this event?")) return;
    try {
      const res = await fetch(`${API_URL}/api/calendar/${id}`, {
        method: 'DELETE'
      });
      if (res.ok) {
        fetchEvents();
      }
    } catch (err) {
      console.error('Failed to delete event:', err);
    }
  };

  const year = currentDate.getFullYear();
  const month = currentDate.getMonth();
  const daysInMonth = new Date(year, month + 1, 0).getDate();
  const firstDayOffset = (new Date(year, month, 1).getDay() + 6) % 7; // Mon=0

  const prevMonth = () => setCurrentDate(new Date(year, month - 1, 1));
  const nextMonth = () => setCurrentDate(new Date(year, month + 1, 1));

  const currentMonthEvents = events.filter(e => {
    const d = new Date(e.start_date);
    return d.getMonth() === month && d.getFullYear() === year;
  });
  
  const dayEvents = currentMonthEvents.filter(e => new Date(e.start_date).getDate() === selectedDay);
  const eventDays = currentMonthEvents.map(e => new Date(e.start_date).getDate());

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

        {/* Sidebar */}
        <div className="space-y-6">
          <button onClick={() => { setEditingEvent(null); setIsModalOpen(true); }} className="w-full py-3 px-4 bg-blue-500 hover:bg-blue-600 text-white rounded-xl font-bold shadow-lg shadow-blue-500/30 transition-all flex items-center justify-center gap-2">
            <i className="fa-solid fa-plus"></i>
            Create New Event
          </button>

          <GlassCard>
            <h3 className="font-bold text-slate-800 dark:text-slate-100 mb-4">My Calendars</h3>
            <div className="space-y-3">
              {[
                { label: "General Events", color: "bg-blue-500", ring: "group-hover:ring-blue-200" },
                { label: "Task Deadlines", color: "bg-amber-500", ring: "group-hover:ring-amber-200" },
                { label: "Important / Urgent", color: "bg-red-500", ring: "group-hover:ring-red-200" },
                { label: "Personal", color: "bg-emerald-500", ring: "group-hover:ring-emerald-200" },
                { label: "Work", color: "bg-purple-500", ring: "group-hover:ring-purple-200" },
              ].map((cal, i) => (
                <label key={i} className="flex items-center gap-3 cursor-pointer group">
                  <div className={`w-3.5 h-3.5 rounded-full ${cal.color} ring-2 ring-offset-2 ring-transparent ${cal.ring} dark:ring-offset-slate-900 transition-all`}></div>
                  <span className="text-sm font-medium text-slate-600 dark:text-slate-300 group-hover:text-slate-900 dark:group-hover:text-white transition-colors">{cal.label}</span>
                </label>
              ))}
            </div>
          </GlassCard>

          <GlassCard className="bg-blue-50/50 dark:bg-blue-900/10 border-blue-100 dark:border-blue-800/30">
            <div className="flex items-start gap-3">
              <i className="fa-solid fa-lightbulb text-blue-500 mt-1"></i>
              <div>
                <h4 className="font-bold text-sm text-blue-900 dark:text-blue-400 mb-1">Pro Tip:</h4>
                <p className="text-xs text-blue-700/80 dark:text-blue-300/70 leading-relaxed">
                  Drag and drop events on the calendar to instantly reschedule them. Click an event to view or edit details.
                </p>
              </div>
            </div>
          </GlassCard>

          <GlassCard>
            <h3 className="font-bold text-slate-800 dark:text-slate-100 mb-4">
              {selectedDay ? `Events for ${currentDate.toLocaleDateString("en-IN", { month: "long" })} ${selectedDay}` : "Select a day"}
            </h3>
            {dayEvents.length > 0 ? (
              <div className="space-y-3">
                {dayEvents.map((ev, i) => (
                  <div key={ev.id || i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-white/[0.02] rounded-xl group relative">
                    <div className={`w-3 h-3 rounded-full mt-1 flex-none ${ev.color}`}></div>
                    <div className="flex-1">
                      <div className="font-semibold text-sm text-slate-800 dark:text-slate-200">{ev.title}</div>
                      <div className="text-xs text-slate-500 dark:text-slate-400 capitalize mt-0.5">{ev.type || 'Event'}</div>
                    </div>
                    {ev.id && (
                      <div className="opacity-0 group-hover:opacity-100 transition-opacity flex gap-1">
                        <button 
                          onClick={() => {
                            setEditingEvent(ev);
                            const colorMap = { blue: 'bg-blue-500', green: 'bg-emerald-500', orange: 'bg-amber-500', red: 'bg-red-500', purple: 'bg-purple-500' };
                            setSelectedColor(Object.keys(colorMap).find(key => colorMap[key] === ev.color) || 'blue');
                            setIsModalOpen(true);
                          }}
                          className="text-slate-400 hover:text-blue-500 p-1"
                          title="Edit Event"
                        >
                          <i className="fa-solid fa-pen text-sm"></i>
                        </button>
                        <button 
                          onClick={() => handleDeleteEvent(ev.id)}
                          className="text-slate-400 hover:text-red-500 p-1"
                          title="Delete Event"
                        >
                          <i className="fa-solid fa-trash text-sm"></i>
                        </button>
                      </div>
                    )}
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

      {isModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm">
          <GlassCard className="w-full max-w-lg">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-2xl font-bold text-slate-800 dark:text-slate-100">{editingEvent ? 'Edit Event' : 'Add Event'}</h3>
              <button onClick={() => setIsModalOpen(false)} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 transition-colors">
                <i className="fa-solid fa-xmark text-xl"></i>
              </button>
            </div>
            
            <form className="space-y-5" onSubmit={handleSaveEvent}>
              <div>
                <label className="block text-[15px] font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Event Title</label>
                <input name="title" type="text" defaultValue={editingEvent?.title || ''} className="w-full px-4 py-2.5 rounded-xl border border-slate-200 dark:border-white/10 bg-white dark:bg-slate-800 text-slate-800 dark:text-slate-100 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all placeholder:text-slate-400" placeholder="e.g. Project Meeting" required />
              </div>
              
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-[15px] font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Starts</label>
                  <input name="start_date" type="datetime-local" defaultValue={editingEvent ? formatDateForInput(editingEvent.start_date) : getDefaultStartDate()} className="w-full px-3 py-2.5 text-sm sm:text-base rounded-xl border border-slate-200 dark:border-white/10 bg-white dark:bg-slate-800 text-slate-800 dark:text-slate-100 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all" required />
                </div>
                <div>
                  <label className="block text-[15px] font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Ends (Optional)</label>
                  <input name="end_date" type="datetime-local" defaultValue={editingEvent?.end_date ? formatDateForInput(editingEvent.end_date) : ''} className="w-full px-3 py-2.5 text-sm sm:text-base rounded-xl border border-slate-200 dark:border-white/10 bg-white dark:bg-slate-800 text-slate-800 dark:text-slate-100 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all" />
                </div>
              </div>

              <div>
                <label className="block text-[15px] font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Color Code</label>
                <div className="flex items-center gap-3 p-3 border border-slate-200 dark:border-white/10 rounded-xl">
                  {[
                    { id: 'blue', bg: 'bg-blue-500' },
                    { id: 'green', bg: 'bg-emerald-500' },
                    { id: 'orange', bg: 'bg-amber-500' },
                    { id: 'red', bg: 'bg-red-500' },
                    { id: 'purple', bg: 'bg-purple-500' }
                  ].map((c) => (
                    <button 
                      key={c.id} 
                      type="button"
                      onClick={() => setSelectedColor(c.id)}
                      className={`w-8 h-8 rounded-full ${c.bg} flex items-center justify-center transition-all ${
                        selectedColor === c.id 
                          ? 'ring-2 ring-offset-2 ring-blue-500 dark:ring-offset-slate-800' 
                          : 'hover:opacity-80'
                      }`}
                    >
                      {selectedColor === c.id && <i className="fa-solid fa-check text-white text-sm"></i>}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="block text-[15px] font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Description (Optional)</label>
                <textarea name="description" rows="3" defaultValue={editingEvent?.description || ''} className="w-full px-4 py-3 rounded-xl border border-slate-200 dark:border-white/10 bg-white dark:bg-slate-800 text-slate-800 dark:text-slate-100 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all placeholder:text-slate-400 resize-none" placeholder="Add details..."></textarea>
              </div>
              
              <div className="pt-2 flex justify-end gap-3">
                <button type="button" onClick={() => setIsModalOpen(false)} className="px-4 py-2.5 rounded-xl font-medium text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-white/5 transition-colors">
                  Cancel
                </button>
                <button type="submit" className="px-6 py-2.5 rounded-xl font-bold bg-blue-500 text-white hover:bg-blue-600 shadow-lg shadow-blue-500/30 transition-all">
                  Save Event
                </button>
              </div>
            </form>
          </GlassCard>
        </div>
      )}
    </div>
  );
}
