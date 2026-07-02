import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { ThemeProvider } from "@/components/ThemeProvider";
import MobileLayout from "@/components/MobileLayout";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Webworks ERP System",
  description: "Modern ERP — White & Gold Edition",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet"
        />
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
        />
      </head>
      <body
        className={inter.className}
        style={{ color: "var(--text-primary)", background: "var(--bg-base)", margin: 0, minHeight: "100vh" }}
      >
        <ThemeProvider attribute="class" defaultTheme="system" enableSystem>

          {/* Golden aurora orbs */}
          <div className="glass-orb glass-orb-1" />
          <div className="glass-orb glass-orb-2" />
          <div className="glass-orb glass-orb-3" />

          <MobileLayout>{children}</MobileLayout>

        </ThemeProvider>
      </body>
    </html>
  );
}
