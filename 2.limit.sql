/*Try it yourself below by writing a query that limits the response to only the first 15 rows 
and includes the occurred_at, account_id, and channel fields in the web_events table.*/

SELECT occurred_at, account_id ,channel 
FROM web_events
LIMIT 15


## limit is written at the end of the query. 
## not all the databases support limit
## top is used in some of the databases instead of limit. 
## SQL server or MS-access use TOP