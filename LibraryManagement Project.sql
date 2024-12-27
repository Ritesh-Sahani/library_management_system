CREATE DATABASE LibraryManagement;
use LibraryManagement;

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(50),
    PublishedYear INT,
    AvailableCopies INT DEFAULT 0,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Borrowers (
    BorrowerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE BorrowTransactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    BorrowerID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Authors (Name, Country)
VALUES 
    ('J.K. Rowling', 'UK'),
    ('George Orwell', 'UK'),
    ('Jane Austen', 'UK');
    
INSERT INTO Books (Title, AuthorID, Genre, PublishedYear, AvailableCopies)
VALUES
    ('Harry Potter and the Philosopher\'s Stone', 1, 'Fantasy', 1997, 5),
    ('1984', 2, 'Dystopian', 1949, 3),
    ('Pride and Prejudice', 3, 'Romance', 1813, 4);


INSERT INTO Borrowers (Name, Email, Phone)
VALUES
    ('Alice Johnson', 'alice@example.com', '1234567890'),
    ('Bob Smith', 'bob@example.com', '0987654321');
    
INSERT INTO BorrowTransactions (BorrowerID, BookID, BorrowDate, ReturnDate)
VALUES
    (1, 1, '2024-12-01', '2024-12-15'),
    (2, 2, '2024-12-05', '2024-12-20');
    
SELECT * FROM Books;
SELECT * FROM Borrowers;
SELECT * FROM Authors;


SELECT B.Title, BT.BorrowDate, BT.ReturnDate
FROM BorrowTransactions BT
JOIN Books B ON BT.BookID = B.BookID
JOIN Borrowers BR ON BT.BorrowerID = BR.BorrowerID
WHERE BR.Name = 'Alice Johnson';


-- Update the number of available copies for a book
UPDATE Books
SET AvailableCopies = AvailableCopies - 1
WHERE BookID = 1;