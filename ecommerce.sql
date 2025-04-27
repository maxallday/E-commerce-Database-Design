create DATABSE ecommerce;
use ecommerce;
-- Create PRODUCT table
create TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL,
    
);
-- Create Brand table
create TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);
-- Create image table
create TABLE image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,  -- Foreign key to product table
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- Create product_category table
create TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);
-- Create product_item table
create TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,   -- Foreign key to product table
    variation_id INT NOT NULL, -- Foreign key to product_variation table
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);
-- Create product_variation table
create TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL, -- Foreign key to product table
    color_id INT,            -- Foreign key to color table
    size_id INT,             -- Foreign key to size table
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size(size_id)

);
-- Create color table
create TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(255) NOT NULL,
);
-- Create size_category table

create TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,  -- Name of the size category (e.g., clothing sizes)
);
-- Create size_option table

create TABLE size_option (
size_id INT AUTO_INCREMENT PRIMARY KEY,
size_category_id INT,  -- Foreign key to size_category table
size_label VARCHAR(10) NOT NULL,  -- Label for the size (e.g., S, M, L, XL),
FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Create product_attribute table
create TABLE product_attribute (
attribute_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,                              -- Foreign key linking to the product table
attribute_category_id INT,                   -- Foreign key linking to the attribute category table
attribute_type_id INT,                       -- Foreign key linking to the attribute type table
attribute_value VARCHAR(255),                -- Value of the attribute (e.g., cotton, 1kg)
FOREIGN KEY (product_id) REFERENCES product(product_id), -- Links attribute to product
FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id), -- Links attribute to its category
FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id) -- Links attribute to its type
);

-- Create attribute_category table
create TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,  -- Name of the attribute category (e.g., material, weight)
);

-- Create attribute_type table 
create TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL,  -- Name of the attribute type (e.g., color, size)
);