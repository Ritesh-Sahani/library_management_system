# library_management_system

📚 Library Management System
This repository contains the SQL scripts and database architecture for a Library Management System, designed to efficiently manage library operations, including book inventory, authors, borrowers, and transactions.

🚀 Features
Author and Book Management: Maintain detailed records of authors and their books.
Borrower Information: Track library users and their borrowing activities.
Transactions: Manage lending and returning of books with availability updates.
Data Integrity: Enforced using foreign keys and constraints.
🛠️ Database Structure
Entities and Relationships
Authors

Fields: AuthorID, Name, Country
Linked to books via a foreign key.
Books

Fields: BookID, Title, AuthorID, Genre, PublishedYear, AvailableCopies
Tracks availability and links to authors.
Borrowers

Fields: BorrowerID, Name, Contact
Represents library users.
Transactions

Fields: TransactionID, BorrowerID, BookID, BorrowDate, ReturnDate
Manages borrowing and returning processes.
