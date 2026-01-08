-- Eenvoudig E-commerce Database Schema
-- Drie tabellen met foreign key relaties

-- Tabel 1: Categorieën
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Tabel 2: Producten
-- Elke product hoort bij een categorie
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Tabel 3: Bestellingen
-- Elke bestelling is voor een product
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Voorbeeld data invoegen
-- Let op: De volgorde is belangrijk vanwege foreign key constraints

-- Eerst categorieën aanmaken
INSERT INTO categories (name) VALUES
('Elektronica'),
('Kleding'),
('Boeken');

-- Dan producten aanmaken (categorieën moeten al bestaan)
INSERT INTO products (category_id, name, price) VALUES
(1, 'Laptop', 899.99),
(1, 'Smartphone', 599.99),
(2, 'T-shirt', 19.99),
(2, 'Broek', 49.99),
(3, 'Programmeren voor beginners', 29.99);

-- Tenslotte bestellingen aanmaken (producten moeten al bestaan)
INSERT INTO orders (product_id, quantity, order_date) VALUES
(1, 2, '2024-01-15'),
(2, 1, '2024-01-16'),
(3, 5, '2024-01-17'),
(5, 3, '2024-01-18');
