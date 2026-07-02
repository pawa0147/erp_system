import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function AddLeadPage() {
  return (
    <div className="space-y-6 max-w-3xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-orange-500 to-amber-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Add New Lead</h2>
        </div>
        <Link href="/sales"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input label="Full Name *" placeholder="e.g. Rohan Gupta" required />
            <Input label="Company" placeholder="e.g. NextGen Tech" />
            <Input label="Email Address" type="email" placeholder="rohan@nextgen.com" />
            <Input label="Phone Number" placeholder="+91 98765 43210" />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Lead Source</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-orange-500 transition-all">
                <option>Website</option>
                <option>Referral</option>
                <option>LinkedIn</option>
                <option>Cold Call</option>
                <option>Event</option>
                <option>Other</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Lead Status</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-orange-500 transition-all">
                <option>Cold</option>
                <option>Warm</option>
                <option>Hot</option>
              </select>
            </div>
            <Input label="Potential Value (₹)" type="number" placeholder="0" />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 mb-2 block">Notes / Description</label>
            <textarea rows={3} placeholder="Any additional information about this lead..."
              className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10 transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-100 flex justify-end gap-4">
            <Link href="/sales"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-orange-500 !to-amber-500 !shadow-orange-500/30">
              <i className="fa-solid fa-plus"></i> Add Lead
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}