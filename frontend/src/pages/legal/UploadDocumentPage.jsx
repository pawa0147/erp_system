import { GlassCard } from "@/components/ui/GlassCard";
import { Input } from "@/components/ui/Input";
import { Button } from "@/components/ui/Button";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export default function UploadDocumentPage() {
  const navigate = useNavigate();
  const [dragActive, setDragActive] = useState(false);
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    title: "",
    doc_type: "NDA",
    status: "Active"
  });

  const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    
    // In a real app we'd upload the file to S3/Cloud storage here.
    // For this boilerplate, we'll just store the metadata.
    const payload = {
      ...formData,
      file_path: `/uploads/${formData.title.replace(/\s+/g, '_').toLowerCase()}.pdf`,
      client_id: null
    };

    try {
      const res = await fetch(`${API_URL}/api/legal`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (res.ok) {
        navigate('/legal');
      } else {
        alert("Failed to upload document");
      }
    } catch (err) {
      console.error(err);
      alert("Error uploading document");
    } finally {
      setLoading(false);
    }
  };

  const handleDrag = (e) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true);
    } else if (e.type === "dragleave") {
      setDragActive(false);
    }
  };

  return (
    <div className="space-y-6 max-w-2xl mx-auto">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-indigo-500 to-blue-500 rounded-full shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Upload Legal Document</h2>
        </div>
        <Link to="/legal">
          <Button variant="secondary"><i className="fa-solid fa-arrow-left"></i> Back</Button>
        </Link>
      </div>

      <GlassCard>
        <form className="space-y-6" onSubmit={handleSubmit}>
          <Input label="Document Name *" name="title" value={formData.title} onChange={handleChange} placeholder="e.g. Employee NDA - John Doe" required />
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Category</label>
              <select name="doc_type" value={formData.doc_type} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800" value="NDA">NDA</option>
                <option className="text-slate-800 dark:bg-slate-800" value="Contract">Employment Contract</option>
                <option className="text-slate-800 dark:bg-slate-800" value="Agreement">Service Agreement</option>
                <option className="text-slate-800 dark:bg-slate-800" value="Other">Other Document</option>
              </select>
            </div>
            
            <div className="flex flex-col gap-2">
              <label className="text-sm font-semibold text-slate-700 dark:text-slate-300">Status</label>
              <select name="status" value={formData.status} onChange={handleChange} className="glass-input-topbar w-full py-3 px-4 rounded-xl font-medium outline-none transition-all">
                <option className="text-slate-800 dark:bg-slate-800" value="Active">Active</option>
                <option className="text-slate-800 dark:bg-slate-800" value="Draft">Draft</option>
              </select>
            </div>
          </div>

          <div>
            <label className="text-sm font-semibold text-slate-700 dark:text-slate-300 mb-2 block">Upload File *</label>
            <div 
              className={`border-2 border-dashed rounded-2xl p-10 text-center transition-all ${
                dragActive ? 'border-indigo-500 bg-indigo-50 dark:bg-indigo-500/10' : 'border-slate-300 dark:border-white/10 bg-black/5 dark:bg-white/5'
              }`}
              onDragEnter={handleDrag}
              onDragLeave={handleDrag}
              onDragOver={handleDrag}
              onDrop={(e) => { e.preventDefault(); e.stopPropagation(); setDragActive(false); }}
            >
              <i className="fa-solid fa-cloud-arrow-up text-4xl text-indigo-400 mb-4"></i>
              <p className="text-slate-600 dark:text-slate-400 font-medium">Drag & drop your file here, or click to browse</p>
              <p className="text-xs text-slate-400 dark:text-slate-500 mt-2">Supported formats: PDF, DOCX, JPG, PNG (Max 10MB)</p>
              <input type="file" className="hidden" id="file_upload" />
              <label htmlFor="file_upload" className="mt-4 inline-block px-4 py-2 bg-white dark:bg-slate-800 rounded-lg shadow-sm font-semibold text-indigo-600 cursor-pointer hover:shadow-md transition-shadow border border-slate-200 dark:border-white/10">
                Browse Files
              </label>
            </div>
          </div>

          <div className="pt-4 border-t border-slate-200 dark:border-white/10 flex justify-end gap-4">
            <Link to="/legal"><Button type="button" variant="secondary">Cancel</Button></Link>
            <Button type="submit" variant="primary" disabled={loading} className="!bg-gradient-to-r !from-indigo-500 !to-blue-500 !shadow-indigo-500/30">
              {loading ? "Uploading..." : <><i className="fa-solid fa-upload"></i> Upload Document</>}
            </Button>
          </div>
        </form>
      </GlassCard>
    </div>
  );
}
