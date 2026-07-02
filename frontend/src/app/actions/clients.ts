"use server";
import prisma from "@/lib/prisma";
import { revalidatePath } from "next/cache";

export async function addClient(formData: FormData) {
  try {
    const data = {
      name: formData.get("name") as string,
      company_name: formData.get("company_name") as string || null,
      email: formData.get("email") as string || null,
      phone: formData.get("phone") as string || null,
      address: formData.get("address") as string || null,
      referral_source: formData.get("referral_source") as string || null,
      total_project_amount: parseFloat((formData.get("total_project_amount") as string) || "0"),
      amount_received: parseFloat((formData.get("amount_received") as string) || "0"),
      payment_status: formData.get("payment_status") as string || "pending",
    };

    await prisma.client.create({ data });
    revalidatePath("/clients");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to add client:", error);
    return { success: false, error: error.message };
  }
}

export async function deleteClient(id: number) {
  try {
    await prisma.client.delete({ where: { id } });
    revalidatePath("/clients");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to delete client:", error);
    return { success: false, error: error.message };
  }
}

export async function editClient(id: number, formData: FormData) {
  try {
    const data = {
      name: formData.get("name") as string,
      company_name: formData.get("company_name") as string || null,
      email: formData.get("email") as string || null,
      phone: formData.get("phone") as string || null,
      address: formData.get("address") as string || null,
      referral_source: formData.get("referral_source") as string || null,
      total_project_amount: parseFloat((formData.get("total_project_amount") as string) || "0"),
      amount_received: parseFloat((formData.get("amount_received") as string) || "0"),
      payment_status: formData.get("payment_status") as string || "pending",
    };

    await prisma.client.update({
      where: { id },
      data,
    });
    revalidatePath("/clients");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to update client:", error);
    return { success: false, error: error.message };
  }
}
