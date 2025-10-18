DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215),
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130),
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  PRIMARY KEY (book_id),
  INDEX idx_books_author_id (author_id),
  CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215),
  email VARCHAR(215),
  address TEXT,
  PRIMARY KEY (customer_id),
  UNIQUE INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  PRIMARY KEY (order_id),
  INDEX idx_orders_customer_id (customer_id),
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Order_Details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  PRIMARY KEY (orderdetailid),
  INDEX idx_orderdetails_order_id (order_id),
  INDEX idx_orderdetails_book_id (book_id),
  CONSTRAINT fk_orderdetails_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  CONSTRAINT fk_orderdetails_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;