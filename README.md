# 🛒 E-Commerce Database Management System (PostgreSQL)

## 📌 Overview
This project is an **E-Commerce Database Management System** developed as part of a **Database Management Systems (DBMS)** course.  
The database is implemented using **PostgreSQL** and demonstrates practical usage of **relational database concepts**, including normalization, joins, constraints, and analytical queries.

The system manages data related to **customers, vendors, products, categories, orders, reviews, and delivery locations**.  
All data used in this project is **synthetic and created for academic purposes only**.

---

## 🧰 Technologies Used
- **Database:** PostgreSQL  
- **Language:** SQL  
- **Tool:** pgAdmin / psql  

---

## 📂 Project Structure
- Project Description  
- Database Design  
  - Entity Relationship Diagram (ERD)  
  - Relational Schema  
- Database Implementation  
  - Table Creation  
  - Data Insertion  
- SQL Queries  

---

## 1️⃣ Project Description
The **E-Commerce DBMS** is designed to store, process, and retrieve information related to online shopping activities.

### Key Features:
- Customer registration and address management  
- Vendor and product management  
- Product categorization  
- Order processing  
- Product reviews and ratings  

Customers can browse categorized products, place orders, and submit reviews.  
Vendors can list products and receive ratings based on customer feedback.

---

## 2️⃣ Database Design

### 2.1 Entity Relationship Diagram (ERD)
The ERD illustrates relationships between:
- Customer  
- Vendor  
- Product  
- Category  
- Order  
- Review  
- Address  
- City, Province, Country  

*(ERD diagram can be added here)*

---

### 2.2 Relational Schema
The relational schema maps the ERD entities into PostgreSQL tables using **primary keys** and **foreign keys** to ensure data integrity.

---

## 3️⃣ Database Implementation (PostgreSQL)

### 3.1 Database Creation
```sql
CREATE DATABASE OnlineShopping;
