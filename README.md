# Advanced Hospital Management System (AHMS)
> **BTech Computer Science & Engineering — Final Year Major Project**  
> *A Modern, Full-Stack MERN Enterprise Hospital Management & Clinical Operations Platform*

---

## 1. Project Introduction

The **Advanced Hospital Management System (AHMS)** is an enterprise-grade full-stack web application architected to streamline end-to-end multispecialty healthcare administration. Designed to mirror real-world hospital ERP software (such as Epic Systems, Cerner, and Practo Ray), AHMS replaces paper-based clinical registers and fragmented spreadsheets with a unified, role-based digital operating system.

The system incorporates **Role-Based Access Control (RBAC)** across five distinct clinical and operational stakeholder roles:
1. **Hospital Administrator (Chief Admin Officer)**
2. **Medical Specialists (Attending Doctors & Surgeons)**
3. **Patients (Outpatient & Inpatient Portal)**
4. **Front-Desk Receptionists (Check-In & Counter Admissions)**
5. **Pharmacists (Drug Dispensation & Stock Inventory)**

---

## 2. Problem Statement

Traditional hospitals and outpatient clinics face significant systemic bottlenecks:
- **Scheduling Conflicts & Long Waiting Times**: Double bookings and lack of real-time slot synchronization lead to chaotic OPD waiting areas.
- **Fragmented Medical Records**: Scattered paper prescriptions and diagnostic lab reports result in incomplete medical histories and increased risk of prescription errors.
- **Stock Depletion & Medicine Wastage**: Lack of automatic low-stock triggers causes crucial drugs to run out without warning or expire unnoticed.
- **Opaque Billing**: Manual calculations of doctor fees, medications, pathology, and facility charges lead to billing inaccuracies and patient dissatisfaction.

---

## 3. Project Objectives

- **Digitize Patient Health Records (EHR)**: Securely centralize patient histories, allergies, chronic conditions, and vital signs.
- **Automate Consultation Scheduling**: Provide real-time slot booking with duplicate prevention algorithms across departments.
- **Streamline Pharmacy & Stock Control**: Implement automated reorder level alerts and batch tracking.
- **Transparent Hospital Billing & Invoicing**: Dynamically generate itemized hospital tax bills with 1-click **jsPDF** downloadable and printable PDF invoices.
- **Role-Centric Dashboard Experience**: Tailor specific analytics, shortcuts, and clinical data to each staff tier.

---

## 4. System Scope

- **Outpatient Care (OPD)**: Patient registration, slot booking, doctor consultation, digital prescription issuance.
- **Pharmacy & Procurement**: Drug batch records, manufacturer tracking, low-stock notifications.
- **Diagnostic & Clinical History**: Medical record tracking including Blood Pressure, Pulse, Temperature, SpO2, and diagnosis.
- **Financial Accounting**: Itemized bills combining consultation fees, laboratory tests, medicine costs, and room charges.

---

## 5. Technology Stack

### Frontend Architecture
- **Framework**: React.js 18 with Vite
- **Styling**: Tailwind CSS (Custom hospital white-blue theme `#0c87eb` / `#0355a2`)
- **Routing**: React Router DOM v6
- **HTTP Client**: Axios with request/response interceptors (Bearer token auto-injection)
- **Icons**: Lucide React Icons
- **Data Visualizations**: Recharts (Monthly revenue AreaCharts, Department volume BarCharts)
- **PDF Generation**: jsPDF & jsPDF-AutoTable for client-side pixel-perfect vector invoice & prescription printing

### Backend Architecture
- **Runtime**: Node.js (v18+ / v20 LTS)
- **Web Framework**: Express.js RESTful API architecture
- **Authentication**: JSON Web Tokens (JWT) with HTTP Authorization Bearer headers
- **Security**: bcryptjs password hashing (10 salt rounds)
- **File Uploads**: Multer disk storage for patient documents
- **Email Notifications**: Nodemailer (with simulated console logging fallback)

