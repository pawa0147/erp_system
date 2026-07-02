import prisma from "@/lib/prisma";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { redirect } from "next/navigation";
import EditEmployeeForm from "./EditEmployeeForm";

export default async function EditEmployeePage({ params }: { params: { id: string } }) {
  const employee = await prisma.employee.findUnique({
    where: { id: parseInt(params.id) },
  });

  if (!employee) {
    redirect("/hr");
  }

  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-600 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Edit Employee</h2>
        </div>
        <Link href="/hr">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to Directory
          </Button>
        </Link>
      </div>

      <GlassCard>
        <EditEmployeeForm employee={employee} />
      </GlassCard>
    </div>
  );
}
