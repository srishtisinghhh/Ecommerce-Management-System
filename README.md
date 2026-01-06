# 🛒 E-Commerce Database Management System (PostgreSQL)

## 📌 Overview
This project is an **E-Commerce Database Management System** 
The database is implemented using **PostgreSQL** and demonstrates practical usage of **relational database concepts**, including normalization, joins, constraints, and analytical queries.

The system manages data related to **customers, vendors, products, categories, orders, reviews, and delivery locations**.  
All data used in this project is **synthetic and created for academic purposes only**.

---

## 🧰 Technologies Used
- **Database:** PostgreSQL  
- **Query Language:** SQL  
- **Database Design:** ER Diagram & Relational Schema  
- **Tools:** pgAdmin / psql  
- **Platform:** Windows / Linux / macOS  

---

## 📂 Project Structure
- Project Description  
- Database Design  
  - Entity Relationship Diagram (ERD)  
- Database Implementation  
  - Table Creation  
  - Data Insertion  
- SQL Queries  

---

## 1️⃣ Project Description
The E-Commerce Database Management System (EC-DBMS) is designed to store, manage, and analyze data related to online shopping activities. It handles key components such as customers, vendors, products, categories, orders, reviews, and couriers.
The system allows vendors to manage their products, while customers can browse items by category, place orders, and provide feedback. It supports online purchasing and order tracking without the need for physical store visits. This project demonstrates the practical use of relational database concepts and SQL queries in a real-world e-commerce environment.

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

<img width="1490" height="926" alt="image" src="https://github.com/user-attachments/assets/2af0f629-d960-40c8-b658-fe482a9cc41e" />


---


## 3️⃣ Database Implementation (PostgreSQL)

### 3.1 Database Creation
```sql
CREATE DATABASE OnlineShopping;

CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(20) NOT NULL
);

CREATE TABLE Country (
    CountryID SERIAL PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);

CREATE TABLE Province (
    ProvinceID SERIAL PRIMARY KEY,
    ProvinceName VARCHAR(255) NOT NULL
);

CREATE TABLE City (
    CityID SERIAL PRIMARY KEY,
    CityName VARCHAR(255) NOT NULL
);

CREATE TABLE ZipCode (
    ZipCodeID SERIAL PRIMARY KEY,
    CityID INT REFERENCES City(CityID),
    ProvinceID INT REFERENCES Province(ProvinceID),
    CountryID INT REFERENCES Country(CountryID)
);

CREATE TABLE Address (
    AddressID SERIAL PRIMARY KEY,
    HouseNo VARCHAR(255) NOT NULL,
    Street VARCHAR(255) NOT NULL,
    Area VARCHAR(255) NOT NULL,
    CustomerID INT REFERENCES Customer(CustomerID),
    ZipCodeID INT REFERENCES ZipCode(ZipCodeID)
);

CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Vendor (
    VendorID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(20) NOT NULL
);

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT REFERENCES Category(CategoryID)
);

CREATE TABLE VendorProduct (
    VendorProductID SERIAL PRIMARY KEY,
    VendorID INT REFERENCES Vendor(VendorID),
    ProductID INT REFERENCES Product(ProductID),
    Price NUMERIC(10,2) NOT NULL,
    Quantity INT NOT NULL
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    OrderDate DATE NOT NULL,
    AddressID INT REFERENCES Address(AddressID),
    VendorCourierID INT,
    TrackingID VARCHAR(255)
);

CREATE TABLE OrderedProduct (
    OrderedProductID SERIAL PRIMARY KEY,
    VendorProductID INT REFERENCES VendorProduct(VendorProductID),
    OrderID INT REFERENCES Orders(OrderID),
    Quantity INT NOT NULL
);

CREATE TABLE Review (
    ReviewID SERIAL PRIMARY KEY,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    OrderedProductID INT REFERENCES OrderedProduct(OrderedProductID),
    CustomerID INT REFERENCES Customer(CustomerID)
);
```
### 3.2 Inserting Data

Complete scripts are available in `Data Insertion` folder.

Note: All information is fake and generated for the demonstration of the project.

```sql
INSERT INTO Category (CategoryName)
VALUES ('Android Smart TV Box / Air Mouse');

INSERT INTO City (CityName)
VALUES ('Karachi');

INSERT INTO Province (ProvinceName)
VALUES ('Punjab');

INSERT INTO Product (ProductName, CategoryID)
VALUES ('Air Mouse C120 for Android and Smart TV', 1);

INSERT INTO Orders (CustomerID, OrderDate, AddressID, VendorCourierID, TrackingID)
VALUES (1, '2011-01-27', 1, 318, '77425889862');

INSERT INTO Review (Rating, Comment, CustomerID, OrderedProductID)
VALUES (4, 'Great product but slow delivery', 1, 1);
```

---


## 4️⃣ Queries

This section contains SQL queries used to retrieve meaningful information from the E-Commerce Database.  
All queries are written and executed using **PostgreSQL**.

### 4.1 Vendor-wise Product Categories

**Description:**  
Displays all the product categories for which a particular vendor is selling products.

```sql
SELECT DISTINCT c.CategoryName
FROM Category c
JOIN Product p 
    ON p.CategoryID = c.CategoryID
JOIN VendorProduct vp 
    ON vp.ProductID = p.ProductID
WHERE vp.VendorID = 3;
```
### 4.2 Average Age of Customers

Description:
Calculates the average age of all customers registered in the system.

```sql
SELECT 
    AVG(DATE_PART('year', AGE(CURRENT_DATE, DOB))) AS "Average Age"
FROM Customer;
```

---

## 🚀 How to Run the Project

1. Install **PostgreSQL** on your system.
2. Open **pgAdmin** or terminal (`psql`).
3. Create the database:
   ```sql
   CREATE DATABASE OnlineShopping;
4. Connect to the database:
   ```sql
   \c OnlineShopping;
   ```
5. Run table creation scripts from the Database & Table Creation folder.
6. Run data insertion scripts from the Data Insertion folder.
7. Execute queries from the Queries folder to analyze the data.

---

## 🚀 Project Highlights

✨ Real-world E-Commerce database design  
🗂️ Properly normalized relational schema  
🔗 Extensive use of JOINs and subqueries  
📊 Advanced SQL concepts (aggregations & window functions)  
🛒 End-to-end order, product, vendor & customer flow  
🐘 Fully implemented in **PostgreSQL**  

---

## 📌 Author
**Srishti Singh**  
---

⭐ If you find this project useful, feel free to star the repository!
