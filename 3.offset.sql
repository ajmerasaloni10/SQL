
SELECT occurred_at, account_id ,channel 
FROM web_events
LIMIT 3 

# o/p
2015-10-06T17:13:58.000Z	1001	direct
2015-11-05T03:08:26.000Z	1001	direct
2015-12-04T03:57:24.000Z	1001	direct

# using offset 1 
SELECT occurred_at, account_id ,channel 
FROM web_events
LIMIT 3 offset 1 

# what offset means is it will skip the first row  and  return next 3 rows
2015-11-05T03:08:26.000Z	1001	direct
2015-12-04T03:57:24.000Z	1001	direct
2016-01-02T00:55:03.000Z	1001	direct

# using offset 2
SELECT occurred_at, account_id ,channel 
FROM web_events
LIMIT 3 offset 2


2015-12-04T03:57:24.000Z	1001	direct
2016-01-02T00:55:03.000Z	1001	direct
2016-02-01T19:02:33.000Z	1001	direct

# what offset means is it will skip the first two rows  and  return next 3 rows
