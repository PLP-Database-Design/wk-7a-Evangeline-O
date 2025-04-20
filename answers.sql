-- Recreate the data in normalized form (1NF)
-- Each product now has its own row, no more comma-separated values
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert one product per row (manually normalized for this exercise)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');


-- Create a table for Orders (Customer info)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create a separate table for Order Details (Products & Quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert customer info (one row per order)
INSERT INTO Orders (OrderID, CustomerName) VALUES (101, 'John Doe');
INSERT INTO Orders (OrderID, CustomerName) VALUES (102, 'Jane Smith');
INSERT INTO Orders (OrderID, CustomerName) VALUES (103, 'Emily Clark');

-- Insert order items (no customer name here, respecting 2NF)
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);
