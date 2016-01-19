-- Questions
-- Which authors are represented in our store?

SELECT first_name, last_name
FROM authors

-- Which authors are also distinguished authors?
SELECT first_name, last_name FROM authors 
RIGHT JOIN distinguished_authors
ON authors.id = distinguished_authors.id;


-- Which authors are not distinguished authors?
SELECT *
FROM authors
LEFT JOIN distinguished_authors ON distinguished_authors.id = authors.id
WHERE distinguished_authors.id IS NULL

-- How many authors are represented in our store?
SELECT COUNT(id) FROM authors;

-- Who are the favorite authors of the employee with the first name of Michael?
SELECT *
FROM favorite_authors
LEFT JOIN employees ON employees.id = favorite_authors.employee_id
WHERE employees.first_name = 'Michael';

-- What are the titles of all the books that are in stock today?
SELECT title
FROM books 
	JOIN editions
		ON editions.book_id = books.id
	JOIN daily_inventory
		ON daily_inventory.isbn = editions.isbn
WHERE daily_inventory.is_stocked = TRUE 


-- Insert one of your favorite books into the database. 
-- Hint: You’ll want to create data in at least 2 other tables to completely create this book.
INSERT INTO authors (id, last_name, first_name)
    VALUES (333, "Moskos", "Peter");

INSERT INTO subjects(id, subject, location)
VALUES (16, "Society", "Learnstuff Boulevard");

INSERT INTO books (id, title, author_id, subject_id)
VALUES (6000, "In Defense of Flogging", 333, );


-- What authors have books that are not in stock?
-- Thanks to Natalie!
SELECT last_name, first_name
FROM stock 
	JOIN editions
		ON editions.isbn = stock.isbn
	JOIN books 
		ON books.id = editions.book_id
	JOIN authors
		ON authors.id = books.author_id
WHERE stock.stock = 0 


-- Thanks to Paul

What is the title of the book that has the most stock?
SELECT title
FROM books JOIN editions ON books.id = editions.book_id
WHERE isbn IN 
(SELECT isbn
	FROM stock
	WHERE stock =
	(SELECT MAX(stock)
		FROM stock));
	





