import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function CreateCampaignPage() {
  return (
    <div className="space-y-6 max-w-2xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Launch Campaign</h2>
        </div>
        <Link href="/marketing/campaigns"><Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button></Link>
      </div>

      <GlassCard>
        <form className="space-y-6">
          <Input 
            label={<>Campaign Name <span className="text-red-500">*</span></>} 
            placeholder="e.g. Summer Sale 2025" 
            required 
          />
          
          <div className="grid grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">
                Platform <span className="text-red-500">*</span>
              </label>
              <select required className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-indigo-500 transition-all">
                <option value="">Choose Platform</option>
                <option>Google</option>
                <option>Facebook</option>
                <option>Instagram</option>
                <option>LinkedIn</option>
                <option>Twitter</option>
                <option>YouTube</option>
              </select>
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700">Campaign Type</label>
              <select className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-indigo-500 transition-all">
                <option>Search Ads</option>
                <option>Display Ads</option>
                <option>Social Media</option>
                <option>Email</option>
                <option>Influencer</option>
              </select>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-6">
            <Input 
              label={<>Total Budget (₹) <span className="text-red-500">*</span></>} 
              type="number" 
              placeholder="0" 
              required 
            />
            <Input label="Target Audience Reach" type="number" placeholder="0" />
          </div>

          <div className="grid grid-cols-2 gap-6">
            <Input label="Start Date" type="date" defaultValue={new Date().toISOString().split("T")[0]} required />
            <Input label="End Date" type="date" />
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 mb-2 block">Campaign Description / Goals</label>
            <textarea rows={3} placeholder="Describe the campaign goals and target audience..."
              className="w-full py-3 px-4 rounded-xl border-2 border-slate-200 bg-white/50 font-medium text-slate-800 outline-none focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 transition-all resize-none"></textarea>
          </div>

          <div className="pt-4 border-t border-slate-100 flex justify-end gap-4">
            <Link href="/marketing/campaigns"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" className="!bg-gradient-to-r !from-indigo-500 !to-purple-500">
              <i className="fa-solid fa-rocket"></i> Launch Campaign
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}