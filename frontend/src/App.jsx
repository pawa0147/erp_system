import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { ThemeProvider } from '@/components/ThemeProvider';
import MobileLayout from '@/components/MobileLayout';
import DashboardPage from './pages/DashboardPage';
import SalesPage from './pages/SalesPage';
import ClientsPage from './pages/ClientsPage';
import HRPage from './pages/HRPage';
import BillingPage from './pages/BillingPage';
import AddLeadPage from './pages/sales/AddLeadPage';
import EditLeadPage from './pages/sales/EditLeadPage';
import AddClientPage from './pages/clients/AddClientPage';
import EditClientPage from './pages/clients/EditClientPage';
import AddEmployeePage from './pages/hr/AddEmployeePage';
import EditEmployeePage from './pages/hr/EditEmployeePage';
import AddBillPage from './pages/billing/AddBillPage';
import ViewBillPage from './pages/billing/ViewBillPage';
import BillsListPage from './pages/billing/BillsListPage';
import QuotesListPage from './pages/billing/QuotesListPage';
import ProjectsPage from './pages/ProjectsPage';
import TasksPage from './pages/TasksPage';
import MarketingPage from './pages/MarketingPage';
import CalendarPage from './pages/CalendarPage';
import ChatPage from './pages/ChatPage';
import AttendancePage from './pages/hr/AttendancePage';
import LeavesPage from './pages/hr/LeavesPage';
import PayrollPage from './pages/hr/PayrollPage';
import FinancePage from './pages/finance/FinancePage';
import FinanceTransactionsPage from './pages/finance/FinanceTransactionsPage';
import LegalDocsPage from './pages/legal/LegalDocsPage';
import SocialAccountsPage from './pages/marketing/SocialAccountsPage';
import SystemUsersPage from './pages/admin/SystemUsersPage';
import SettingsPage from './pages/admin/SettingsPage';
import CertificatesPage from './pages/docs/CertificatesPage';
import ResearchPage from './pages/docs/ResearchPage';

import AddProjectPage from './pages/projects/AddProjectPage';
import AddTaskPage from './pages/tasks/AddTaskPage';
import AddTransactionPage from './pages/finance/AddTransactionPage';
import FinancialReportsPage from './pages/finance/FinancialReportsPage';
import CampaignsListPage from './pages/marketing/CampaignsListPage';
import CreateCampaignPage from './pages/marketing/CreateCampaignPage';
import EmployeePortalPage from './pages/admin/EmployeePortalPage';
import ActivityLogPage from './pages/admin/ActivityLogPage';
import SystemMonitoringPage from './pages/admin/SystemMonitoringPage';
import CreateCertificatePage from './pages/certificates/CreateCertificatePage';
import CreateMouPage from './pages/certificates/CreateMouPage';
import UploadDocumentPage from './pages/legal/UploadDocumentPage';
import ConnectAccountPage from './pages/social/ConnectAccountPage';
import AttendanceReportPage from './pages/hr/AttendanceReportPage';
import HRCalendarPage from './pages/hr/HRCalendarPage';
import FeedbackPage from './pages/hr/FeedbackPage';
import InternReportsPage from './pages/hr/InternReportsPage';
import PersonalDashboardPage from './pages/personal/PersonalDashboardPage';
import AddPersonalTransactionPage from './pages/personal/AddPersonalTransactionPage';

// We'll migrate the remaining pages progressively

function App() {
  return (
    <BrowserRouter>
      <ThemeProvider attribute="class" defaultTheme="system" enableSystem>
        {/* Golden aurora orbs */}
        <div className="glass-orb glass-orb-1 print:hidden" />
        <div className="glass-orb glass-orb-2 print:hidden" />
        <div className="glass-orb glass-orb-3 print:hidden" />

        <MobileLayout>
          <Routes>
            <Route path="/" element={<DashboardPage />} />
            
            {/* Sales */}
            <Route path="/sales" element={<SalesPage />} />
            <Route path="/sales/add" element={<AddLeadPage />} />
            <Route path="/sales/edit/:id" element={<EditLeadPage />} />

            {/* Clients */}
            <Route path="/clients" element={<ClientsPage />} />
            <Route path="/clients/add" element={<AddClientPage />} />
            <Route path="/clients/edit/:id" element={<EditClientPage />} />

            {/* HR */}
            <Route path="/hr" element={<HRPage />} />
            <Route path="/hr/add" element={<AddEmployeePage />} />
            <Route path="/hr/edit/:id" element={<EditEmployeePage />} />
            <Route path="/hr/attendance" element={<AttendancePage />} />
            <Route path="/hr/leaves" element={<LeavesPage />} />
            <Route path="/hr/payroll" element={<PayrollPage />} />

            {/* Billing */}
            <Route path="/billing" element={<BillingPage />} />
            <Route path="/billing/bills" element={<BillsListPage />} />
            <Route path="/billing/quotes" element={<QuotesListPage />} />
            <Route path="/billing/add" element={<AddBillPage />} />
            <Route path="/billing/view/:id" element={<ViewBillPage />} />

            {/* Batch B: Operations & Communication */}
            <Route path="/projects" element={<ProjectsPage />} />
            <Route path="/tasks" element={<TasksPage />} />
            <Route path="/marketing" element={<MarketingPage />} />
            <Route path="/calendar" element={<CalendarPage />} />
            <Route path="/chat" element={<ChatPage />} />

            {/* Finance */}
            <Route path="/finance" element={<FinancePage />} />
            <Route path="/finance/transactions" element={<FinanceTransactionsPage />} />

            {/* Batch D: Documents & Admin */}
            <Route path="/legal" element={<LegalDocsPage />} />
            <Route path="/legal/add" element={<UploadDocumentPage />} />
            
            <Route path="/social" element={<SocialAccountsPage />} />
            <Route path="/social/add" element={<ConnectAccountPage />} />
            
            <Route path="/users" element={<SystemUsersPage />} />
            <Route path="/users/activity-log" element={<ActivityLogPage />} />
            
            <Route path="/settings" element={<SettingsPage />} />
            <Route path="/certificates" element={<CertificatesPage />} />
            <Route path="/certificates/create" element={<CreateCertificatePage />} />
            <Route path="/certificates/create-mou" element={<CreateMouPage />} />
            <Route path="/research" element={<ResearchPage />} />

            {/* New Sub-Pages */}
            <Route path="/projects/add" element={<AddProjectPage />} />
            <Route path="/tasks/add" element={<AddTaskPage />} />
            
            <Route path="/finance/add-transaction" element={<AddTransactionPage />} />
            <Route path="/finance/reports" element={<FinancialReportsPage />} />
            
            <Route path="/marketing/campaigns" element={<CampaignsListPage />} />
            <Route path="/marketing/create-campaign" element={<CreateCampaignPage />} />
            
            <Route path="/employee-portal" element={<EmployeePortalPage />} />
            <Route path="/monitoring" element={<SystemMonitoringPage />} />
            
            <Route path="/hr/attendance-report" element={<AttendanceReportPage />} />
            <Route path="/hr/calendar" element={<HRCalendarPage />} />
            <Route path="/hr/feedback" element={<FeedbackPage />} />
            <Route path="/hr/intern-reports" element={<InternReportsPage />} />
            
            <Route path="/personal" element={<PersonalDashboardPage />} />
            <Route path="/personal/add-transaction" element={<AddPersonalTransactionPage />} />

            {/* Placeholder for others */}
            <Route path="*" element={<div className="p-8 text-center text-slate-500">Page not migrated yet</div>} />
          </Routes>
        </MobileLayout>
      </ThemeProvider>
    </BrowserRouter>
  );
}

export default App;
