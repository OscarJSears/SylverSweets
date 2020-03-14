DROP DATABASE IF EXISTS SylverSweets;
CREATE DATABASE SylverSweets
--------------------------------- Creating Tables #1 ---------------------------------
USE SylverSweets;
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers
(
CustomerID       INT           NOT NULL,
CustFirstName    VARCHAR(30)   NOT NULL,
CustLastName     VARCHAR(30)   NOT NULL,
CustStreet       VARCHAR(30)   NOT NULL,
CustCity         VARCHAR(30)   NOT NULL,
CustState		 VARCHAR(30)   NOT NULL,
CustZip          INT           NOT NULL,
CustPhone        VARCHAR(30)   NOT NULL,
                 PRIMARY KEY   (CustomerID)
				
)

INSERT INTO Customers
(CustomerID, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustPhone)
VALUES
(0001, 'Ryan', 'Matthews', '5967 NW 23rd Street', 'Lauderhill', 'Florida', 33313, '9548760978'),
(0002, 'Blake', 'Bortles', '123 Peach Street', 'Coral Springs', 'Florida', 23456, '6782340987'),
(0003, 'Danny', 'Charms', '7654 Columbia Road', 'Miami', 'Florida', 56432, '8032456523')
SELECT *
FROM Customers
--------------------------------- Creating Tables #2 ---------------------------------

USE SylverSweets;
DROP TABLE IF EXISTS CustomerAccount;
CREATE TABLE CustomerAccount
(
AccountID                INT          NOT NULL,
CustomerID               INT          NOT NULL,
LastPurchaseDate         DATE         NOT NULL,
LastPaymentDate          DATE         NOT NULL,
LastAccountTransaction   DATE         NOT NULL,
TransactionID            INT		  NOT NULL,
Balance                  INT          NOT NULL,
						 PRIMARY KEY  (AccountID),
						FOREIGN KEY  (CustomerID)    REFERENCES Customers(CustomerID),
						FOREIGN KEY  (TransactionID) REFERENCES Transactions(TransactionID)
)
INSERT INTO CustomerAccount
(AccountID, CustomerID, LastPurchaseDate, LastPaymentDate, LastAccountTransaction, TransactionID, Balance)
VALUES
(001, 0001, '2019-01-01', '2019-01-01', '2019-01-01', '01', $40.00)

SELECT *
FROM CustomerAccount
--------------------------------- Creating Tables #3 ----------

USE SylverSweets;
DROP TABLE IF EXISTS Products;
CREATE TABLE Products
(
ProductID         VARCHAR(30)     NOT NULL,
ProdName          VARCHAR(30)     NOT NULL,
SalePrice         INT             NOT NULL,
ProdDescription   VARCHAR(100)    NOT NULL,
				  PRIMARY KEY     (ProductID)
)
INSERT INTO Products
(ProductID, ProdName, SalePrice, ProdDescription)
VALUES
('A01', 'Cake', $40.00, 'Carrot Cake'),
('A02', 'Cookies',$1.00, 'Chocolate Chip Cookie')

SELECT *
FROM Products

--------------------------------- Creating Tables #4 ---------------------------------
USE SylverSweets;
DROP TABLE IF EXISTS PurchaseOrder;
CREATE TABLE PurchaseOrder
(
PurchaseID       INT            NOT NULL,
PurchaseDate     DATE           NOT NULL,
CustomerID       INT            NOT NULL,
ProductID        VARCHAR(30)    NOT NULL,  
Price            INT            NOT NULL,
				 PRIMARY KEY    (PurchaseID),
				 FOREIGN KEY    (CustomerID)   REFERENCES Customers(CustomerID),
				 FOREIGN KEY    (ProductID)    REFERENCES Products(ProductID)
				 
)
INSERT INTO PurchaseOrder
(PurchaseID, PurchaseDate, CustomerID, ProductID,Price)
VALUES
(001,'2019-01-01', 001, 'A01', $40.00
)

SELECT *
FROM PurchaseOrder

--------------------------------- Creating Tables #5 ---------------------------------
USE SylverSweets;
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions
(
TransactionID        INT                NOT NULL,
TransDescription     VARCHAR(100)       NOT NULL,
		             PRIMARY KEY        (TransactionID)
)
INSERT INTO Transactions
(TransactionID, TransDescription)
VALUES
('01', 'Cake'),
('02', 'Cookies'),
('03', 'Cupcakes ')

SELECT *
FROM Transactions



