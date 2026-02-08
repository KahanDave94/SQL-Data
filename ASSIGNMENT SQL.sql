
For this assignment, you will finish building the contact management database for
MarketCo 

CREATE DATABASE Assignment_SQL;
USE Assignment_SQL;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

INSERT INTO Company VALUES
(1,'Urban Outfitters, Inc.','Ajwa 1','Philadelphia','PA','19103'),
(2,'Toll Brothers','OP Road','Horsham','PA','19044'),
(3,'Apple Inc.','Nevile 1','Cupertino','CA','95014'),
(4,'Collabera Technologies Pvt.Limited','Atladra 4','Vadodara','GJ','390012'),
(5,'Amazon','Blue Cross 5','Seattle','WA','98101'),
(6,'Tesla','Stream Line 6','Austin','TX','73301'),
(7,'Ascendion Engineering Pvt.Limited','Kalali 7','Vadodara','GJ','390020');

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),

    CONSTRAINT FK_Contact_Company
    FOREIGN KEY (CompanyID)
    REFERENCES Company(CompanyID)
);

INSERT INTO Contact VALUES
(101,1,'John','Smith','Bluen','ROKASH','PA','11111',TRUE,'john@gmail.com','111-111-1111'),
(102,2,'Dianne','Connor','Selem','Texas','PA','22222',TRUE,'dianne@gmail.com','222-222-2222'),
(103,3,'Mike','Tyson','Comeinster rd','Boston','MA','33333',FALSE,'mike@gmail.com','333-333-3333'),
(104,4,'Imran','Baig','Tandalja','Vadodara','GJ','44444',TRUE,'Imran.baig@gmail.com','444-444-4444'),
(105,5,'Tom','Cruise','silver','Wales','WA','55555',FALSE,'tom@gmail.com','555-555-5555'),
(106,6,'Chris','Evans','Grosem RD','Bluester','TX','66666',TRUE,'chris@gmail.com','666-666-6666'),
(107,7,'Emma','Watson','Salt Area','BANGLORE','KA','77777',TRUE,'emma@gmail.com','777-777-7777');

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

INSERT INTO Employee VALUES
(201,'Dhir','Brahma',60000,'2020-05-10','Manager','DhirKumar@gmail.com','215-555-1111'),
(202,'Lesley','Bland',55000,'2019-04-15','Executive','lesley@gmail.com','215-555-2222'),
(203,'Robert','Downey',70000,'2018-03-20','Director','robert@gmail.com','215-555-3333'),
(204,'Scarlett','Johansson',65000,'2021-07-12','HR','scarlett@gmail.com','215-555-4444'),
(205,'Rakesh','Khalid',62000,'2022-01-25','Lead','Rakesh@gmail.com','215-555-5555'),
(206,'Mark','Ruffalo',58000,'2020-11-05','Analyst','mark@gmail.com','215-555-6666'),
(207,'Jeremy','Renner',59000,'2017-09-18','Consultant','jeremy@gmail.com','215-555-7777');

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),

    CONSTRAINT FK_ContactEmployee_Contact
    FOREIGN KEY (ContactID)
    REFERENCES Contact(ContactID),

    CONSTRAINT FK_ContactEmployee_Employee
    FOREIGN KEY (EmployeeID)
    REFERENCES Employee(EmployeeID)
);

INSERT INTO ContactEmployee VALUES
(301,101,201,'2024-01-10','General Meeting'),
(302,102,201,'2024-01-15','Project Discussion'),
(303,102,202,'2024-01-18','Sales Discussion'),
(304,103,203,'2024-02-05','Technical Meeting'),
(305,104,204,'2024-02-15','HR Discussion'),
(306,105,205,'2024-03-01','Contract Discussion'),
(307,106,206,'2024-03-10','Planning Meeting');


QUESTION 1) Statement to create the Contact table
ANSWER-

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),

    CONSTRAINT FK_Contact_Company
    FOREIGN KEY (CompanyID)
    REFERENCES Company(CompanyID)
);