### Database Layer
- **Database Engine**: MongoDB (Local MongoDB Community Server or MongoDB Atlas Cloud)
- **Object Data Modeling (ODM)**: Mongoose v8 with schema validation, compound indexes, and pre-save password hashing hooks

---

## 6. Software & System Requirements

- **Operating System**: Windows 10/11, macOS, or Linux
- **Node.js**: Version 18.x or 20.x LTS installed
- **NPM**: Version 9.x or 10.x+
- **MongoDB**: MongoDB Atlas Cluster connection URI **OR** local MongoDB Community Server running on `mongodb://127.0.0.1:27017`
- **Web Browser**: Google Chrome, Mozilla Firefox, Microsoft Edge, or Safari

---

## 7. Folder Structure

```
HOSPITAL/
├── backend/
│   ├── config/
│   │   └── db.js                  # MongoDB Mongoose connection
│   ├── controllers/
│   │   ├── appointmentController.js
│   │   ├── authController.js
│   │   ├── billController.js
│   │   ├── departmentController.js
│   │   ├── doctorController.js
│   │   ├── medicalRecordController.js
│   │   ├── medicineController.js
│   │   ├── patientController.js
│   │   └── statsController.js      # Aggregated live database stats for dashboards
│   ├── middleware/
│   │   ├── auth.js                # JWT protect & role-based authorize middleware
│   │   └── errorHandler.js        # Global error and validation handler
│   ├── models/
│   │   ├── Appointment.js
│   │   ├── Bill.js
│   │   ├── Department.js
│   │   ├── Doctor.js
│   │   ├── MedicalRecord.js
│   │   ├── Medicine.js
│   │   ├── Patient.js
│   │   ├── Prescription.js
│   │   └── User.js
│   ├── routes/
│   │   ├── appointmentRoutes.js
│   │   ├── authRoutes.js
│   │   ├── billRoutes.js
│   │   ├── departmentRoutes.js
│   │   ├── doctorRoutes.js
│   │   ├── medicalRecordRoutes.js
│   │   ├── medicineRoutes.js
│   │   ├── patientRoutes.js
│   │   └── statsRoutes.js
│   ├── utils/
│   │   ├── email.js               # Nodemailer transporter
│   │   ├── multer.js              # Multer document upload configuration
│   │   └── seed.js                # Full viva demonstration database seeder
│   ├── uploads/                   # Uploaded medical records
│   ├── .env.example
│   ├── package.json
│   └── server.js                  # Express API server entrypoint
│
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   ├── appointments/      # BookAppointmentModal, Badges
│   │   │   ├── billing/           # CreateBillModal, InvoiceModal
│   │   │   ├── common/            # Navbar, Sidebar, StatCard, Modal, Toast
│   │   │   └── prescriptions/     # CreatePrescriptionModal, PrescriptionModal
│   │   ├── context/
│   │   │   ├── AuthContext.jsx    # Authentication & User state
│   │   │   └── ToastContext.jsx   # Toast notification dispatcher
│   │   ├── dashboards/
│   │   │   ├── AdminDashboard.jsx
│   │   │   ├── DoctorDashboard.jsx
│   │   │   ├── PatientDashboard.jsx
│   │   │   ├── PharmacistDashboard.jsx
│   │   │   └── ReceptionistDashboard.jsx
│   │   ├── layouts/
│   │   │   └── DashboardLayout.jsx
│   │   ├── pages/
│   │   │   ├── appointments/AppointmentsPage.jsx
│   │   │   ├── auth/Login.jsx & Register.jsx
│   │   │   ├── billing/BillingPage.jsx
│   │   │   ├── departments/DepartmentsPage.jsx
│   │   │   ├── doctors/DoctorDirectory.jsx
│   │   │   ├── medical-records/MedicalRecordsPage.jsx
│   │   │   ├── patients/PatientList.jsx
│   │   │   ├── pharmacy/PharmacyInventory.jsx
│   │   │   ├── LandingPage.jsx
│   │   │   └── NotFound.jsx
│   │   ├── services/              # Axios service endpoints
│   │   ├── utils/                 # PDF generators & currency formatters
│   │   ├── App.jsx                # Main routing & protected routes
│   │   ├── index.css              # Tailwind CSS directives
│   │   └── main.jsx
│   ├── index.html
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.js
│
├── .gitignore
├── package.json                   # Root scripts runner
└── README.md
```

