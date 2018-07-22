 /*Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.*/

 SELECT name, 
	   primary_poc,
       sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom')
   
/* Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.*/

SELECT *
FROM web_events
WHERE channel in ('organic', 'adwords')


First, IN clauses are generally internally rewritten by most databases to use the OR logical connective.
So col IN ('a','b','c') is rewritten to: (COL = 'a') OR (COL = 'b') or (COL = 'c'). 
The execution plan for both queries will likely be equivalent assuming that you have an index on col.


Second, when using either IN or OR with a variable number of arguments, you are causing the database to have to re-parse the query
 and rebuild an execution plan each time the arguments change. Building the execution plan for a query can be an expensive step. 
 Most databases cache the execution plans for the queries they run using the EXACT query text as a key. 
 If you execute a similar query but with different argument values in the predicate - you will most likely cause the database to 
 spend a significant amount of time parsing and building execution plans. This is why bind variables are strongly recommended as a 
 way to ensure optimal query performance.


 Third, many database have a limit on the complexity of queries they can execute - one of those limits is the number of logical 
 connectives that can be included in the predicate. In your case, a few dozen values are unlikely to reach the built-in limit 
 of the database, but if you expect to pass hundreds or thousands of value to an IN clause - it can definitely happen. 
 In which case the database will simply cancel the query request.


 Fourth, queries that include IN and OR in the predicate cannot always be optimally rewritten in a parallel environment. 
 There are various cases where parallel server optimization do not get applied - MSDN has a decent introduction to optimizing queries 
 for parallelism. Generally though, queries that use the UNION ALL operator are trivially parrallelizable in most databases - and 
 are preferred to logical connectives (like OR and IN) when possible.
Show less

