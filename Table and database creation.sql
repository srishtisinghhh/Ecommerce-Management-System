CREATE DATABASE OnlineShopping;

-- CUSTOMER
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

-- COUNTRY
CREATE TABLE Country (
    CountryID SERIAL PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);

-- PROVINCE
CREATE TABLE Province (
    ProvinceID SERIAL PRIMARY KEY,
    ProvinceName VARCHAR(255) NOT NULL
);

-- CITY
CREATE TABLE City (
    CityID SERIAL PRIMARY KEY,
    CityName VARCHAR(255) NOT NULL
);

-- ZIPCODE
CREATE TABLE ZipCode (
    ZipCodeID SERIAL PRIMARY KEY,
    CityID INT NOT NULL REFERENCES City(CityID),
    ProvinceID INT NOT NULL REFERENCES Province(ProvinceID),
    CountryID INT NOT NULL REFERENCES Country(CountryID)
);

-- ADDRESS
CREATE TABLE Address (
    AddressID SERIAL PRIMARY KEY,
    HouseNo VARCHAR(255) NOT NULL,
    Street VARCHAR(255) NOT NULL,
    Area VARCHAR(255) NOT NULL,
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),
    ZipCodeID INT NOT NULL REFERENCES ZipCode(ZipCodeID)
);

-- CATEGORY
CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- VENDOR
CREATE TABLE Vendor (
    VendorID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

-- PRODUCT
CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT NOT NULL REFERENCES Category(CategoryID)
);

-- VENDOR PRODUCT
CREATE TABLE VendorProduct (
    VendorProductID SERIAL PRIMARY KEY,
    VendorID INT NOT NULL REFERENCES Vendor(VendorID),
    ProductID INT NOT NULL REFERENCES Product(ProductID),
    Price NUMERIC(19,2) NOT NULL,
    Quantity INT NOT NULL,
    Description TEXT NOT NULL
);

-- COURIER
CREATE TABLE Courier (
    CourierID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

-- VENDOR COURIER
CREATE TABLE VendorCourier (
    VendorCourierID SERIAL PRIMARY KEY,
    VendorID INT NOT NULL REFERENCES Vendor(VendorID),
    CourierID INT NOT NULL REFERENCES Courier(CourierID)
);

-- ORDERS
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),
    OrderDate DATE NOT NULL,
    AddressID INT NOT NULL REFERENCES Address(AddressID),
    VendorCourierID INT NOT NULL REFERENCES VendorCourier(VendorCourierID),
    TrackingID VARCHAR(255) NOT NULL
);

-- ORDERED PRODUCT
CREATE TABLE OrderedProduct (
    OrderedProductID SERIAL PRIMARY KEY,
    VendorProductID INT NOT NULL REFERENCES VendorProduct(VendorProductID),
    OrderID INT NOT NULL REFERENCES Orders(OrderID),
    Quantity INT NOT NULL
);

-- REVIEW
CREATE TABLE Review (
    ReviewID SERIAL PRIMARY KEY,
    Rating SMALLINT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),
    OrderedProductID INT NOT NULL REFERENCES OrderedProduct(OrderedProductID)
);

-- CART
CREATE TABLE Cart (
    CartID SERIAL PRIMARY KEY,
    DateCreated DATE NOT NULL,
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID)
);

-- CART PRODUCT
CREATE TABLE CartProduct (
    CartProductID SERIAL PRIMARY KEY,
    VendorProductID INT NOT NULL REFERENCES VendorProduct(VendorProductID),
    Quantity INT NOT NULL,
    CartID INT NOT NULL REFERENCES Cart(CartID)
);
