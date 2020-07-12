/* 
Create 6 different Queries

1. How many Customers
*/

SELECT * 
FROM customer;

/* 2. order packages processed by end date and the package id nr */
SELECT *
FROM process
ORDER BY process_end_date, package_id DESC;

/* 3. get total amount of packages */
SELECT SUM(package_cost)
FROM packages;

/* 4. which packages were received, by whom and at what date*/
SELECT *
FROM recipient
INNER JOIN recipient_status
ON recipient_status.package_id = recipient.package_id
WHERE recipient_status.received_date = '2020-07-26';

/* 5. which employee has processed which package on date before july 2020 */
SELECT first_name
FROM employee
INNER JOIN process
ON process.package_id = employee.package_id
WHERE process_st_date < '2020-07-01';

/* 6. generate message and rename displayed of send status*/
SELECT send, 
CASE 
WHEN send = 'YES' THEN 'The package is on the way' 
ELSE 'The package is pending' 
END AS Send_Details 
FROM process_status








