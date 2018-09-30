


1. PostgresSQL has windows functions for : 
	a. running totals 
	b month over month growth rates
	c. finding and removing duplicate rows 
	
	*. lag , lead, row_number 


2. postgres handels date and time formats better. 

	a. date_trunc('quarter', dt) to "round up" to a quarter
	
	b. date_trunc('week', dt) to "round up" to a week


3. The generate_series(start, stop, interval) can generate rows from start to stop with a step size of interval. For example:


	> SELECT * FROM generate_series(2,10,2);
	generate_series
	-----------------
	            2
	            4
	            6
	            8
	            1


	MYSQL does not support generate_series functinality 

4. PostgresSQL has common table expressions. 

	* temporary tables that are created just for the use in the larger query.
	* Without the CTEs, your queries will require a self-join and be really messy to read and maintai