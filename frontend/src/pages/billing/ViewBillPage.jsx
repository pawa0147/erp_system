import { useState, useEffect } from "react";
import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import { Link, useParams, useSearchParams, useNavigate } from "react-router-dom";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function ViewBillPage() {
  const { id } = useParams();
  const [searchParams] = useSearchParams();
  const type = searchParams.get("type") === "quote" ? "quote" : "bill";
  const navigate = useNavigate();
  
  const [record, setRecord] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const endpoint = type === 'quote' ? 'quotes' : 'bills';
    fetch(`${API_URL}/api/${endpoint}/${id}`)
      .then(res => res.json())
      .then(data => {
        if (data.error) {
          setError(data.error);
        } else {
          setRecord(data);
        }
        setLoading(false);
      })
      .catch(err => {
        console.error(err);
        setError("Network error");
        setLoading(false);
      });
  }, [id, type]);

  useEffect(() => {
    if (record) {
      const prefix = type === "bill" ? "INV" : "QT";
      const displayId = `${prefix}-${String(record.id).padStart(4, '0')}`;
      document.title = `${type === "bill" ? "Invoice" : "Quotation"}_${displayId}`;
    }
    return () => {
      document.title = "Webworks ERP System";
    };
  }, [record, type]);

  if (loading) {
    return <div className="p-8 text-center text-slate-500"><i className="fa-solid fa-spinner fa-spin text-2xl"></i></div>;
  }

  if (error || !record) {
    return (
      <div className="p-8 text-center">
        <p className="text-red-500 mb-4">{error || "Record not found"}</p>
        <Link to="/billing">
          <Button variant="secondary">Back to Billing</Button>
        </Link>
      </div>
    );
  }

  const prefix = type === "bill" ? "INV" : "QT";
  const displayId = `${prefix}-${String(record.id).padStart(4, '0')}`;
  const dateField = type === "bill" ? record.bill_date : record.quotation_date;
  const items = record.items || [];

  return (
    <div className="space-y-6 max-w-none mx-auto pb-20 print:space-y-0 print:pb-0 print:m-0">
      <style>
        {`
          @media print {
            @page {
              size: A4;
              margin: 0;
            }
            html, body, #root {
              background: white !important;
              background-image: none !important;
              margin: 0 !important;
              padding: 0 !important;
              -webkit-print-color-adjust: exact;
              print-color-adjust: exact;
            }
            body::before, body::after, #root::before, #root::after {
              display: none !important;
            }
            body * {
              visibility: hidden;
            }
            #printable-invoice, #printable-invoice * {
              visibility: visible;
            }
            #printable-invoice {
              position: absolute !important;
              left: 0 !important;
              top: 0 !important;
              width: 210mm !important;
              height: 297mm !important;
              margin: 0 !important;
              padding: 40px !important;
              box-sizing: border-box !important;
              overflow: hidden !important;
            }
          }
        `}
      </style>
      <div className="flex items-center justify-between mb-8 max-w-4xl mx-auto print:hidden">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-purple-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">{type === "bill" ? "Invoice" : "Quotation"} {displayId}</h2>
        </div>
        <div className="flex gap-3">
          <Link to="/billing">
            <Button variant="secondary">
              <i className="fa-solid fa-arrow-left"></i> Back
            </Button>
          </Link>
          <Button variant="primary" className="!bg-slate-800 hover:!bg-slate-700 dark:!bg-white dark:hover:!bg-slate-200 dark:!text-slate-900" onClick={() => window.print()}>
            <i className="fa-solid fa-print"></i> Print
          </Button>
        </div>
      </div>

      <div className="overflow-x-auto pb-8 print:overflow-visible print:pb-0 print:m-0">
        <div id="printable-invoice" className="bg-white text-slate-800 p-10 md:p-14 shadow-2xl rounded-sm mx-auto w-[210mm] min-h-[297mm] print:shadow-none print:m-0 print:p-0">
          {/* Header Section */}
        <div className="flex flex-row justify-between items-start border-b border-slate-200 pb-8 mb-8">
          <div className="flex items-center gap-4">
            <img src="/quote-logo.jpg" alt="Webworks Studios" className="w-24 object-contain drop-shadow-sm" />
            <div>
              <h1 className="text-2xl font-extrabold tracking-widest text-slate-900 uppercase">Webworks Studios</h1>
              <p className="text-xs font-bold text-slate-600 mb-1">Web Development - UI/UX Design - Digital Solutions</p>
              <p className="text-xs text-slate-500 max-w-xs leading-tight">
                Address: Flat No. 405, Malhar Heights, Dhavari Road, Narhe,
                Pune District, Maharashtra, India - 411041
              </p>
            </div>
          </div>
          
          <div className="flex gap-4 mt-0">
            <div className="w-[2px] bg-orange-500 h-16 block"></div>
            <div className="text-xs space-y-1">
              <div><span className="font-bold text-slate-700">Email:</span> <a href="mailto:hr@webworksstudios.com" className="text-blue-600">hr@webworksstudios.com</a></div>
              <div><span className="font-bold text-slate-700">Phone:</span> <a href="tel:+918208650416" className="text-blue-600">+91 8208650416</a></div>
              <div><span className="font-bold text-slate-700">Website:</span> <a href="https://www.webworksstudios.com" className="text-blue-600">www.webworksstudios.com</a></div>
            </div>
          </div>
        </div>

        {/* Invoice Info */}
        <div className="mb-8">
          <div className="text-sm space-y-1 font-bold text-slate-800">
            <div>{type === "bill" ? "INVOICE" : "QUOTATION"} #: <span className="font-normal">{displayId}</span></div>
            <div>{type === "bill" ? "Invoice" : "Quotation"} Date: <span className="font-normal">{dateField ? new Date(dateField).toLocaleDateString('en-US', {month:'short', day:'numeric', year:'numeric'}) : "N/A"}</span></div>
            <div>Generated On: <span className="font-normal">{new Date().toLocaleString('en-US', {month:'short', day:'numeric', year:'numeric', hour:'2-digit', minute:'2-digit'})}</span></div>
          </div>
        </div>

        {/* Client Info */}
        <div className="mb-10 text-sm">
          <div className="font-bold text-slate-800 mb-1">{type === "bill" ? "Bill To:" : "Quote To:"}</div>
          <div className="text-lg font-extrabold text-slate-900 uppercase mb-1">{record.client_name}</div>
          {record.client_address && <div className="text-slate-600 max-w-sm whitespace-pre-wrap leading-snug mb-1">{record.client_address}</div>}
          {record.client_email && <div className="text-blue-600">{record.client_email}</div>}
          {record.client_phone && <div className="text-slate-600">{record.client_phone}</div>}
        </div>

        {/* Table */}
        <div className="mb-8 overflow-hidden border border-slate-300 rounded-sm">
          <table className="w-full text-left border-collapse text-sm">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-300 text-slate-800 font-bold">
                <th className="py-3 px-4 border-r border-slate-300 text-center w-16">Sr. No.</th>
                <th className="py-3 px-4 border-r border-slate-300">Description</th>
                {items.some(i => i.hsn_sac) && <th className="py-3 px-4 border-r border-slate-300 text-center">HSN/SAC</th>}
                <th className="py-3 px-4 border-r border-slate-300 text-center w-24">Quantity</th>
                <th className="py-3 px-4 border-r border-slate-300 text-right w-32">Unit Price</th>
                <th className="py-3 px-4 text-right w-32">Total</th>
              </tr>
            </thead>
            <tbody>
              {items.map((item, index) => (
                <tr key={item.id} className="border-b border-slate-200 last:border-b-0">
                  <td className="py-4 px-4 border-r border-slate-300 text-center text-slate-600 font-medium">{index + 1}</td>
                  <td className="py-4 px-4 border-r border-slate-300 text-slate-700 whitespace-pre-wrap leading-relaxed">{item.description}</td>
                  {items.some(i => i.hsn_sac) && (
                    <td className="py-4 px-4 border-r border-slate-300 text-center text-slate-600">{item.hsn_sac || '-'}</td>
                  )}
                  <td className="py-4 px-4 border-r border-slate-300 text-center text-slate-600">{item.quantity}</td>
                  <td className="py-4 px-4 border-r border-slate-300 text-right text-slate-600">₹{parseFloat(item.unit_price).toFixed(2)}</td>
                  <td className="py-4 px-4 text-right font-bold text-slate-800">₹{parseFloat(item.total).toFixed(2)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        {/* Totals & Stamp Section */}
        <div className="flex flex-row justify-between items-end mb-16 print:mb-8 relative">
          <div className="w-1/2 mt-0 opacity-0">
            {/* Left side empty for spacing, could hold notes or terms */}
          </div>
          
          <div className="w-[350px]">
            <div className="flex justify-between py-2 text-slate-600 text-sm font-medium">
              <span>Subtotal:</span>
              <span>₹{parseFloat(record.subtotal).toFixed(2)}</span>
            </div>
            <div className="flex justify-between py-2 text-slate-600 text-sm font-medium border-b border-slate-300">
              <span>Tax ({record.tax_percent}%):</span>
              <span>₹{parseFloat(record.tax_amount).toFixed(2)}</span>
            </div>
            <div className="flex justify-between py-4 text-xl font-extrabold text-slate-900 border-b-2 border-slate-900 mb-8">
              <span>Total:</span>
              <span>₹{parseFloat(record.total_amount).toFixed(2)}</span>
            </div>

            {/* Approved Stamp */}
            <div className="flex flex-col items-center mt-12 pr-4">
              <img src="/stamp.png" alt="Approved Stamp" className="w-24 h-24 object-contain -rotate-12 opacity-80 mb-2 mix-blend-multiply" />
              <div className="text-xs text-slate-500 font-medium">Authorized Signatory</div>
            </div>
          </div>
        </div>

        {/* Footer Note */}
        <div className="mt-auto pt-6 border-t border-slate-300 print:mt-8">
          {record.notes && (
            <div className="mb-4 text-sm text-slate-700">
              <span className="font-bold">Notes:</span> {record.notes}
            </div>
          )}
          <div className="text-[10px] text-slate-500">
            Note: This is a computer-generated document. No signature is required.
          </div>
          </div>
        </div>
      </div>
    </div>
  );
}
