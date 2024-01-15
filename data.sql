-- DDL
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  city VARCHAR(50),
  order_count INTEGER
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  payment_method VARCHAR(50),
  amount INTEGER,
  order_id INT,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Order_Details (
  order_id INT,
  product_id INT,
  quantity INTEGER,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  unit_price FLOAT
);

CREATE TABLE Expired_Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  expiration_date DATE
);

-- DML
INSERT INTO Orders (order_id, customer_id, order_date)
VALUES
  (1, '61-9760745', '2022-01-17'),
  (2, '52-3535014', '2021-09-07'),
  (3, '02-1137231', '2022-02-16'),
  (4, '84-5692031', '7/4/2023'),
  (5, '54-2364648', '7/25/2021'),
  (6, '95-8839983', '2/22/2022'),
  (7, '40-2510020', '7/30/2022'),
  (8, '36-4985773', '11/26/2021'),
  (9, '90-7608988', '11/25/2023'),
  (10, '71-4595008', '3/5/2023'),
  (11, '71-7937313', '6/4/2021'),
  (12, '77-7174697', '2/14/2023'),
  (13, '15-0555193', '8/1/2021'),
  (14, '31-7775741', '5/14/2021'),
  (15, '41-5178437', '1/23/2023'),
  (16, '17-9826606', '5/28/2021'),
  (17, '72-9932424', '4/10/2023'),
  (18, '72-1705612', '5/26/2021'),
  (19, '75-3153045', '4/4/2021'),
  (20, '94-7031101', '12/18/2021'),
  (21, '53-0525345', '5/23/2021'),
  (22, '66-1570441', '4/7/2023'),
  (23, '23-0581020', '12/3/2021'),
  (24, '29-0813345', '2/13/2023'),
  (25, '74-0511441', '11/30/2021');

-- DML
INSERT INTO Products (product_id, product_name, unit_price)
VALUES
  (1, 'Sugar - Brown', 66.52),
  (2, 'Tea - Herbal I Love Lemon', 10.73),
  (3, 'Cloves - Ground', 56.41),
  (4, 'Trout - Rainbow, Frozen', 54.27),
  (5, 'Lychee', 54.62),
  (6, 'Yogurt - Strawberry, 175 Gr', 81.97),
  (7, 'Dates', 32.79),
  (8, 'Potatoes - Fingerling 4 Oz', 35.62),
  (9, 'Pork - Sausage, Medium', 42.65),
  (10, 'Chicken Giblets', 12.21);

-- DML
INSERT INTO Order_Details (order_id, product_id, quantity)
VALUES
  (1, 1, 3),
  (2, 2, 8),
  (3, 3, 8),
  (4, 4, 1),
  (5, 5, 8),
  (6, 6, 8),
  (7, 7, 1),
  (8, 8, 6),
  (9, 9, 8),
  (10, 10, 6),
  (11, 1, 10),
  (12, 2, 10),
  (13, 3, 10),
  (14, 4, 1),
  (15, 5, 9),
  (16, 6, 10),
  (17, 7, 7),
  (18, 8, 1),
  (19, 9, 6),
  (20, 10, 1),
  (21, 1, 9),
  (22, 3, 5),
  (23, 4, 6),
  (24, 5, 2),
  (25, 10, 3);

-- DML
INSERT INTO Customers (customer_id, customer_name, city, order_count)
VALUES
  ('61-9760745', 'Frankie', 'Okuta', 3),
  ('52-3535014', 'Izaak', 'Mugumu', 5),
  ('02-1137231', 'Andie', 'Dampit', 6),
  ('84-5692031', 'Brenden', 'Sabanalarga', 5),
  ('54-2364648', 'Lesya', 'Khorostkiv', 4),
  ('95-8839983', 'Pippy', 'Sayama', 2),
  ('40-2510020', 'Stacey', 'Baisha', 1),
  ('36-4985773', 'Ginevra', 'Pajapita', 1),
  ('90-7608988', 'Thor', 'As Suqaylibīyah', 1),
  ('71-4595008', 'Yettie', 'Mora', 10),
  ('71-7937313', 'Rodge', 'Stockholm', 10),
  ('77-7174697', 'Janka', 'Junyang', 8),
  ('15-0555193', 'Sutherlan', 'Dongshangguan', 4),
  ('31-7775741', 'Meredithe', 'Fengjiang', 8),
  ('41-5178437', 'Drucy', 'Trelleborg', 3),
  ('17-9826606', 'Cybill', 'Huaibei', 6),
  ('72-9932424', 'Christie', 'Surulangun Rawas', 6),
  ('72-1705612', 'Jillian', 'Luhansk', 5),
  ('75-3153045', 'Lira', 'Tongliao', 9),
  ('94-7031101', 'Andie', 'Baitu', 9),
  ('53-0525345', 'Reggie', 'Timóteo', 2),
  ('66-1570441', 'Riobard', 'Clones', 7),
  ('23-0581020', 'Stephine', 'Bandera', 9),
  ('29-0813345', 'Jock', 'Frederiksberg', 5),
  ('74-0511441', 'Osgood', 'Dobřany', 8);

-- DML
INSERT INTO Payments (payment_id, order_id, payment_method, amount)
VALUES
  (1, 1, 'maestro', 40.01),
  (2, 2, 'jcb', 56.67),
  (3, 3, 'diners-club-enroute', 72.84),
  (4, 4, 'jcb', 30.33),
  (5, 5, 'china-unionpay', 66.84),
  (6, 6, 'visa-electron', 77.79),
  (7, 7, 'jcb', 47.14),
  (8, 8, 'jcb', 15.81),
  (9, 9, 'diners-club-carte-blanche', 88.60),
  (10, 10, 'visa', 31.98),
  (11, 11, 'jcb', 16.44),
  (12, 12, 'diners-club-enroute', 21.02),
  (13, 13, 'jcb', 27.92),
  (14, 14, 'mastercard', 51.04),
  (15, 15, 'visa', 46.66),
  (16, 16, 'diners-club-enroute', 44.49),
  (17, 17, 'jcb', 24.45),
  (18, 18, 'mastercard', 34.83),
  (19, 19, 'jcb', 30.27),
  (20, 20, 'china-unionpay', 85.42),
  (21, 21, 'visa-electron', 37.04),
  (22, 22, 'solo', 67.41),
  (23, 23, 'mastercard', 45.35),
  (24, 24, 'jcb', 17.58),
  (25, 25, 'jcb', 67.63);

-- DML
INSERT INTO Expired_Products (product_id, product_name, expiration_date)
VALUES
  (1, 'Sugar - Brown', '2022-10-31 04:58:50'),
  (2, 'Tea - Herbal I Love Lemon', '2022-05-04 12:33:53'),
  (3, 'Cloves - Ground', '2023-03-26 14:57:03'),
  (4, 'Trout - Rainbow, Frozen', '2021-07-06 18:54:31'),
  (5, 'Lychee', '2021-12-14 20:57:23'),
  (6, 'Yogurt - Strawberry, 175 Gr', '2021-02-05 00:10:18'),
  (7, 'Dates', '2021-03-15 12:30:40'),
  (8, 'Potatoes - Fingerling 4 Oz', '2023-08-18 10:53:20'),
  (9, 'Pork - Sausage, Medium', '2023-06-08 09:06:04'),
  (10, 'Chicken Giblets', '2022-01-16 06:19:44');

.print #######################
.print #### SQL Challenge ####
.print #######################

.mode box
