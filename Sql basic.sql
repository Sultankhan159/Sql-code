CREATE DATABASE sqlbasic;     -- to create a database 
USE sqlbasic;              -- to use this database

SHOW DATABASES;              -- to cheack how many databases r created

DROP DATABASE sqlbasic;     -- to delete the database

CREATE TABLE employees(     -- to create a table
 employee_id INT,           -- this int,varchar,decimal,date r the datatype
 first_name VARCHAR(25),
 last_name VARCHAR(25),
 hourly_pay DECIMAL(5,2),
 hire_date DATE
);
SELECT * FROM employees;                             -- to see the table from employee table
SELECT first_name,phone_number FROM employees;        -- only you can  see those column which you r selected
SELECT * FROM employees WHERE employee_id=3;          -- you can search any single data from this table using where 
SELECT * FROM employees WHERE hourly_pay <= 65;       -- you can use operator 
RENAME TABLE workers TO employees;   -- to change table 
ALTER TABLE employees ADD phone_number VARCHAR(10);  -- TO add new column in table
ALTER TABLE employees RENAME COLUMN last_name TO email;    -- to rename any column name 
ALTER TABLE employees MODIFY COLUMN email  VARCHAR(100);      -- to modify any column datatype
ALTER TABLE employees MODIFY email VARCHAR(100) AFTER phone_number;      -- to change position 
ALTER TABLE employees DROP COLUMN email;                      -- to delete column
TRUNCATE TABLE employees;                               -- to delete all data from table
INSERT INTO employees                               
VALUES (1,"bob","sogh",25.12,"2023-01-25","5689458715"),
(2,"miguel","siod",30.5,"2023-05-15","4869571256"),
(3,"sonam","bpojk",50.98,"2024-01-24","7596841526"),
(4,"punam","iojk",68.56,"2025-05-10","8456129536"),
(5,"babe","boti",98.99,"2013-02-23","6598741259");

CREATE VIEW employees_attendence AS                  -- use of view
SELECT first_name,last_name FROM employees;
SELECT * FROM employees_attendence;

SELECT * FROM employees WHERE hire_date<"2024-03-15" AND hourly_pay>50.00;       -- logical operator

SELECT * FROM employees WHERE first_name LIKE "S%";           -- suppose to find a name or anything that starts with any letter or ther whatever then you have to use this /for first letter s% / for last %s

SELECT * FROM employees ORDER BY first_name ASC;        -- you can order also by using  ASC/DESC
SELECT * FROM employees ORDER BY hire_date;

UPDATE employees SET phone_number="8637516524" WHERE employee_id = 1;    -- to update anythings in column
SET SQL_SAFE_UPDATES=0;                                               -- to stop safe update mode




CREATE TABLE test(            -- create a new table named test
my_date DATE,
my_time TIME,
my_datetime DATETIME
);
SELECT * FROM test;            -- to see the table test
INSERT INTO test VALUES(CURRENT_DATE(),CURRENT_TIME(),NOW());    -- to insert current date and time in test table




CREATE TABLE product(                -- create a new table product
product_id INT,
product_name VARCHAR(20) UNIQUE,              -- we use unique constrant for unique
price DECIMAL(4,2)
);
SELECT * FROM product;     -- to see the table
INSERT INTO product           -- data inserted to product table
VALUES(100,"ice cream",75.50),
(101,"cake",25.25),
(102,"momo",50.5),
(103,"nanpuri",21.30),
(104,"lassi",50.06),
(106,"colddrinks",93.45);




CREATE TABLE customer(                         -- create a new table customer with primary key and auto increment
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(25),
last_name VARCHAR(25)
);
INSERT INTO customer  (first_name,last_name)          -- inserting values into customer table
VALUES ("sultan","khan"),
("rozina","rahaman"),
("ishrat","parvin");
SELECT * FROM customer;         -- to see the data
SELECT * FROM customer LIMIT 2;                -- use of limit
SHOW INDEXES FROM customer;              -- use of index



CREATE TABLE transactions(            -- create another table transactions 
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
amount DECIMAL(5,2),
customer_id INT,               -- for foreign key
FOREIGN KEY(customer_id)REFERENCES customer(customer_id)
);
INSERT INTO transactions(amount,customer_id)
VALUES(10.25,2),
(25.5,1),
(30.1,1);
SELECT * FROM transactions;


SELECT * FROM transactions INNER JOIN customer        -- inner join between transaction and customer id
ON transactions.customer_id = customer.customer_id;

SELECT transaction_id,amount,first_name,last_name FROM transactions INNER JOIN customer     -- inner join
ON transactions.customer_id = customer.customer_id;

SELECT * FROM transactions LEFT JOIN customer             -- left join/ same right join also
ON transactions.customer_id = customer.customer_id;

SELECT * FROM transactions   LEFT JOIN  customer           -- FULL JOIN
ON transactions.customer_id=customer.customer_id
UNION
SELECT * FROM transactions   RIGHT JOIN  customer 
ON transactions.customer_id=customer.customer_id;



SELECT COUNT(amount) FROM transactions;            -- mysql function
SELECT MAX(amount)FROM transactions;
SELECT CONCAT(first_name,last_name)AS full_name FROM customer;

