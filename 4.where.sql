where statement can include :

1. >
2. < 
3. >=
4. <=
5. = 
6. !=


/*Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than 
or equal to 1000.*/

SELECT * 
FROM orders
WHERE gloss_amt_usd >=1000
LIMIT 5 

/*Pull the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.*/

SELECT * 
FROM orders
WHERE total_amt_usd <500
LIMIT 10

/*Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) for Exxon Mobil 
in the accounts table.
*/

SELECT name, 
	   website, 
       primary_poc
FROM accounts
WHERE name = 'Exxon Mobil'


/*Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. 
Limit the results to the first 10 orders, and include the id and account_id fields. */

SELECT id, account_id, standard_amt_usd/ standard_qty as standrard_unit_price
FROM orders 
LIMIT 10


/*Write a query that finds the percentage of revenue that comes from poster paper for each order. 
You will need to use only the columns that end with _usd. (Try to do this without using the total column). 
Include the id and account_id fields.*/


SELECT id, account_id,(poster_amt_usd) / (gloss_amt_usd + poster_amt_usd + total_amt_usd)
FROM orders
