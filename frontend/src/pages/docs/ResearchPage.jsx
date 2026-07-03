import { GlassCard } from "@/components/ui/GlassCard";
import { Button } from "@/components/ui/Button";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

import { useState, useEffect } from "react";

export default function ResearchPage() {
  const [folders, setFolders] = useState([]);
  const [files, setFiles] = useState([]);

  useEffect(() => {
    fetch(`${API_URL}/api/rd/folders`)
      .then(res => res.ok ? res.json() : [])
      .then(data => setFolders(data))
      .catch(err => console.error(err));

    fetch(`${API_URL}/api/rd/files`)
      .then(res => res.ok ? res.json() : [])
      .then(data => setFiles(data))
      .catch(err => console.error(err));
  }, []);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-4">
          <div className="w-2 h-8 bg-gradient-to-b from-cyan-500 to-blue-500 rounded-full"></div>
          <h2 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100">Research & Development</h2>
        </div>
        <Button variant="primary"><i className="fa-solid fa-folder-plus"></i> New Folder</Button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {folders.map((folder) => (
          <GlassCard key={folder.id} className="hover:shadow-lg transition-all hover:-translate-y-1 cursor-pointer group p-0 overflow-hidden">
            <div className={`bg-gradient-to-br ${folder.color || 'from-blue-500 to-indigo-500'} p-6 text-white`}>
              <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center text-3xl mb-4 group-hover:scale-110 transition-transform">
                <i className={`fa-solid ${folder.icon || 'fa-folder'}`}></i>
              </div>
              <div className="font-bold text-lg">{folder.name}</div>
            </div>
            <div className="p-4 flex items-center justify-between">
              <div>
                <div className="text-sm font-semibold text-slate-700 dark:text-slate-300">{files.filter(f => f.folder_id === folder.id).length} files</div>
                <div className="text-xs text-slate-400 dark:text-slate-500">Updated {new Date(folder.created_at).toLocaleDateString()}</div>
              </div>
              <button className="w-8 h-8 bg-slate-100 dark:bg-white/10 text-slate-500 dark:text-slate-400 rounded-lg flex items-center justify-center hover:bg-slate-200 dark:hover:bg-white/20 transition-colors">
                <i className="fa-solid fa-arrow-right text-sm"></i>
              </button>
            </div>
          </GlassCard>
        ))}
      </div>

      <GlassCard>
        <h3 className="font-bold text-slate-800 dark:text-slate-100 mb-4">Recent Files</h3>
        <div className="space-y-3">
          {files.map((file) => (
            <div key={file.id} className="flex items-center justify-between py-3 border-b border-slate-100 dark:border-white/5 last:border-0 hover:bg-slate-50 dark:hover:bg-white/[0.02] -mx-2 px-2 rounded-lg transition-colors">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-blue-50 dark:bg-blue-500/10 text-blue-500 dark:text-blue-400 rounded-xl flex items-center justify-center">
                  <i className={`fa-regular ${file.file_type === 'pdf' ? 'fa-file-pdf' : 'fa-file'} text-lg`}></i>
                </div>
                <div>
                  <div className="font-semibold text-sm text-slate-800 dark:text-slate-200">{file.name}</div>
                  <div className="text-xs text-slate-400">{folders.find(f => f.id === file.folder_id)?.name || "Uncategorized"} • {new Date(file.created_at).toLocaleDateString()}</div>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="text-xs text-slate-400">{file.date}</span>
                <button className="w-8 h-8 bg-blue-50 dark:bg-blue-500/10 text-blue-500 dark:text-blue-400 rounded-lg flex items-center justify-center hover:bg-blue-100 dark:hover:bg-blue-500/20 transition-colors">
                  <i className="fa-solid fa-download text-xs"></i>
                </button>
              </div>
            </div>
          ))}
        </div>
      </GlassCard>
    </div>
  );
}
