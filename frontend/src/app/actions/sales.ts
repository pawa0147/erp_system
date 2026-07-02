"use server";
import prisma from "@/lib/prisma";
import { revalidatePath } from "next/cache";

export async function addLead(formData: FormData) {
  try {
    const data = {
      company_name: formData.get("company_name") as string,
      founder_name: formData.get("founder_name") as string || null,
      contact_number: formData.get("contact_number") as string || null,
      email: formData.get("email") as string || null,
      business_type: formData.get("business_type") as string || null,
      category: formData.get("category") as string || null,
      gst_number: formData.get("gst_number") as string || null,
      status: formData.get("status") as string || "New",
      notes: formData.get("notes") as string || null,
    };

    await prisma.lead.create({ data });
    revalidatePath("/sales");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to add lead:", error);
    return { success: false, error: error.message };
  }
}

export async function editLead(id: number, formData: FormData) {
  try {
    const data = {
      company_name: formData.get("company_name") as string,
      founder_name: formData.get("founder_name") as string || null,
      contact_number: formData.get("contact_number") as string || null,
      email: formData.get("email") as string || null,
      business_type: formData.get("business_type") as string || null,
      category: formData.get("category") as string || null,
      gst_number: formData.get("gst_number") as string || null,
      status: formData.get("status") as string || "New",
      notes: formData.get("notes") as string || null,
    };

    await prisma.lead.update({
      where: { id },
      data,
    });
    revalidatePath("/sales");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to edit lead:", error);
    return { success: false, error: error.message };
  }
}

export async function deleteLead(id: number) {
  try {
    await prisma.lead.delete({ where: { id } });
    revalidatePath("/sales");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to delete lead:", error);
    return { success: false, error: error.message };
  }
}
