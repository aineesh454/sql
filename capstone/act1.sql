CREATE TABLE IF NOT EXISTS Salesman(
    Salesman_id TEXT PRIMARY KEY,
    name TEXT,
    city TEXT,
    Comission TEXT
);

INSERT INTO Salesman(Salesman_id, name, city, Comission)
VALUES
    ("5001", "James Hoog", "New York", "0.15"),
    ("5002", "Nail Knite", "Paris", "0.13"),
    ("5005", "Pit Alex", "London", "0.11"),
    ("5006", "Mc Lyon", "Paris", "0.14"),
    ("5007", "Paul Adam", "Rome", "0.13"),
    ("5003", "Lauson Hen", "San Jose", "0.12");


CREATE TABLE IF NOT EXISTS Customer(
    Customer_id TEXT PRIMARY KEY,
    name TEXT,
    city TEXT,
    grade TEXT,
    Salesman_id TEXT,
);
INSERT INTO Customer(Customer_id, name, city, grade, Salesman_id)
VALUES
    ("3002", "Henry", "San Jose", "100", "5001"),
    ("3007", "Rogers", "New York", "200", "5002"),
    ("3005", "James", "London", "150", "5005"),
    ("3008", "Smith", "Paris", "250", "5006"),
    ("3004", "Allen", "Rome", "300", "5007"),
    ("3003", "Johnson", "San Jose", "400", "5003");
    ("3006", "Williams", "New York", "350", "5001");
    ("3001", "Jones", "London", "500", "5002");

CREATE TABLE IF NOT EXISTS Orders(
    Ord_no TEXT PRIMARY KEY,
    Purch_amt TEXT,
    Ord_date TEXT,
    Customer_id TEXT,
    Salesman_id TEXT
);
INSERT INTO Orders(Ord_no, Purch_amt, Ord_date, Customer_id, Salesman_id)
VALUES
    ("70001","150.5","2012-10-05","3005","5002"),
    ("70009","270.65","2012-09-10","3001","5001"),
    ("70002","65.26","2012-10-05","3002","5003"),
    ("70004","110.5","2012-08-17","3009","5007"),
    ("70007","948.5","2012-09-10","3005","5005"),
    ("70005","2400.6","2012-07-27","3007","5006");

SELECT CUSTOMER.name, CUSTOMER.city, ORDERS.Ord_no, ORDERS.Purch_amt
FROM CUSTOMER
JOIN SALESMAN ON CUSTOMER.city = SALESMAN.city

SELECT CUSTOMER.name, SALESMAN.name
FROM ORDERS
JOIN CUSTOMER ON ORDERS.Customer_id = CUSTOMER.Customer_id
JOIN SALESMAN ON ORDERS.Salesman_id = SALESMAN.Salesman_id
WHERE CUSTOMER.city <> SALESMAN.city;

SELECT ORDERS.Ord_no, CUSTOMER.name,
FROM ORDERS
JOIN CUSTOMER ON ORDERS.Customer_id = CUSTOMER.Customer_id

SELECT Customer.cust_name AS "Customer", Customer.grade AS "Grade"
FROM Orders
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
JOIN Customer ON Orders.customer_id = Customer.customer_id
WHERE Customer.grade IS NOT NULL;

SELECT Customer.cust_name AS "Customer",
Customer.city AS "City",
Salesman.name AS "Salesman",
Salesman.commission
FROM Customer
JOIN Salesman ON Customer.Salesman_id = Salesman.Salesman_id
WHERE Salesman.commission BETWEEN 0.12 AND 0.14;

SELECT ORDERS.Ord_no, CUSTOMER.name,SALESMAN.commission as "Commission"