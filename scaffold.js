const fs = require('fs');
const path = require('path');

const routes = [
  'billing', 'billing/create-bill', 'billing/create-quote', 'billing/list-bills', 'billing/list-quotes',
  'calendar',
  'certificates', 'certificates/create', 'certificates/create-mou',
  'chat',
  'clients', 'clients/add',
  'employee-portal',
  'finance', 'finance/transactions', 'finance/add-transaction', 'finance/reports',
  'hr', 'hr/add-employee', 'hr/attendance', 'hr/attendance-report', 'hr/leaves', 'hr/payroll', 'hr/calendar', 'hr/feedback', 'hr/intern-reports',
  'legal', 'legal/add',
  'marketing', 'marketing/campaigns', 'marketing/create-campaign',
  'monitoring',
  'personal', 'personal/add-transaction',
  'projects', 'projects/add',
  'research',
  'sales', 'sales/add-lead',
  'settings',
  'social', 'social/add',
  'tasks', 'tasks/add',
  'users', 'users/activity-log'
];

const basePath = path.join(__dirname, 'frontend', 'src', 'app');

routes.forEach(route => {
  const dirPath = path.join(basePath, route);
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
  }
  
  const filePath = path.join(dirPath, 'page.tsx');
  if (!fs.existsSync(filePath)) {
    const title = route.split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
    const content = `export default function ${title.replace(/\s/g, '')}Page() {
  return (
    <div className="space-y-6">
      <div className="flex items-center gap-4">
        <div className="w-2 h-8 bg-gradient-to-b from-blue-500 to-indigo-500 rounded-full"></div>
        <h2 className="text-2xl font-extrabold text-slate-800">${title}</h2>
      </div>
      <div className="bg-white/80 backdrop-blur-md p-8 rounded-2xl shadow-[0_10px_40px_-10px_rgba(0,0,0,0.05)] border border-white">
        <p className="text-slate-500">This module is currently under construction. Check back soon!</p>
      </div>
    </div>
  );
}`;
    fs.writeFileSync(filePath, content);
    console.log(`Created ${route}/page.tsx`);
  }
});
