# Bill & Quotation Generator

A complete PHP-based application for generating and managing bills and quotations.

## Features
- **Dashboard**: Quick overview of total quotes, bills, and revenue.
- **Create Quotations**: Generate professional quotations with dynamic line items.
- **Create Bills**: Generate invoices with status tracking (Paid, Unpaid, Overdue).
- **PDF/Print**: Built-in clean print layout for saving as PDF.
- **Data Management**: View and delete history of all transactions.

## Setup Instructions

1. **Database Setup**:
   - Open your MySQL management tool (e.g., phpMyAdmin, Workbench).
   - Import the `database.sql` file located in this directory.
   - This will create a database named `billing_system` and the necessary tables.

2. **Configuration**:
   - The database connection is defined in `config.php`.
   - Default credentials are set to `root` / `root`.
   - Change them if your local environment is different.

3. **Running the App**:
   - Place this project folder in your local server directory (e.g., XAMPP `htdocs`).
   - Open your browser and navigate to `http://localhost/Quatation/` (or your specific folder name).

## Tech Stack
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Backend**: PHP
- **Database**: MySQL
- **Design**: "Inter" font, Modern Dashboard UI
