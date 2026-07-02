"use server";

import prisma from "@/lib/prisma";
import { revalidatePath } from "next/cache";

export async function addEmployee(formData: FormData) {
  try {
    const data = {
      full_name: formData.get("full_name") as string,
      designation: formData.get("designation") as string,
      employment_type: formData.get("employment_type") as string || "Full Time",
      college_name: formData.get("college_name") as string || null,
      email: formData.get("email") as string || null,
      phone: formData.get("phone") as string || null,
      address: formData.get("address") as string || null,
      base_salary: parseFloat((formData.get("base_salary") as string) || "0"),
      joining_date: formData.get("joining_date") ? new Date(formData.get("joining_date") as string) : null,
      bank_name: formData.get("bank_name") as string || null,
      account_number: formData.get("account_number") as string || null,
      ifsc_code: formData.get("ifsc_code") as string || null,
      pan_card: formData.get("pan_card") as string || null,
    };

    await prisma.employee.create({ data });
    revalidatePath("/hr");
    return { success: true };
  } catch (error: any) {
    console.error("Error adding employee:", error);
    return { success: false, error: error.message || "Failed to add employee" };
  }
}

export async function deleteEmployee(id: number) {
  try {
    await prisma.employee.delete({
      where: { id },
    });
    revalidatePath("/hr");
    return { success: true };
  } catch (error: any) {
    console.error("Error deleting employee:", error);
    return { success: false, error: "Failed to delete employee" };
  }
}

export async function updateEmployee(id: number, formData: FormData) {
  try {
    const data = {
      full_name: formData.get("full_name") as string,
      designation: formData.get("designation") as string,
      employment_type: formData.get("employment_type") as string || "Full Time",
      college_name: formData.get("college_name") as string || null,
      email: formData.get("email") as string || null,
      phone: formData.get("phone") as string || null,
      address: formData.get("address") as string || null,
      base_salary: parseFloat((formData.get("base_salary") as string) || "0"),
      joining_date: formData.get("joining_date") ? new Date(formData.get("joining_date") as string) : null,
      bank_name: formData.get("bank_name") as string || null,
      account_number: formData.get("account_number") as string || null,
      ifsc_code: formData.get("ifsc_code") as string || null,
      pan_card: formData.get("pan_card") as string || null,
    };

    await prisma.employee.update({
      where: { id },
      data,
    });
    
    revalidatePath("/hr");
    return { success: true };
  } catch (error: any) {
    console.error("Error updating employee:", error);
    return { success: false, error: error.message || "Failed to update employee" };
  }
}
