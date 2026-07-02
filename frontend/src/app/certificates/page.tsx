import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

const certs = [
  { id: 1, name: "Rahul Singh", type: "Internship", issued: "2025-06-01", duration: "3 Months", issued_by: "Webworks Digital Agency" },
  { id: 2, name: "Anjali Sharma", type: "Appreciation", issued: "2025-05-15", duration: "—", issued_by: "Webworks Digital Agency" },
  { id: 3, name: "Ravi Kumar", type: "Experience", issued: "2025-04-01", duration: "1 Year", issued_by: "Webworks Digital Agency" },
];

const mous = [
  { id: 1, college: "DY Patil College", date: "2025-01-10", contact: "Dr. Mehta" },
  { id: 2, college: "VJTI Mumbai", date: "2025-03-20", contact: "Prof. Shah" },
];

export default function CertificatesPage() {
  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-amber-400 to-yellow-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800">Certificates & MoUs</h2>
        </div>
        <div className="flex gap-3">
          <Link href="/certificates/create-mou"><Button variant="secondary"><i className="fa-solid fa-handshake"></i> New MoU</Button></Link>
          <Link href="/certificates/create"><Button variant="primary"><i className="fa-solid fa-certificate"></i> Issue Certificate</Button></Link>
        </div>
      </div>

      {/* Certificates */}
      <div>
        <h3 className="font-bold text-slate-700 text-lg mb-4 flex items-center gap-2">
          <i className="fa-solid fa-certificate text-amber-500"></i> Issued Certificates
        </h3>
        <GlassCard className="p-0 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                  <th className="px-6 py-4">Recipient</th>
                  <th className="px-6 py-4">Type</th>
                  <th className="px-6 py-4">Duration</th>
                  <th className="px-6 py-4">Issued On</th>
                  <th className="px-6 py-4">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {certs.map((c) => (
                  <tr key={c.id} className="hover:bg-slate-50 transition-colors">
                    <td className="px-6 py-4 font-bold text-slate-800">{c.name}</td>
                    <td className="px-6 py-4">
                      <span className="px-3 py-1 rounded-full text-xs font-bold bg-amber-100 text-amber-700">{c.type}</span>
                    </td>
                    <td className="px-6 py-4 text-sm text-slate-600">{c.duration}</td>
                    <td className="px-6 py-4 text-sm text-slate-600">{new Date(c.issued).toLocaleDateString()}</td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <button className="w-8 h-8 rounded-lg bg-blue-50 text-blue-600 hover:bg-blue-100 flex items-center justify-center" title="View">
                          <i className="fa-solid fa-eye"></i>
                        </button>
                        <button className="w-8 h-8 rounded-lg bg-emerald-50 text-emerald-600 hover:bg-emerald-100 flex items-center justify-center" title="Print/Download">
                          <i className="fa-solid fa-print"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </GlassCard>
      </div>

      {/* MOUs */}
      <div>
        <h3 className="font-bold text-slate-700 text-lg mb-4 flex items-center gap-2">
          <i className="fa-solid fa-handshake text-indigo-500"></i> Memorandums of Understanding (MoUs)
        </h3>
        <GlassCard className="p-0 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-slate-50 border-b border-slate-200 text-slate-500 text-xs uppercase tracking-wider font-bold">
                  <th className="px-6 py-4">College / Institution</th>
                  <th className="px-6 py-4">Contact Person</th>
                  <th className="px-6 py-4">Date Signed</th>
                  <th className="px-6 py-4">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {mous.map((m) => (
                  <tr key={m.id} className="hover:bg-slate-50 transition-colors">
                    <td className="px-6 py-4 font-bold text-slate-800">{m.college}</td>
                    <td className="px-6 py-4 text-sm text-slate-600">{m.contact}</td>
                    <td className="px-6 py-4 text-sm text-slate-600">{new Date(m.date).toLocaleDateString()}</td>
                    <td className="px-6 py-4">
                      <div className="flex gap-2">
                        <button className="w-8 h-8 rounded-lg bg-blue-50 text-blue-600 hover:bg-blue-100 flex items-center justify-center">
                          <i className="fa-solid fa-eye"></i>
                        </button>
                        <button className="w-8 h-8 rounded-lg bg-emerald-50 text-emerald-600 hover:bg-emerald-100 flex items-center justify-center">
                          <i className="fa-solid fa-print"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </GlassCard>
      </div>
    </div>
  );
}