---------------------TABLES---------------------------
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FullName VARCHAR(255),
    Email VARCHAR(255),
    LastLogin TIMESTAMP,
    Password VARCHAR(255),
    Address VARCHAR(255),
    Telephone VARCHAR(20)
);

CREATE TABLE Supplier (
    SupplierID SERIAL PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    SupplierID INT,
    Description TEXT,
    Price DECIMAL(10, 2),
    Images TEXT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
CREATE TABLE CategoryTag (
    CategoryID SERIAL PRIMARY KEY,
    Category VARCHAR(255),
    Tag VARCHAR(255)
);

CREATE TABLE ProductCategory (
    ProductCategoryID SERIAL PRIMARY KEY,
    ProductID INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES CategoryTag(CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT,
    Description TEXT,
    Date TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderItem (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE OrderItemComment (
    OrderItemID INT,
    Comment TEXT,
    FOREIGN KEY (OrderItemID) REFERENCES OrderItem(OrderItemID)
);

CREATE TABLE ReturnItem (
    ReturnItemID SERIAL PRIMARY KEY,
    OrderItemID INT,
    ReturnDate TIMESTAMP,
    Reason TEXT,
    FOREIGN KEY (OrderItemID) REFERENCES OrderItem(OrderItemID)
);
---------------------DATA---------------------------
INSERT INTO Customer (FullName, Email, LastLogin, Password, Address, Telephone) VALUES
('John Doe', 'johndoe@example.com', '2024-06-30 10:15:30', 'password123', '123 Elm St, Springfield', '123-456-7890'),
('Jane Smith', 'janesmith@example.com', '2024-06-29 09:45:00', 'mypassword', '456 Oak St, Metropolis', '234-567-8901'),
('Alice Johnson', 'alicejohnson@example.com', '2024-06-28 08:30:45', 'alicepass', '789 Pine St, Gotham', '345-678-9012'),
('Bob Brown', 'bobbrown@example.com', '2024-06-27 07:20:15', 'bobsecure', '101 Maple St, Star City', '456-789-0123'),
('Charlie Green', 'charliegreen@example.com', '2024-06-26 06:10:30', 'charliepwd', '202 Birch St, Central City', '567-890-1234'),
('Diana Prince', 'dianaprince@example.com', '2024-06-25 05:05:45', 'dianapass', '303 Cedar St, Paradise Island', '678-901-2345'),
('Edward Norton', 'edwardnorton@example.com', '2024-06-24 04:55:30', 'edward123', '404 Spruce St, Mystic Falls', '789-012-3456'),
('Fiona Gallagher', 'fionagallagher@example.com', '2024-06-23 03:45:15', 'fionasecure', '505 Willow St, Riverdale', '890-123-4567'),
('George Washington', 'georgewashington@example.com', '2024-06-22 02:35:00', 'georgepwd', '606 Cherry St, Washington', '901-234-5678'),
('Hannah Montana', 'hannahmontana@example.com', '2024-06-21 01:25:45', 'hannahpass', '707 Elm St, Nashville', '012-345-6789');
select * from customer;
INSERT INTO Supplier (Name) VALUES ('Global Tech Supplies'),
                                   ('Prime Electronics'),
                                   ('Office Essentials'),
                                   ('Green Energy Solutions'),
                                   ('Superior Furniture'),
                                   ('WorldWide Distributors'),
                                   ('QuickShip Logistics'),
                                   ('Innovative Products'),
                                   ('EcoFriendly Goods'),
                                   ('Premium Packaging');
select * from Supplier;
INSERT INTO Product (Name, SupplierID, Description, Price, Images) VALUES
('Laptop', 1, 'High-performance laptop with 16GB RAM and 512GB SSD', 999.99, 'laptop1.jpg,laptop2.jpg'),
('Wireless Mouse', 2, 'Ergonomic wireless mouse with long battery life', 29.99, 'mouse1.jpg,mouse2.jpg'),
('Office Chair', 5, 'Comfortable office chair with lumbar support', 149.99, 'chair1.jpg,chair2.jpg'),
('Solar Panel', 4, 'High-efficiency solar panel with 25-year warranty', 199.99, 'solarpanel1.jpg,solarpanel2.jpg'),
('Smartphone', 1, 'Latest model smartphone with 5G connectivity', 699.99, 'smartphone1.jpg,smartphone2.jpg'),
('Printer', 3, 'All-in-one printer with wireless capability', 129.99, 'printer1.jpg,printer2.jpg'),
('Desk Lamp', 5, 'LED desk lamp with adjustable brightness', 39.99, 'desklamp1.jpg,desklamp2.jpg'),
('Backpack', 6, 'Durable backpack with multiple compartments', 49.99, 'backpack1.jpg,backpack2.jpg'),
('Wireless Charger', 8, 'Fast wireless charger compatible with all devices', 24.99, 'charger1.jpg,charger2.jpg'),
('Reusable Water Bottle', 9, 'Eco-friendly water bottle made from recycled materials', 19.99, 'bottle1.jpg,bottle2.jpg');
select * from Product;
INSERT INTO CategoryTag (Category, Tag) VALUES
('Electronics', 'Technology'),
('Electronics', 'Gadgets'),
('Accessories', 'Portable'),
('Furniture', 'Comfort'),
('Energy', 'Renewable'),
('Office Supplies', 'Productivity'),
('Lighting', 'Home Decor'),
('Bags', 'Travel'),
('Eco-Friendly', 'Sustainability'),
('Eco-Friendly', 'Green'),
('Fashion', 'Clothing');
select * from CategoryTag;
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 3),
(10,1),
(11,11);
select * from ProductCategory;
INSERT INTO Orders (CustomerID, Description, Date) VALUES
(1, 'Order for electronics and accessories', '2024-06-30 12:30:00'),
(2, 'Order for office supplies', '2024-06-29 14:45:00'),
(3, 'Order for home decor items', '2024-06-28 16:00:00'),
(4, 'Order for renewable energy products', '2024-06-27 11:15:00'),
(5, 'Order for computer accessories', '2024-06-26 10:20:00'),
(6, 'Order for travel gear', '2024-06-25 09:30:00'),
(7, 'Order for productivity tools', '2024-06-24 15:45:00'),
(8, 'Order for eco-friendly products', '2024-06-23 13:50:00'),
(9, 'Order for lighting solutions', '2024-06-22 14:35:00'),
(10, 'Order for miscellaneous items', '2024-06-21 17:00:00');
select * from Orders;
INSERT INTO OrderItem (OrderID, ProductID, Quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 1),
    (3, 4, 3),
    (4, 5, 2),
    (4, 6, 1),
    (5, 7, 1),
    (6, 8, 2),
    (7, 9, 1),
    (8, 10, 3);
select * from OrderItem;
INSERT INTO OrderItemComment (OrderItemID, Comment)
VALUES
    (1, 'Item received in good condition.'),
    (2, 'Packaging was damaged, but item inside was intact.'),
    (3, 'Customer requested expedited delivery.'),
    (4, 'Item out of stock, will be shipped later.'),
    (5, 'Customer requested specific color variant.');
select * from OrderItemComment;
INSERT INTO ReturnItem (OrderItemID, ReturnDate, Reason)
VALUES
    (6, '2024-07-02 10:15:00', 'Item didn''t meet customer''s expectations.'),
    (7, '2024-07-01 14:30:00', 'Received wrong item.'),
    (8, '2024-07-01 16:45:00', 'Item damaged during shipping.'),
    (9, '2024-07-02 09:00:00', 'Customer changed mind, no longer needed.'),
    (10, '2024-06-30 17:00:00', 'Item didn''t fit as expected.');
select * from ReturnItem;
---------------------FUNCTIONS---------------------------
--Detail information about suppliers and the number of products that they provide
CREATE  FUNCTION GetSupplierProductCount()
RETURNS TABLE (SupplierID INT,Name varchar, NumberOfProducts BIGINT) AS $$
BEGIN
    RETURN QUERY
    SELECT
    Supplier.SupplierID,
    Supplier.Name,
    COUNT(Product.ProductID) AS NumberOfProducts
FROM
    Supplier
LEFT JOIN
    Product
ON
    Supplier.SupplierID = Product.SupplierID
GROUP BY
    Supplier.SupplierID,
    Supplier.Name;
END
$$ LANGUAGE plpgsql;
SELECT * FROM GetSupplierProductCount();
--10 best-selling products with the total amount and their supplier
CREATE FUNCTION get_top_10_products()
RETURNS TABLE(ProductName varchar, SupplierName varchar, TotalQuantitySold bigint)
AS
$$
BEGIN
    RETURN QUERY
    SELECT
        Product.Name AS ProductName,
        Supplier.Name AS SupplierName,
        SUM(OrderItem.Quantity) AS TotalQuantitySold
    FROM
        Product
    INNER JOIN
        Supplier
    ON
        Product.SupplierID = Supplier.SupplierID
    INNER JOIN
        OrderItem
    ON
        Product.ProductID = OrderItem.ProductID
    GROUP BY
        Product.Name,
        Supplier.Name
    ORDER BY
        TotalQuantitySold DESC
    LIMIT 10;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_top_10_products();
--List of customers and their total purchases
CREATE OR REPLACE FUNCTION get_customer_total_purchases()
RETURNS TABLE (
    FullName varchar,
    TotalPurchases NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        c.FullName,
        SUM(oi.Quantity * p.Price) AS TotalPurchases
    FROM
        Customer c
    JOIN
        Orders o ON c.CustomerID = o.CustomerID
    JOIN
        OrderItem oi ON o.OrderID = oi.OrderID
    JOIN
        Product p ON oi.ProductID = p.ProductID
    GROUP BY
        c.CustomerID;
END
$$ LANGUAGE plpgsql;
SELECT * FROM get_customer_total_purchases();
--List of returned items:
CREATE OR REPLACE FUNCTION get_returned_items()
RETURNS TABLE (
    ProductName varchar,
    ReturnDate timestamp
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.Name AS ProductName,
        ri.ReturnDate
    FROM
        ReturnItem ri
    JOIN
        OrderItem oi ON ri.OrderItemID = oi.OrderItemID
    JOIN
        Product p ON oi.ProductID = p.ProductID;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM get_returned_items();
--List of products in the fashion category that were sold last month
CREATE OR REPLACE FUNCTION get_recent_fashion_products()
RETURNS TABLE (
    ProductName varchar
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.Name AS ProductName
    FROM
        Product p
    JOIN
        OrderItem oi ON p.ProductID = oi.ProductID
    JOIN
        Orders o ON oi.OrderID = o.OrderID
    JOIN
        productcategory pc ON pc.productid = p.productid
    JOIN
        categorytag pt ON pt.categoryid = pc.CategoryID
    WHERE
        pt.category='Fashion' AND
        o.Date >= (CURRENT_DATE - INTERVAL '1 month');
END
$$ LANGUAGE plpgsql;
SELECT * FROM get_recent_fashion_products();