---

## 8. Installation & Setup Instructions

### Step 1: Clone or Open Project
Open a terminal in the project directory:
```bash
cd "c:\Users\SHASHANK AWASTHI\OneDrive\Desktop\HOSPITAL"
```

### Step 2: Configure Backend Environment Variables
Navigate to `backend/` and inspect `.env`:
```bash
cd backend
copy .env.example .env
```

Contents of `backend/.env`:
```env
PORT=5000
MONGODB_URI=mongodb://127.0.0.1:27017/ahms_database
JWT_SECRET=ahms_jwt_secret_token_key_btech_cse_2026_secured
JWT_EXPIRE=7d
CLIENT_URL=http://localhost:5173
```

> **Using MongoDB Atlas (Cloud)?**  
> Simply update `MONGODB_URI` to your Atlas connection string (see Section 9 below).

### Step 3: Install Dependencies
Dependencies are already installed. If running on another computer:
```bash
# In backend/ directory:
npm install

# In frontend/ directory:
npm install
```

### Step 4: Seed the Database with Realistic Viva Demonstration Data
Run the comprehensive seed script to populate realistic departments, doctors, patients, inventory, appointments, prescriptions, and bills:
```bash
# From backend directory:
npm run seed
```

---

## 9. MongoDB Atlas Cloud Database Setup (Optional)

If you prefer to host your database on **MongoDB Atlas**:

1. **Create an Account**: Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) and sign up for a free M0 cluster.
2. **Create a Database User**: Under *Security -> Database Access*, create a user (e.g., `ahms_admin`) with a secure password.
3. **Whitelist IP Address**: Under *Security -> Network Access*, click **Add IP Address** and select **Allow Access from Anywhere (`0.0.0.0/0`)** for development.
4. **Get Connection String**:
   - Go to *Clusters -> Connect -> Drivers*.
   - Copy the URI:
     ```
     mongodb+srv://ahms_admin:<password>@cluster0.mongodb.net/ahms_database?retryWrites=true&w=majority
     ```
5. **Update `.env`**:
   Paste your URI in `backend/.env` as `MONGODB_URI=...`.

---

## 10. How to Run the Application

### Running the Backend:
```bash
cd backend
npm run dev
```
*The REST API server will run at `http://localhost:5000` with active CORS enabled.*

### Running the Frontend:
```bash
cd frontend
npm run dev
```
*The Vite development server will start at `http://localhost:5173`.*

---

## 11. Demonstration Login Credentials (For Viva & Presentation)

The login screen includes **1-Click Demo Fill buttons** for rapid testing during your college viva examination:

