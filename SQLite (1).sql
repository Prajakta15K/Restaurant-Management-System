SELECT * FROM demo;
-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    loyalty_points INT DEFAULT 0
);

-- Reservations Table
CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    reservation_date DATETIME,
    number_of_guests INT,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- MenuItems Table
CREATE TABLE MenuItems (
    menu_item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Ingredients Table
CREATE TABLE Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    quantity DECIMAL(10, 2),
    unit VARCHAR(50),
    cost DECIMAL(10, 2)
);

-- OrderStatus Table
CREATE TABLE OrderStatus (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (status_id) REFERENCES OrderStatus(status_id)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    menu_item_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES MenuItems(menu_item_id)
);

-- Stock Table
CREATE TABLE Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_id INT,
    quantity_in_stock DECIMAL(10, 2),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_info VARCHAR(150)
);

-- PurchaseOrders Table
CREATE TABLE PurchaseOrders (
    purchase_order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    contact_info VARCHAR(150),
    hire_date DATE
);

-- Shifts Table
CREATE TABLE Shifts (
    shift_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    shift_date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Roles Table
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50)
);
-- Inserting Sample Data into Categories
INSERT INTO Categories (category_name) VALUES ('Appetizer'), ('Main Course'), ('Dessert');

-- Inserting Sample Data into MenuItems
INSERT INTO MenuItems (name, category_id, price, description) VALUES 
('Caesar Salad', 1, 8.99, 'Fresh Caesar salad with parmesan cheese'),
('Grilled Salmon', 2, 15.99, 'Grilled salmon with lemon and herbs'),
('Chocolate Cake', 3, 6.99, 'Rich chocolate cake with fudge frosting');

-- Inserting Sample Data into OrderStatus
INSERT INTO OrderStatus (status_name) VALUES ('Pending'), ('Completed'), ('Canceled');
