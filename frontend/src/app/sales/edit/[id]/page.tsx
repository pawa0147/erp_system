import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import prisma from "@/lib/prisma";
import { redirect } from "next/navigation";
import { editLead } from "@/app/actions/sales";

export default async function EditLeadPage({ params }: { params: Promise<{ id: string }> }) {
  const resolvedParams = await params;
  const id = parseInt(resolvedParams.id, 10);
  
  if (isNaN(id)) {
    redirect("/sales");
  }

  const lead = await prisma.lead.findUnique({
    where: { id }
  });

  if (!lead) {
    redirect("/sales");
  }

  async function handleUpdate(formData: FormData) {
    "use server";
    await editLead(id, formData);
    redirect("/sales");
  }

  return (
    <div className="space-y-6 max-w-4xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Edit Lead: {lead.company_name}</h2>
        </div>
        <Link href="/sales">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to List
          </Button>
        </Link>
      </div>

      <GlassCard>
        <form action={handleUpdate} className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input name="company_name" label="Company Name" defaultValue={lead.company_name} required />
            <Input name="founder_name" label="Founder / Contact Person" defaultValue={lead.founder_name || ""} />
            <Input name="email" label="Email Address" type="email" defaultValue={lead.email || ""} />
            <Input name="contact_number" label="Phone Number" defaultValue={lead.contact_number || ""} />
            <Input name="gst_number" label="GST Number" defaultValue={lead.gst_number || ""} />
            
            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Business Type
              </label>
              <select
                name="business_type"
                defaultValue={lead.business_type || ""}
                className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
              >
                <option value="">Select Type</option>
                <option value="B2B">B2B</option>
                <option value="B2C">B2C</option>
                <option value="Manufacturing">Manufacturing</option>
                <option value="Service">Service</option>
                <option value="Retail">Retail</option>
              </select>
            </div>

            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Category
              </label>
              <select
                name="category"
                defaultValue={lead.category || ""}
                className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
              >
                <option value="">Select Category</option>
                <option value="Technology">Technology</option>
                <option value="Healthcare">Healthcare</option>
                <option value="Real Estate">Real Estate</option>
                <option value="Education">Education</option>
                <option value="Other">Other</option>
              </select>
            </div>

            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Status
              </label>
              <select
                name="status"
                defaultValue={lead.status || "New"}
                className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
              >
                <option value="New">New Lead</option>
                <option value="Contacted">Contacted</option>
                <option value="Proposal Sent">Proposal Sent</option>
                <option value="Negotiation">Negotiation</option>
                <option value="Converted">Converted (Won)</option>
                <option value="Lost">Lost</option>
              </select>
            </div>
          </div>
          
          <div className="flex flex-col gap-1.5 w-full mt-4">
             <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
               Notes
             </label>
             <textarea 
               name="notes" 
               rows={4} 
               defaultValue={lead.notes || ""}
               className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
               placeholder="Any additional details..."
             ></textarea>
          </div>

          <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
            <Link href="/sales">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary">
              <i className="fa-solid fa-save"></i> Save Changes
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
