1. Data: Raw facts or information (like numbers, text, or dates) used for analysis or processing.
Database: A collection of organized data stored electronically for easy access and management.
Relational Database: A type of database that stores data in tables with rows and columns, and allows relationships between tables.
Table: A structured format in a database that organizes data into rows (records) and columns (fields).

2. Relational Database Management System (RDBMS): SQL Server is a powerful RDBMS that supports structured data storage, allowing users to organize and manage data using tables, indexes, views, and relationships.
Scalability and Performance: SQL Server can handle large volumes of data and complex queries efficiently. It offers features like indexing, partitioning, and in-memory processing to optimize performance.
Security Features: SQL Server provides robust security with features such as encryption, authentication, authorization, and auditing. It supports both Windows and SQL Server authentication, along with role-based security.
High Availability and Disaster Recovery: SQL Server includes features like Always On Availability Groups, database mirroring, and failover clustering to ensure high availability and disaster recovery for critical applications.
Integration and Reporting Services: SQL Server integrates seamlessly with various Microsoft tools like Power BI, Azure, and Excel. It also includes SQL Server Integration Services (SSIS) for data integration and SQL Server Reporting Services (SSRS) for generating and managing reports.

3. Windows Authentication: This mode uses the Windows operating system's user accounts for authentication. Users are authenticated based on their Windows login credentials. It's more secure because it leverages the existing Windows security infrastructure, such as Active Directory, and doesn't require SQL Server-specific login credentials.
SQL Server Authentication: In this mode, SQL Server uses its own set of login credentials (username and password) for authentication. It is useful when Windows Authentication is not feasible, such as when connecting from non-Windows clients or when users don't have Windows accounts.

4. create database SchoolDB
5. CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
6.SQL Server is a Relational Database Management System (RDBMS) developed by Microsoft. It is the actual software that stores and manages your data. When you create a database, run queries, or store information, SQL Server is the engine doing the work in the background.

SSMS (SQL Server Management Studio) is a graphical user interface (GUI) tool also created by Microsoft. It allows you to connect to SQL Server, write SQL queries, create tables, back up databases, and more — all in a user-friendly environment. You use SSMS to interact with SQL Server without needing to use command-line tools.

SQL (Structured Query Language) is a programming language used to interact with databases. You use SQL to create tables, insert data, retrieve data, update records, and delete data. SQL is the language you write inside SSMS to tell SQL Server what to do.

7. Command - Type Full Name - Purpose Key -  Commands
DQL	- Data Query Language - Retrieve data - SELECT
DML - Data Manipulation Language - Add, update, delete data - INSERT, UPDATE, DELETE
DDL - Data Definition Language - Define/modify database structure - CREATE, ALTER, DROP, TRUNCATE
DCL - Data Control Language - Control user access - GRANT, REVOKE
TCL - Transaction Control Language - Manage database transactions - COMMIT, ROLLBACK, SAVEPOINT
8. INSERT INTO Students (StudentID, Name, Age)
VALUES 
(1, 'Alice Johnson', 20),
(2, 'Brian Smith', 22),
(3, 'Catherine Lee', 21);
9. Databases -> Restore Database -> Device -> Add -> select the file that must be uploaded

