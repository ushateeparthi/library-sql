CREATE DATABASE IF NOT EXISTS library_database;

USE library_database;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    publication_year YEAR,
    ISBN VARCHAR(20),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
/*Retrieve all books*/
SELECT * FROM books;
 /*Retrieve books by a specific author*/
 SELECT * FROM books WHERE author_id = 1;
 /*Retrieve books published after a specific year*/
 SELECT * FROM books WHERE publication_year > 2000;
 /*Count the number of books in each category*/
 SELECT category_name, COUNT(*) AS book_count
FROM books
JOIN categories ON books.category_id = categories.category_id
GROUP BY categories.category_id;
/* Find the authors with the most books*/
SELECT author_name, COUNT(*) AS book_count
FROM books
JOIN authors ON books.author_id = authors.author_id
GROUP BY authors.author_id
ORDER BY book_count DESC








