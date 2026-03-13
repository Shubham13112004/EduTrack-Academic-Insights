# 🎓 EduTrack – Academic Insights

EduTrack – Academic Insights is a **Java-based Student Academic Management System** developed to manage student records, academic performance, and fee information through a web interface.

The system allows users to **register, log in, enter marks, update records, manage fees, and view academic information** efficiently. This project demonstrates the implementation of **Java Servlets, JSP, JDBC, and MySQL** to build a dynamic web application.

---

# 🚀 Project Overview

EduTrack is designed to simplify the management of student academic information in an organized and structured manner.  
The application provides features to manage student data, academic performance, and fee records in a centralized system.

This project helps demonstrate concepts of:

- Java Web Development
- CRUD operations
- Database connectivity using JDBC
- Session management using Servlets
- Dynamic web pages using JSP

---

# ✨ Features

### 👤 Student Registration
- Allows new students to register in the system.
- Student information is stored in the database.

### 🔐 Login System
- Secure login functionality.
- Validates credentials from the database.

### 📊 Student Dashboard
- Displays student information after login.
- Provides navigation to academic features.

### 📝 Marks Entry
- Enter marks for students.
- Store academic results in the database.

### ✏️ Update Marks
- Edit and update previously entered marks.

### 💰 Fees Management
- Track student fee records.
- Store payment information.

### 🗑 Delete Records
- Remove student records from the system.

### 🔓 Logout System
- Session-based logout functionality for security.

---

# 🏗 System Architecture

```
Client (Browser)
      │
      │ HTTP Request
      ▼
JSP Pages (Frontend)
      │
      ▼
Java Servlets (Business Logic)
      │
      ▼
JDBC
      │
      ▼
MySQL Database
```

---

# 🛠️ Technologies Used

## Backend
- Java
- Java Servlets
- JDBC

## Frontend
- JSP (Java Server Pages)
- HTML
- CSS

## Database
- MySQL

## Tools & Platforms
- Eclipse IDE
- Apache Tomcat Server
- Git & GitHub

---

# 📂 Project Structure

```
EduTrack-Academic-Insights
│
├── src/main/java/com/registerfile
│   ├── registration.java
│   ├── LoginServlet.java
│   ├── LogoutServlet.java
│   ├── marksentry.java
│   ├── updatemarks.java
│   ├── feesServlet.java
│   ├── Update.java
│   └── Delete.java
│
├── src/main/webapp
│   ├── index.jsp
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── edit.jsp
│   ├── editmarks.jsp
│   ├── fees.jsp
│   ├── css/
│   └── WEB-INF/web.xml
│
└── README.md
```

---

# ⚙️ Installation & Setup

## 1. Clone the Repository

```bash
git clone https://github.com/Shubham13112004/EduTrack-Academic-Insights.git
```

---

## 2. Import Project in Eclipse

1. Open **Eclipse IDE**
2. Click **File → Import**
3. Select **Existing Dynamic Web Project**
4. Import the project folder

---

## 3. Configure Apache Tomcat

- Install **Apache Tomcat Server**
- Add Tomcat server in Eclipse
- Deploy the project to the server

---

## 4. Setup MySQL Database

Create a database in MySQL:

```sql
CREATE DATABASE edutrack;
```

Update the database credentials in the JDBC connection inside the project.

---

## 5. Run the Project

Start the **Tomcat Server** and open in browser:

```
http://localhost:8080/EduTrack-Academic-Insights
```

---

# 🎯 Learning Outcomes

Through this project, the following concepts were implemented:

- Java Servlet architecture
- JSP dynamic web pages
- JDBC database connectivity
- CRUD operations
- Session management
- Web application development using Java

---

# 👨‍💻 Author

**Shubham Desai**

B.Tech Information Technology  
JSPM Rajarshi Shahu College of Engineering, Pune

📧 Email: desaishubham696@gmail.com  
📱 Phone: +91 8424033009  

🔗 LinkedIn  
https://www.linkedin.com/in/shubham-desai-0a235a36b/

💻 GitHub  
https://github.com/Shubham13112004

---

# ⭐ Contributing

Contributions are welcome.  
Feel free to fork the repository and submit a pull request to improve the project.

---

# 📜 License

This project is created for educational purposes.
