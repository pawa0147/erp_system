import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import prisma from "@/lib/prisma";
import { redirect } from "next/navigation";
import { editClient } from "@/app/actions/clients";

export default async function EditClientPage({ params }: { params: Promise<{ id: string }> }) {
  const resolvedParams = await params;
  const id = parseInt(resolvedParams.id, 10);
  
  if (isNaN(id)) {
    redirect("/clients");
  }

  const client = await prisma.client.findUnique({
    where: { id }
  });

  if (!client) {
    redirect("/clients");
  }

  // We define the Server Action locally or import it to handle updates
  async function handleUpdate(formData: FormData) {
    "use server";
    await editClient(id, formData);
    redirect("/clients");
  }

  return (
    <div className="space-y-6 max-w-4xl">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Edit Client: {client.name}</h2>
        </div>
        <Link href="/clients">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to List
          </Button>
        </Link>
      </div>

      <GlassCard>
        <form action={handleUpdate} className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input name="name" label="Full Name" defaultValue={client.name} required />
            <Input name="company_name" label="Company Name" defaultValue={client.company_name || ""} />
            <Input name="email" label="Email Address" type="email" defaultValue={client.email || ""} />
            <Input name="phone" label="Phone Number" defaultValue={client.phone || ""} />
            <Input name="referral_source" label="Referral Source" defaultValue={client.referral_source || ""} />
            <Input name="total_project_amount" label="Total Project Amount (₹)" type="number" defaultValue={(client.total_project_amount || 0).toString()} />
            <Input name="amount_received" label="Amount Received (₹)" type="number" defaultValue={(client.amount_received || 0).toString()} />
            
            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Payment Status
              </label>
              <select
                name="payment_status"
                defaultValue={client.payment_status || "pending"}
                className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
              >
                <option value="pending" className="text-slate-900">Pending</option>
                <option value="partial" className="text-slate-900">Partial</option>
                <option value="completed" className="text-slate-900">Completed</option>
              </select>
            </div>
          </div>
          
          <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
            <Link href="/clients">
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
