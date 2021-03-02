/* do not change the following two lines! */
.header on
.mode column
/* do not change the above two lines! */


/*Task One: List the name of each supplier together with the average price of the products that they supply (round the average to 2 decimal places). */

SELECT supplier.name, ROUND(AVG(product.price),2) AS "Average price" FROM supplier, product WHERE product.supplierID = supplier.supplierID GROUP BY supplier.supplierID;

/*Task Two: List the name of each shop together with the largest and the average number of products ordered by the shop (round the average to 1 decimal place). */

SELECT supplier.name, MAX(product.price) AS "Biggest price", ROUND(AVG(product.price),1) AS "Average price" FROM supplier, product WHERE supplier.supplierID = product.supplierID
GROUP BY supplier.name;

/*Task Three: List the name of each shop and the number of orders that the shop has placed. The shop with the largest number of orders should be listed first; shops with the same number of orders should be listed alphabetically.  */

SELECT customer.shopname, COUNT(customerOrder.orderNumber) AS "Number of orders" FROM customer, customerOrder WHERE customer.customerID = customerorder.customerID GROUP BY customer.customerID ORDER BY COUNT(customerOrder.orderNumber) DESC, customer.shopname ASC;

/*Task Four: List each order number together with the number of different products ordered in each order. */

SELECT customerorder.ordernumber, COUNT(orderproduct.productID) AS "Number of products" FROM customerorder, orderproduct WHERE customerorder.ordernumber = orderproduct.ordernumber GROUP BY customerorder.ordernumber;

/*Task Five: List the name of each supplier together with the total value of the products that they supply. These details should be listed from largest to smallest value. */

SELECT supplier.name, SUM(product.price) AS "Total value of products" FROM supplier, product WHERE supplier.supplierid = product.supplierID GROUP BY supplier.supplierID ORDER BY SUM(product.price) DESC;

/*Task Six: List the name of each product that has been ordered with the combined total quantity of the product that has been ordered. The products should be listed from largest combined total to smallest; product with the same combined total should be listed alphabetically by product name. */

SELECT product.name, COUNT(orderproduct.productID) AS "No. products in order" FROM product, orderproduct WHERE product.productID = orderproduct.productID GROUP BY orderproduct.ordernumber ORDER BY COUNT(orderproduct.productID) DESC, product.name ASC;

/*Task Seven: List the name of each shop and the total number of bears that have been ordered by the shop. The shop that has ordered the smallest number of bears should be listed first. */

SELECT customer.shopname, COUNT(orderproduct.productID) AS "No. bears in order" FROM customer, orderproduct, product, customerorder WHERE product.name LIKE "% bear" AND customer.customerID = customerOrder.customerId AND customerOrder.ordernumber = orderproduct.ordernumber GROUP BY customerorder.ordernumber ORDER BY COUNT(orderproduct.productID) ASC;

/*Task Eight: List the name of each shop, the order number of any orders placed by the shop, the date and the total cost of those orders. Arrange these details in alphabetical order of shop name; where a shop has placed two or more orders, the most recent order should be listed first.  */

SELECT customer.shopname, customerorder.ordernumber, customerorder.orderdate, ROUND(product.price * orderproduct.quantity, 2) AS "Total price of order"FROM customer, customerorder, orderproduct, product WHERE product.productID = orderproduct.productID AND orderproduct.ordernumber = customerorder.ordernumber AND customerorder.customerID = customer.customerID GROUP BY customerorder.ordernumber ORDER BY customer.shopname ASC, customerorder.orderdate DESC;