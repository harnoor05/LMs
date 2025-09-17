show databases;
create database project;
use project;
CREATE TABLE Authors ( author_id INT PRIMARY KEY, name VARCHAR(100) );
CREATE TABLE Books ( book_id INT PRIMARY KEY, title VARCHAR(200), author_id INT, genre VARCHAR(50), total_copies INT, available_copies INT, FOREIGN KEY (author_id) REFERENCES Authors(author_id));
CREATE TABLE Members ( member_id INT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100), join_date DATE );
CREATE TABLE Borrow_Records ( record_id INT PRIMARY KEY, member_id INT, book_id INT, borrow_date DATE, return_date DATE, FOREIGN KEY (member_id) REFERENCES Members(member_id), FOREIGN KEY (book_id) REFERENCES Books(book_id));
INSERT INTO Authors VALUES (1, 'J.K. Rowling'), (2, 'George Orwell');
INSERT INTO Books VALUES (101, 'Harry Potter', 1, 'Fantasy', 5, 3), (102, '1984', 2, 'Dystopian', 4, 4);
INSERT INTO Members VALUES (1, 'Alice Smith', 'alice@example.com', '2023-01-01'), (2, 'Bob Johnson', 'bob@example.com', '2023-03-15');
INSERT INTO Borrow_Records VALUES (1, 1, 101, '2024-05-01', NULL), (2, 2, 102, '2024-05-10', '2024-05-17');
SELECT title FROM Books WHERE available_copies > 0;
SELECT B.title, BR.borrow_date, BR.return_date FROM Borrow_Records BR JOIN Books B ON BR.book_id = B.book_id
WHERE BR.member_id = 1;
SELECT M.name, B.title, BR.borrow_date FROM Borrow_Records BR JOIN Books B ON BR.book_id = B.book_id JOIN Members M ON BR.member_id = M.member_id WHERE return_date IS NULL AND borrow_date < CURRENT_DATE - INTERVAL 30 DAY;