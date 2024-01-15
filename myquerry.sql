-- Retrieve all customers from Mora city
.print The information is stored in data.sql
.print 1.Retrieve all customers from Mora city
SELECT *
FROM Customers
WHERE CITY = 'Mora';

--Retrieve the latest order for each customer
.print 2.Retrieve all customers from Mora city
SELECT order_id , max(order_date) as order_date , customer_id
FROM orders;

--Get the total number of orders for each customer
.print 3.Get the total number of orders for each customer
SELECT CUSTOMER_ID , COUNT(ORDER_ID) AS TOTA_ORDER
FROM orders
GROUP BY CUSTOMER_ID;

--Calculate the running total of sales for each product over time
.print 4.Get the total number of orders for each customer
SELECT 
  od.product_id,
  o.order_date,
  sum(od.quantity * p.unit_price) OVER (PARTITION BY od.product_id ORDER BY o.order_date) AS running_total
FROM orders O
LEFT JOIN ORDER_DETAILS OD
ON O.ORDER_ID = OD.ORDER_ID
LEFT JOIN PRODUCTS P 
ON OD.PRODUCT_ID = P.PRODUCT_ID;

--Retrieve the product names and their prices from the “products” table, where the price is less than $20
.print 5.Retrieve the product names and their prices from the “products” table, where the price is less than $20
SELECT PRODUCT_NAME , 
       UNIT_PRICE AS PRICE
FROM PRODUCTS
WHERE PRICE <= 20;

-- Find the highest order amount and the corresponding customer
.print 6.Find the highest order amount and the corresponding customer
SELECT customer_name , MAX(AMOUNT) AS highest_orders_amount
FROM CUSTOMERS CUS
LEFT JOIN ORDERS OD
ON CUS.customer_id = OD.customer_id
LEFT JOIN PAYMENTS PAY 
ON OD.order_id = PAY.order_id;

--Retrieve the payment methods and their amounts from the “Payments” table where the total amount is less than $200
.print 7.Retrieve the payment methods and their amounts from the “Payments” table where the total amount is less than $200
SELECT payment_method , amount
FROM payments
WHERE amount <= 200 ;

--Calculate the average order count per city
.print 8.Calculate the average order count per city
SELECT city , avg(order_count) as avg_order
FROM CUSTOMERS
group by city ;

--Find the top 5 customers with the highest total order amount
.print 9.Find the top 5 customers with the highest total order amount
SELECT cus.customer_id ,cus.customer_name , sum(amount) AS TOTAL_AMOUNT
FROM CUSTOMERS CUS
LEFT JOIN ORDERS OD
ON CUS.customer_id = OD.customer_id
LEFT JOIN PAYMENTS PAY 
ON OD.order_id = PAY.order_id 
GROUP BY od.customer_id 
ORDER BY  TOTAL_AMOUNT DESC
LIMIT 5;

--List all products along with the total quantity sold
.print 10.List all products along with the total quantity sold
SELECT P.product_NAME , SUM(QUANTITY) AS TOTAL_QUANTITY
FROM PRODUCTS P
LEFT JOIN Order_Details OD
ON P.product_id = OD.product_id
GROUP BY P.product_NAME 
ORDER BY TOTAL_QUANTITY ;

--Calculate the payment method with the highest total amount
.print 11.Calculate the payment method with the highest total amount
SELECT payment_method , SUM(AMOUNT) AS TOTAL_MOUNT
FROM PAYMENTS
GROUP BY PAYMENT_ID
ORDER BY TOTAL_MOUNT DESC LIMIT 1;

--Calculate the total revenue from the “orders” table by multiplying “quantity” and “unit_price” columns
.print 12.Calculate the payment method with the highest total amount
SELECT SUM(OD.quantity * P.unit_price) AS REVENUE
FROM Order_Details OD 
LEFT JOIN Products P 
ON OD.product_id = P.product_id
LIMIT 5 ;

--Retrieve the product names and their prices from the “products” table, where the price is between $20 and $50
.print 13.Retrieve the product names and their prices from the “products” table, where the price is between $20 and $50
SELECT PRODUCT_NAME , UNIT_PRICE
FROM PRODUCTS
WHERE UNIT_PRICE between 20 AND 50 ;

--Calculate the percentage of total sales for each payment method
.print 14.Calculate the percentage of total sales for each payment method
SELECT PAYMENT_METHOD ,
ROUND((SUM(AMOUNT) / (SELECT SUM(amount) FROM payments) *100),2) as Percentile_sales
FROM PAYMENTS
GROUP BY PAYMENT_METHOD ; 

--Find the product names with expiration dates before the year 2023
.print 15.Find the product names with expiration dates before the year 2023
SELECT *
FROM expired_products
WHERE EXPIRATION_DATE < '2023-01-01' ;

--Retrieve the latest order for each product
.print 16.Retrieve the latest order for each product
SELECT P.product_name , MAX(O.ORDER_DATE) AS LAST_ORDER_DATE
FROM PRODUCTS P
LEFT JOIN Order_Details OD 
ON P.product_id = OD.product_id
LEFT JOIN ORDERS O
ON OD.order_id = O.order_id
GROUP BY OD.PRODUCT_ID;

--Calculation the customers who have made the highest total payments
.print 17.Calculation the customers who have made the highest total payments
SELECT CUS.customer_NAME,SUM(AMOUNT) AS TOTAL_AMOUNT
FROM CUSTOMERS CUS 
LEFT JOIN ORDERS O 
ON CUS.customer_id = O.customer_id
LEFT JOIN PAYMENTS PAY 
ON O.order_id = PAY.order_id
GROUP BY CUS.customer_id
ORDER BY TOTAL_AMOUNT DESC 
LIMIT 1 ;