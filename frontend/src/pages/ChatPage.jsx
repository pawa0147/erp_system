import { useState, useRef, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";

const contacts = [
  { id: 1, name: "Amit Sharma", role: "Senior Developer", online: true, avatar: "A", color: "bg-blue-100 text-blue-700" },
  { id: 2, name: "Priya Patel", role: "UX Designer", online: true, avatar: "P", color: "bg-pink-100 text-pink-700" },
  { id: 3, name: "Rahul Singh", role: "Marketing Lead", online: false, avatar: "R", color: "bg-emerald-100 text-emerald-700" },
  { id: 4, name: "Team General", role: "Group Chat", online: true, avatar: "#", color: "bg-purple-100 text-purple-700" },
];

const initMessages = {
  1: [
    { from: "Amit", text: "Hey! How's the project going?", time: "10:30 AM", isMine: false },
    { from: "Me", text: "Going well! Just finishing up the API integration.", time: "10:32 AM", isMine: true },
    { from: "Amit", text: "Awesome! Let me know when you need a review.", time: "10:33 AM", isMine: false },
  ],
  2: [
    { from: "Priya", text: "Can you check the new mockups I uploaded?", time: "9:15 AM", isMine: false },
    { from: "Me", text: "Sure, sending feedback shortly.", time: "9:20 AM", isMine: true },
  ],
  3: [],
  4: [
    { from: "Rahul", text: "Team standup at 11 AM today!", time: "8:00 AM", isMine: false },
    { from: "Priya", text: "Got it 👍", time: "8:05 AM", isMine: false },
    { from: "Me", text: "Will be there!", time: "8:10 AM", isMine: true },
  ],
};

export default function ChatPage() {
  const [active, setActive] = useState(1);
  const [messages, setMessages] = useState(initMessages);
  const [input, setInput] = useState("");
  const bottomRef = useRef(null);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, active]);

  const send = () => {
    if (!input.trim()) return;
    const now = new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });
    setMessages((prev) => ({
      ...prev,
      [active]: [...(prev[active] || []), { from: "Me", text: input, time: now, isMine: true }],
    }));
    setInput("");
  };

  const contact = contacts.find((c) => c.id === active);

  return (
    <div className="space-y-4">
      <div className="flex items-center gap-4 mb-4">
        <div className="w-2 h-8 bg-gradient-to-b from-violet-500 to-purple-500 rounded-full"></div>
        <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Team Chat</h2>
      </div>

      <GlassCard className="p-0 overflow-hidden" style={{ height: "calc(100vh - 200px)", minHeight: "500px" }}>
        <div className="flex h-full">
          {/* Sidebar */}
          <div className="w-72 border-r border-slate-100 dark:border-white/10 flex flex-col">
            <div className="p-4 border-b border-slate-100 dark:border-white/10">
              <div className="relative">
                <i className="fa-solid fa-magnifying-glass absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-sm"></i>
                <input placeholder="Search..." className="w-full py-2 pl-9 pr-4 bg-slate-100 dark:bg-white/5 text-slate-800 dark:text-slate-100 placeholder-slate-400 dark:placeholder-slate-500 border border-transparent dark:border-white/10 rounded-xl text-sm outline-none focus:ring-2 focus:ring-purple-300" />
              </div>
            </div>
            <div className="flex-1 overflow-y-auto">
              {contacts.map((c) => (
                <button key={c.id} onClick={() => setActive(c.id)}
                  className={`w-full flex items-center gap-3 p-4 hover:bg-slate-50 dark:hover:bg-white/[0.02] transition-colors text-left ${active === c.id ? "bg-purple-50 dark:bg-purple-500/10 border-r-2 border-purple-500" : ""}`}>
                  <div className="relative">
                    <div className={`w-10 h-10 rounded-full flex items-center justify-center font-bold ${c.color}`}>{c.avatar}</div>
                    {c.online && <div className="absolute -bottom-0.5 -right-0.5 w-3 h-3 bg-emerald-500 rounded-full border-2 border-white dark:border-slate-800"></div>}
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className={`font-semibold text-sm ${active === c.id ? "text-purple-700 dark:text-purple-400" : "text-slate-800 dark:text-slate-200"}`}>{c.name}</div>
                    <div className="text-xs text-slate-400 dark:text-slate-500 truncate">{c.role}</div>
                  </div>
                </button>
              ))}
            </div>
          </div>

          {/* Chat Area */}
          <div className="flex-1 flex flex-col">
            {/* Header */}
            <div className="p-4 border-b border-slate-100 dark:border-white/10 flex items-center gap-3">
              <div className={`w-10 h-10 rounded-full flex items-center justify-center font-bold ${contact.color}`}>{contact.avatar}</div>
              <div>
                <div className="font-bold text-slate-800 dark:text-slate-100">{contact.name}</div>
                <div className="text-xs text-slate-400 dark:text-slate-500 flex items-center gap-1">
                  {contact.online ? <><span className="w-2 h-2 bg-emerald-500 rounded-full"></span> Online</> : "Offline"}
                </div>
              </div>
            </div>

            {/* Messages */}
            <div className="flex-1 overflow-y-auto p-6 space-y-4">
              {(messages[active] || []).map((msg, i) => (
                <div key={i} className={`flex ${msg.isMine ? "justify-end" : "justify-start"}`}>
                  <div className={`max-w-xs lg:max-w-md px-4 py-2.5 rounded-2xl text-sm ${msg.isMine ? "bg-gradient-to-r from-violet-500 to-purple-500 text-white rounded-tr-sm" : "bg-slate-100 dark:bg-white/10 text-slate-800 dark:text-slate-200 rounded-tl-sm"}`}>
                    <p>{msg.text}</p>
                    <p className={`text-xs mt-1 ${msg.isMine ? "text-white/70" : "text-slate-400 dark:text-slate-500"}`}>{msg.time}</p>
                  </div>
                </div>
              ))}
              {(messages[active] || []).length === 0 && (
                <div className="text-center py-12 text-slate-400 dark:text-slate-500">
                  <i className="fa-regular fa-comment-dots text-4xl mb-3 block opacity-30"></i>
                  <p>No messages yet. Start the conversation!</p>
                </div>
              )}
              <div ref={bottomRef}></div>
            </div>

            {/* Input */}
            <div className="p-4 border-t border-slate-100 dark:border-white/10">
              <div className="flex gap-3 items-center">
                <input value={input} onChange={(e) => setInput(e.target.value)}
                  onKeyDown={(e) => { if (e.key === "Enter") send(); }}
                  placeholder="Type a message..."
                  className="flex-1 py-3 px-4 bg-slate-100 dark:bg-white/5 text-slate-800 dark:text-slate-100 placeholder-slate-400 dark:placeholder-slate-500 border border-transparent dark:border-white/10 rounded-xl text-sm outline-none focus:ring-2 focus:ring-purple-300 transition-all" />
                <button onClick={send} className="w-11 h-11 bg-gradient-to-r from-violet-500 to-purple-500 text-white rounded-xl flex items-center justify-center hover:shadow-lg hover:shadow-purple-300 transition-all">
                  <i className="fa-solid fa-paper-plane"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </GlassCard>
    </div>
  );
}
