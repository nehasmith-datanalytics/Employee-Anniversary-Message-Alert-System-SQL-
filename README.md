# Employee-Anniversary-Message-Alert-System-SQL-

# Database Diagram:
<img width="937" height="560" alt="Database Diagram" src="https://github.com/user-attachments/assets/02b7b1d7-7269-43a2-acd7-efbcf75ed338" />


## 📌 Project Description
This project is a SQL-based system designed to manage employee data, track project assignments, and generate automated alerts such as birthday greetings.

It demonstrates the use of advanced SQL concepts:
- Views
- Stored Procedures
- User Defined Functions (UDFs)
- Triggers
- Cursors

The system operates on an `Emp` schema containing employee, project, and mapping tables.

---

## 🎯 Objectives
- Automate employee birthday greetings  
- Retrieve filtered employee and project data efficiently  
- Maintain audit logs for deleted records  
- Provide reusable and modular database components  

---

## 🧱 Key Components

### 🔹 Views
1. **vew_GetEmployeeid**
   - Generates birthday messages dynamically using a function  
   - Filters employees associated with the *ERP* project  

2. **vew_Getproject**
   - Displays project details with duration greater than 100 hours  

3. **vew_GetEmployee**
   - Retrieves employee-project mappings with constraints:
     - Project number < 301  
     - Duration < 300 hours  

---

### 🔹 Stored Procedures
1. **proc_AllEmployee**
   - Fetches employees based on city input parameter  

2. **proc_Hiredate**
   - Retrieves employee details using Employee ID  

---

### 🔹 User Defined Functions
1. **fn_getgreeting()**
   - Table-valued function generating birthday messages  

2. **getemployee(@id)**
   - Returns employee name by ID  

3. **GetdeptID(@empid)**
   - Returns department ID of an employee  

---

### 🔹 Trigger
**Insert_Deletelog**
- Executes after a DELETE operation on `Emp.Employees`  
- Stores deleted records in `Emp.Delete_log` for auditing  

---

### 🔹 Cursor
- Iterates through employee records  
- Displays Employee ID and Name row-by-row  

---

## 📈 Key Performance Indicators (KPIs)

- 🎂 **Employee Engagement Rate**
  - Based on automated birthday greetings  

- 📊 **Project Allocation Efficiency**
  - Number of employees assigned to projects  

- ⏱️ **Project Duration Tracking**
  - Monitoring projects exceeding defined hour thresholds  

- 🧾 **Audit Compliance Rate**
  - Accuracy of deletion logs  

- ⚡ **Query Performance**
  - Efficiency of views and stored procedures  

---

## 🔍 Analysis

- Views simplify complex joins and improve readability  
- Stored procedures enhance performance and reusability  
- Functions enable modular programming  
- Triggers ensure automatic audit logging  
- Cursor demonstrates row-wise processing (less efficient than set-based queries)  

---

## ✅ Outcomes

-  Automated birthday message generation  
-  Efficient employee/project data retrieval  
-  Audit logging system for deleted records  
-  Modular SQL components (functions & procedures)  
-  Improved maintainability and scalability  

---

## 🚀 Future Enhancements

- Replace cursor with set-based operations  
- Add email notifications for birthday alerts  
- Implement indexing for faster queries  
- Introduce role-based access control  
- Build dashboards for KPI visualization  

---

## 🛠️ Technologies Used
- Microsoft SQL Server  
- T-SQL  

---

## 📎 Conclusion
This project demonstrates how SQL can be used to build a structured employee and project management system with automation, auditing, and performance optimization features.
