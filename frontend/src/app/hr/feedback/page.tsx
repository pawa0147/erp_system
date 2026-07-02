export default function FeedbackPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center gap-4">
        <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
        <h2 className="text-2xl font-extrabold text-slate-800">Feedback</h2>
      </div>
      <div className="bg-white/80 backdrop-blur-md p-8 rounded-2xl shadow-[0_10px_40px_-10px_rgba(0,0,0,0.05)] border border-white">
        <p className="text-slate-500">This module is currently under construction. Check back soon!</p>
      </div>
    </div>
  );
}