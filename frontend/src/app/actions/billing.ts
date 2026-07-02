"use server";
import prisma from "@/lib/prisma";
import { revalidatePath } from "next/cache";

export async function addBill(formData: FormData) {
  try {
    const itemsRaw = formData.get("items") as string;
    const parsedItems = itemsRaw ? JSON.parse(itemsRaw) : [];
    
    const data = {
      client_name: formData.get("client_name") as string,
      client_email: formData.get("client_email") as string || null,
      client_phone: formData.get("client_phone") as string || null,
      client_address: formData.get("client_address") as string || null,
      bill_date: formData.get("bill_date") as string || null,
      due_date: formData.get("due_date") as string || null,
      subtotal: parseFloat(formData.get("subtotal") as string) || 0,
      tax_percent: parseFloat(formData.get("tax_percent") as string) || 18,
      tax_amount: parseFloat(formData.get("tax_amount") as string) || 0,
      total_amount: parseFloat(formData.get("total_amount") as string) || 0,
      status: formData.get("status") as string || "Unpaid",
      notes: formData.get("notes") as string || null,
      items: {
        create: parsedItems.map((item: any) => ({
          description: item.description,
          quantity: parseFloat(item.quantity) || 1,
          unit_price: parseFloat(item.unit_price) || 0,
          total: (parseFloat(item.quantity) || 1) * (parseFloat(item.unit_price) || 0)
        }))
      }
    };

    await prisma.bill.create({ data });
    revalidatePath("/billing");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to add bill:", error);
    return { success: false, error: error.message };
  }
}

export async function deleteBill(id: number) {
  try {
    await prisma.bill.delete({ where: { id } });
    revalidatePath("/billing");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to delete bill:", error);
    return { success: false, error: error.message };
  }
}

export async function addQuote(formData: FormData) {
  try {
    const itemsRaw = formData.get("items") as string;
    const parsedItems = itemsRaw ? JSON.parse(itemsRaw) : [];

    const data = {
      client_name: formData.get("client_name") as string,
      client_email: formData.get("client_email") as string || null,
      client_phone: formData.get("client_phone") as string || null,
      client_address: formData.get("client_address") as string || null,
      quotation_date: formData.get("quotation_date") as string || null,
      subtotal: parseFloat(formData.get("subtotal") as string) || 0,
      tax_percent: parseFloat(formData.get("tax_percent") as string) || 18,
      tax_amount: parseFloat(formData.get("tax_amount") as string) || 0,
      total_amount: parseFloat(formData.get("total_amount") as string) || 0,
      notes: formData.get("notes") as string || null,
      items: {
        create: parsedItems.map((item: any) => ({
          description: item.description,
          quantity: parseFloat(item.quantity) || 1,
          unit_price: parseFloat(item.unit_price) || 0,
          total: (parseFloat(item.quantity) || 1) * (parseFloat(item.unit_price) || 0)
        }))
      }
    };

    await prisma.quotation.create({ data });
    revalidatePath("/billing");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to add quote:", error);
    return { success: false, error: error.message };
  }
}

export async function deleteQuote(id: number) {
  try {
    await prisma.quotation.delete({ where: { id } });
    revalidatePath("/billing");
    return { success: true };
  } catch (error: any) {
    console.error("Failed to delete quote:", error);
    return { success: false, error: error.message };
  }
}