INSERT INTO Contact VALUES
(101,1,'John','Smith','Bluen','ROKASH','PA','11111',TRUE,'john@gmail.com','111-111-1111'),
(102,2,'Dianne','Connor','Selem','Texas','PA','22222',TRUE,'dianne@gmail.com','222-222-2222'),
(103,3,'Mike','Tyson','Comeinster rd','Boston','MA','33333',FALSE,'mike@gmail.com','333-333-3333'),
(104,4,'Imran','Baig','Tandalja','Vadodara','GJ','44444',TRUE,'Imran.baig@gmail.com','444-444-4444'),
(105,5,'Tom','Cruise','silver','Wales','WA','55555',FALSE,'tom@gmail.com','555-555-5555'),
(106,6,'Chris','Evans','Grosem RD','Bluester','TX','66666',TRUE,'chris@gmail.com','666-666-6666'),
(107,7,'Emma','Watson','Salt Area','BANGLORE','KA','77777',TRUE,'emma@gmail.com','777-777-7777');


QUESTION 2) Statement to create the Employee table
Answer-
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

INSERT INTO Employee VALUES
(201,'Dhir','Brahma',60000,'2020-05-10','Manager','DhirKumar@gmail.com','215-555-1111'),
(202,'Lesley','Bland',55000,'2019-04-15','Executive','lesley@gmail.com','215-555-2222'),
(203,'Robert','Downey',70000,'2018-03-20','Director','robert@gmail.com','215-555-3333'),
(204,'Scarlett','Johansson',65000,'2021-07-12','HR','scarlett@gmail.com','215-555-4444'),
(205,'Rakesh','Khalid',62000,'2022-01-25','Lead','Rakesh@gmail.com','215-555-5555'),
(206,'Mark','Ruffalo',58000,'2020-11-05','Analyst','mark@gmail.com','215-555-6666'),
(207,'Jeremy','Renner',59000,'2017-09-18','Consultant','jeremy@gmail.com','215-555-7777');

QUESTION 3) Statement to create the ContactEmployee table
HINT: Use DATE as the datatype for ContactDate. It allows you to store the
date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).

ANSWER-
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),

    FOREIGN KEY (ContactID)
    REFERENCES Contact(ContactID),

    FOREIGN KEY (EmployeeID)
    REFERENCES Employee(EmployeeID)
);


INSERT INTO ContactEmployee VALUES
(301,101,201,'2024-01-10','General Meeting'),
(302,102,201,'2024-01-15','Project Discussion'),
(303,102,202,'2024-01-18','Sales Discussion'),
(304,103,203,'2024-02-05','Technical Meeting'),
(305,104,204,'2024-02-15','HR Discussion'),
(306,105,205,'2024-03-01','Contract Discussion'),
(307,106,206,'2024-03-10','Planning Meeting');


QUESTION- 4) In the Employee table, the statement that changes Lesley Bland’s phone number
to 215-555-8800

ANSWER-

SELECT * 
FROM Employee
WHERE FirstName = 'Lesley'
AND LastName = 'Bland';

UPDATE Employee
SET Phone = '215-555-8800'
WHERE EmployeeID = 3;

QUESTION 5) In the Company table, the statement that changes the name of “Urban
Outfitters, Inc.” to “Urban Outfitters” .

ANSWER-

SELECT *
FROM Company
WHERE CompanyName = 'Urban Outfitters, Inc.';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyID = 1;

QUESTION 6 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement). HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove

ANSWER- 
SELECT * 
FROM ContactEmployee
WHERE ContactEmployeeID = 302;

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 302;

QUESTION- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well. 

ANSWERS-

SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce 
ON e.EmployeeID = ce.EmployeeID
JOIN Contact c 
ON ce.ContactID = c.ContactID
JOIN Company co 
ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

OUTPUT-
FirstName	LastName
Dhir		Brahma
Lesley		Bland


Question- 8) What is the significance of “%” and “_” operators in the LIKE statement? 
In SQL the LIKE operator is used for pattern Matching in Text(STRING) data.

Answer- Word Document

QUESTION- 9) Explain normalization in the context of databases. 

Answer- Word Document

QESTION 10- 10) What does a join in MySQL mean? 

Answer- Word Document

Question-11) What do you understand about DDL, DCL, and DML in MySQL? 

Answer- Word Document

Question 12) What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins?

Answer- Word Document.



