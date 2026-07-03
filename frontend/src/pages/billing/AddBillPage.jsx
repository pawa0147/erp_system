import { useState, useMemo, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useNavigate, useSearchParams } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function AddBillPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const type = searchParams.get("type") === "quote" ? "quote" : "bill";
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  
  const [dbServices, setDbServices] = useState([]);
  const [clients, setClients] = useState([]);
  const [clientData, setClientData] = useState({
    client_name: "",
    client_email: "",
    client_phone: "",
    client_gstin: "",
    place_of_supply: "",
    client_address: ""
  });

  useEffect(() => {
    fetch(`${API_URL}/api/clients`)
      .then(res => res.json())
      .then(data => setClients(data))
      .catch(console.error);
      
    fetch(`${API_URL}/api/services`)
      .then(res => res.json())
      .then(data => setDbServices(data))
      .catch(console.error);
  }, []);

  const [items, setItems] = useState([{ id: Date.now(), description: "", hsn_sac: "", quantity: 1, unit_price: 0 }]);
  const [taxPercent, setTaxPercent] = useState(18);

  const subtotal = useMemo(() => {
    return items.reduce((sum, item) => sum + (item.quantity * item.unit_price), 0);
  }, [items]);

  const taxAmount = (subtotal * taxPercent) / 100;
  const totalAmount = subtotal + taxAmount;

  function addItem() {
    setItems([...items, { id: Date.now(), description: "", hsn_sac: "", quantity: 1, unit_price: 0 }]);
  }

  function removeItem(id) {
    if (items.length === 1) return;
    setItems(items.filter(item => item.id !== id));
  }

  function updateItem(id, field, value) {
    setItems(items.map(item => {
      if (item.id === id) {
        return { ...item, [field]: value };
      }
      return item;
    }));
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);
    setError("");
    
    const formData = new FormData(e.target);
    const data = Object.fromEntries(formData.entries());

    // Add calculated fields & JSON stringified items
    data.subtotal = subtotal;
    data.tax_amount = taxAmount;
    data.total_amount = totalAmount;
    data.tax_percent = taxPercent;
    data.items = items;
    data.type = type;

    try {
      const res = await fetch(`${API_URL}/api/billing`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
      });
      
      if (res.ok) {
        navigate("/billing");
      } else {
        const errorData = await res.json();
        setError(errorData.error || "An error occurred while saving.");
      }
    } catch (err) {
      setError("Network error. Could not save.");
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="space-y-6 max-w-5xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Create New {type === "bill" ? "Bill" : "Quotation"}</h2>
        </div>
        <Link to="/billing">
          <Button variant="secondary">
            <i className="fa-solid fa-arrow-left"></i> Back to List
          </Button>
        </Link>
      </div>

      <GlassCard>
        {error && <div className="mb-4 text-sm font-semibold text-red-500">{error}</div>}
        <form onSubmit={handleSubmit} className="space-y-8">
          <div className="bg-blue-50/50 dark:bg-blue-500/10 border border-blue-100 dark:border-blue-500/30 rounded-xl p-5 mb-8">
            <label className="text-sm font-bold flex items-center gap-2 text-blue-700 dark:text-blue-400 mb-3">
              <i className="fa-solid fa-user-check"></i> Select Existing Client (Auto-fill)
            </label>
            <select 
              onChange={(e) => {
                const client = clients.find(c => c.id === parseInt(e.target.value));
                if (client) {
                  setClientData({
                    client_name: client.name || client.company_name || "",
                    client_email: client.email || "",
                    client_phone: client.phone || "",
                    client_gstin: client.gst_number || "",
                    place_of_supply: client.state || "",
                    client_address: client.address || ""
                  });
                } else {
                  setClientData({ client_name: "", client_email: "", client_phone: "", client_gstin: "", place_of_supply: "", client_address: "" });
                }
              }}
              className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
            >
              <option value="">-- Create New Client --</option>
              {clients.map(c => (
                <option key={c.id} value={c.id}>{c.name || c.company_name} {c.email ? `(${c.email})` : ''}</option>
              ))}
            </select>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Input name="client_name" label="Client Name" value={clientData.client_name} onChange={e => setClientData({...clientData, client_name: e.target.value})} required />
            <Input name="client_email" label="Client Email" type="email" value={clientData.client_email} onChange={e => setClientData({...clientData, client_email: e.target.value})} />
            
            <Input name="client_phone" label="Client Phone" value={clientData.client_phone} onChange={e => setClientData({...clientData, client_phone: e.target.value})} />
            
            {type === "bill" ? (
              <Input name="bill_date" label="Bill Date" type="date" defaultValue={new Date().toISOString().split('T')[0]} required />
            ) : (
              <Input name="quotation_date" label="Quotation Date" type="date" defaultValue={new Date().toISOString().split('T')[0]} required />
            )}

            <Input name="client_gstin" label="Client GSTIN (Optional)" placeholder="GST NUMBER" value={clientData.client_gstin} onChange={e => setClientData({...clientData, client_gstin: e.target.value})} />
            
            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                Place of Supply (State)
              </label>
              <select name="place_of_supply" value={clientData.place_of_supply} onChange={e => setClientData({...clientData, place_of_supply: e.target.value})} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200">
                <option value="">Select State</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Delhi">Delhi</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Gujarat">Gujarat</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
              </select>
            </div>

            {type === "bill" && (
              <>
                <div className="flex flex-col gap-1.5 w-full">
                  <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Status</label>
                  <select name="status" className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200">
                    <option value="Unpaid">Unpaid</option>
                    <option value="Paid">Paid</option>
                    <option value="Overdue">Overdue</option>
                  </select>
                </div>
                <Input name="due_date" label="Due Date" type="date" />
              </>
            )}
            
            <div className="md:col-span-2">
              <div className="flex flex-col gap-1.5 w-full">
                <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Client Address</label>
                <textarea 
                  name="client_address" 
                  rows={2} 
                  value={clientData.client_address}
                  onChange={e => setClientData({...clientData, client_address: e.target.value})}
                  className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
                ></textarea>
              </div>
            </div>
          </div>
          
          <div>
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-slate-800 dark:text-slate-200">Items</h3>
            </div>
            
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-black/5 dark:bg-white/5 border-b border-black/5 dark:border-white/10 text-slate-500 dark:text-slate-400 text-xs uppercase tracking-wider font-bold">
                    <th className="px-4 py-3 w-1/3">Description</th>
                    <th className="px-4 py-3 w-28">HSN/SAC</th>
                    <th className="px-4 py-3 w-28">Quantity</th>
                    <th className="px-4 py-3 w-40">Unit Price</th>
                    <th className="px-4 py-3 w-32">Total</th>
                    <th className="px-4 py-3 w-16">Action</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-black/5 dark:divide-white/5">
                  {items.map((item) => (
                    <tr key={item.id} className="hover:bg-black/[0.02] dark:hover:bg-white/[0.02] transition-colors">
                      <td className="px-4 py-2 align-top">
                        <div className="flex flex-col gap-2">
                          <select 
                            value={item.service_type || ""}
                            onChange={(e) => {
                              const serviceTitle = e.target.value;
                              const selectedService = dbServices.find(s => s.title === serviceTitle);
                              
                              setItems(items.map(it => {
                                if (it.id === item.id) {
                                  return { 
                                    ...it, 
                                    service_type: serviceTitle,
                                    description: selectedService ? selectedService.description || "" : it.description,
                                    unit_price: selectedService ? Number(selectedService.price || 0) : it.unit_price
                                  };
                                }
                                return it;
                              }));
                            }}
                            className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm text-slate-700 dark:text-slate-300 bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700"
                          >
                            <option value="">Select a Service (Optional)</option>
                            {dbServices.length > 0 ? (
                              dbServices.map(s => (
                                <option key={s.id} value={s.title}>{s.title}</option>
                              ))
                            ) : (
                              // Fallback options if DB is empty
                              <>
                                <option value="Content Writing Services">Content Writing Services</option>
                                <option value="Domain Registration">Domain Registration</option>
                                <option value="Dynamic Web Application">Dynamic Web Application</option>
                                <option value="E-Commerce Website">E-Commerce Website</option>
                                <option value="Facebook/Instagram Ad Setup">Facebook/Instagram Ad Setup</option>
                                <option value="Google Business Profile Setup">Google Business Profile Setup</option>
                                <option value="Logo Design Package">Logo Design Package</option>
                                <option value="Malware Removal & Security">Malware Removal & Security</option>
                                <option value="Monthly Maintenance">Monthly Maintenance</option>
                                <option value="Payment Gateway Integration">Payment Gateway Integration</option>
                                <option value="Professional Email Setup">Professional Email Setup</option>
                                <option value="SEO Audit & Optimization">SEO Audit & Optimization</option>
                                <option value="Social Media Graphics Pack">Social Media Graphics Pack</option>
                                <option value="Static Website Development (Basic)">Static Website Development (Basic)</option>
                                <option value="Static Website Package (Social/Leader)">Static Website Package (Social/Leader)</option>
                                <option value="UI/UX Design Service">UI/UX Design Service</option>
                                <option value="Web Hosting (Standard)">Web Hosting (Standard)</option>
                                <option value="Website Speed Optimization">Website Speed Optimization</option>
                                <option value="Yearly Website Maintenance (AMC)">Yearly Website Maintenance (AMC)</option>
                              </>
                            )}
                          </select>
                          <textarea 
                            required
                            value={item.description} 
                            onChange={(e) => updateItem(item.id, "description", e.target.value)}
                            className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                            placeholder="Item description"
                            rows={2}
                          />
                        </div>
                      </td>
                      <td className="px-4 py-2 align-top">
                        <input 
                          type="text" 
                          value={item.hsn_sac || ""} 
                          onChange={(e) => updateItem(item.id, "hsn_sac", e.target.value)}
                          className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                          placeholder="e.g. 998311"
                        />
                      </td>
                      <td className="px-4 py-2 align-top">
                        <input 
                          type="number" 
                          min="0.1" step="0.1" required
                          value={item.quantity} 
                          onChange={(e) => updateItem(item.id, "quantity", parseFloat(e.target.value) || 0)}
                          className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                        />
                      </td>
                      <td className="px-4 py-2 align-top">
                        <input 
                          type="number" 
                          min="0" step="0.01" required
                          value={item.unit_price} 
                          onChange={(e) => updateItem(item.id, "unit_price", parseFloat(e.target.value) || 0)}
                          className="glass-input-topbar w-full py-2 px-3 rounded-lg font-medium outline-none transition-all duration-200 text-sm"
                        />
                      </td>
                      <td className="px-4 py-2 align-top font-bold text-slate-700 dark:text-slate-300 pt-4">
                        ₹{(item.quantity * item.unit_price).toFixed(2)}
                      </td>
                      <td className="px-4 py-2 align-top pt-3">
                        <button 
                          type="button" 
                          onClick={() => removeItem(item.id)}
                          disabled={items.length === 1}
                          className="w-8 h-8 rounded-lg bg-rose-600 text-white hover:bg-rose-700 flex items-center justify-center disabled:opacity-30 transition-colors shadow-sm shadow-rose-600/30"
                        >
                          <i className="fa-solid fa-trash"></i>
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div className="mt-4">
              <Button type="button" variant="secondary" onClick={addItem}>
                <i className="fa-solid fa-plus"></i> Add Item
              </Button>
            </div>
          </div>

          <div className="flex justify-end">
            <div className="w-full md:w-1/3 space-y-3 bg-black/5 dark:bg-white/5 p-6 rounded-2xl border border-black/5 dark:border-white/10">
              <div className="flex justify-between text-slate-600 dark:text-slate-400 font-medium">
                <span>Subtotal</span>
                <span>₹{subtotal.toFixed(2)}</span>
              </div>
              <div className="flex justify-between items-center text-slate-600 dark:text-slate-400 font-medium">
                <span>GST Rate (%)</span>
                <input 
                  type="number" 
                  min="0" max="100" 
                  value={taxPercent}
                  onChange={(e) => setTaxPercent(parseFloat(e.target.value) || 0)}
                  className="glass-input-topbar w-20 py-1 px-2 rounded-lg font-medium outline-none transition-all duration-200 text-sm text-right"
                />
              </div>
              <div className="flex justify-between text-slate-600 dark:text-slate-400 font-medium pb-3 border-b border-black/10 dark:border-white/10">
                <span>Tax Amount</span>
                <span>₹{taxAmount.toFixed(2)}</span>
              </div>
              <div className="flex justify-between text-xl font-bold text-slate-800 dark:text-slate-100 pt-1">
                <span>Total</span>
                <span>₹{totalAmount.toFixed(2)}</span>
              </div>
            </div>
          </div>

          <div className="flex flex-col gap-1.5 w-full mt-4">
             <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">
               Notes
             </label>
             <textarea 
               name="notes" 
               rows={3} 
               className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all duration-200"
               placeholder="Additional terms or notes..."
             ></textarea>
          </div>

          <div className="pt-4 flex justify-end gap-4 border-t border-slate-200 dark:border-white/10">
            <Link to="/billing">
              <Button type="button" variant="secondary">Cancel</Button>
            </Link>
            <Button type="submit" variant="primary" disabled={loading}>
              <i className={loading ? "fa-solid fa-spinner fa-spin" : "fa-solid fa-save"}></i> 
              {loading ? "Saving..." : `Save ${type === "bill" ? "Bill" : "Quotation"}`}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