| Role | Email Address | Password | Description / Capabilities |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin@ahms.com` | `Password@123` | Complete executive dashboard, financial revenue charts, doctor/department/staff management. |
| **Doctor** | `doctor.sarah@ahms.com` | `Password@123` | Cardiologist console, today's consultations queue, digital prescription generator (Rx). |
| **Patient** | `patient.john@ahms.com` | `Password@123` | Patient portal, schedule consultations, view prescriptions & bills, 1-click PDF downloads. |
| **Receptionist** | `receptionist@ahms.com` | `Password@123` | Front-desk desk, patient check-in, OPD registration card, counter invoice generator. |
| **Pharmacist** | `pharmacist@ahms.com` | `Password@123` | Drug stock inventory, low-stock warning banners, price tracking, medicine dispensation bills. |

---

## 12. Complete REST API Reference

### Authentication (`/api/auth`)
- `POST /api/auth/register` — Register a new patient or user
- `POST /api/auth/login` — Sign in and receive JWT token
- `GET /api/auth/profile` — Get authenticated user details & role data
- `PUT /api/auth/profile` — Update contact information & name
- `PUT /api/auth/change-password` — Change password

### Doctors (`/api/doctors`)
- `GET /api/doctors` — Search & list doctors (filter by department, status)
- `GET /api/doctors/:id` — Get single doctor profile & schedule
- `POST /api/doctors` — Register new doctor (Admin only)
- `PUT /api/doctors/:id` — Update doctor profile, fees & availability
- `DELETE /api/doctors/:id` — Remove doctor from clinical staff

### Patients (`/api/patients`)
- `GET /api/patients` — List all registered patients with pagination & search
- `GET /api/patients/:id` — Retrieve patient EHR, medical records & billing history
- `POST /api/patients` — Register new patient (auto-generates unique `PAT-YYYY-XXXX` ID)
- `PUT /api/patients/:id` — Update patient records
- `DELETE /api/patients/:id` — Remove patient record (Admin only)

### Appointments (`/api/appointments`)
- `GET /api/appointments` — Query appointments (filtered by doctor/patient/status)
- `POST /api/appointments` — Book new appointment with duplicate booking prevention
- `PUT /api/appointments/:id` — Update appointment status (`Pending`, `Confirmed`, `Completed`, `Cancelled`)
- `DELETE /api/appointments/:id` — Delete appointment (Admin only)

### Pharmacy & Medicines (`/api/medicines`)
- `GET /api/medicines` — List inventory with low-stock filter (`lowStock=true`)
- `POST /api/medicines` — Add formulation with batch number & expiry date
- `PUT /api/medicines/:id` — Update stock levels or price
- `DELETE /api/medicines/:id` — Remove formulation

### Billing & Invoicing (`/api/bills`)
- `GET /api/bills` — Query hospital bills & tax invoices
- `POST /api/bills` — Generate itemized bill (auto-decrements medicine stock)
- `PUT /api/bills/:id` — Mark bill as Paid / update payment method

### Prescriptions (`/api/prescriptions`)
- `GET /api/prescriptions` — List medical prescriptions
- `POST /api/prescriptions` — Doctor issues prescription with diagnoses & medications

### Clinical Statistics (`/api/stats`)
- `GET /api/stats/admin` — Total patients, doctors, revenue, 6-month trends, department volume
- `GET /api/stats/doctor` — Today's appointments, completed count, patient counts
- `GET /api/stats/patient` — Scheduled visits, unpaid invoices, active prescriptions
- `GET /api/stats/pharmacist` — Inventory valuation, low-stock warnings, expired batches
- `GET /api/stats/receptionist` — Today's registrations, check-in queue, available doctors

---

## 13. System Verification & Test Cases

1. **Role Access Control Test**: Logging in as a Patient restricts navigation to admin-only views (`/pharmacy`, `/patients`).
2. **Duplicate Booking Prevention Test**: Booking the same doctor at the identical date and time slot raises an instant validation error.
3. **Stock Decrement Test**: Generating an invoice containing pharmacy items automatically decreases available quantity in `Medicine` collection.
4. **Low-Stock Alert Test**: Formulations with `stockQuantity <= reorderLevel` immediately trigger the highlighted alert banner on the Pharmacist dashboard.
5. **PDF Vector Generation Test**: Clicking "Download PDF" generates standard hospital tax invoices and prescription sheets without third-party server dependencies.

---

## 14. Academic Declaration

This project has been developed as a **Final Year BTech Computer Science & Engineering Major Project**, following modern software engineering methodologies, scalable MVC/MERN architecture, and clean coding standards.
