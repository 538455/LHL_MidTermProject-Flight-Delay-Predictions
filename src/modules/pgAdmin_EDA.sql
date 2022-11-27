-- Let's get an overview of the tables in the database

-- Table: flight_subset --> DROP
	SELECT * FROM flight_subset LIMIT 100;
	-- This table contains an avg delay (departure and arrival) for each carrier, per year/month/route. Route is depicted using the airport ID of the departing airport and the arrival airport
	
	-- Compare rows with flights (15927485)
	SELECT COUNT(*) FROM flight_subset; --returns 268170
		-- Appears like a sample
	
	-- Compare columns with flights (42)
	SELECT COUNT(*) AS No_of_Column FROM information_schema.columns WHERE table_name ='flight_subset'; --6
		-- Only 6
		
	----- Any add'l columns? --> NOPE
	SELECT column_name FROM information_schema.columns WHERE table_name ='flights_temp'	AND column_name NOT IN(SELECT column_name FROM information_schema.columns WHERE table_name ='flights');


-- Table: flights_temp --> DROP
	SELECT * FROM flights_temp LIMIT 100;
	
	---- Compare rows with flights (15927485)
	SELECT COUNT(*) FROM flights_temp; --returns 15927485
	
	-- Compare columns with flights (42)
	SELECT COUNT(*) AS No_of_Column FROM information_schema.columns WHERE table_name ='flights_temp'; --42
	
	----- Any add'l columns? --> NOPE
	SELECT column_name FROM information_schema.columns WHERE table_name ='flights_temp'	AND column_name NOT IN(SELECT column_name FROM information_schema.columns WHERE table_name ='flights');



--Table: pass_sample --> DROP
	SELECT * FROM pass_sample LIMIT 100;
	
	-- Compare Row numbers with passengers (2350497)
	SELECT COUNT(*) FROM pass_sample;  --156448
	
	--Compare column numbers with passengers(38)
	SELECT COUNT(*) AS No_of_Column FROM information_schema.columns WHERE table_name ='pass_sample'; --38
	
	-- add'l column?
	SELECT column_name FROM information_schema.columns WHERE table_name ='pass_sample'	AND column_name NOT IN(SELECT column_name FROM information_schema.columns WHERE table_name ='passenger');
	--> all 38x columns returned. They seem to have renamed their columns... 



-- Table: passenger_subset  --> DROP
	SELECT * FROM passenger_subset LIMIT 100;
	-- Compare Row numbers with passengers (2350497)
	SELECT COUNT(*) FROM passenger_subset; --2350497
	
	--Compare column numbers with passengers(38)
	SELECT COUNT(*) AS No_of_Column FROM information_schema.columns WHERE table_name ='passenger_subset'; --16
	
	-- add'l column?
	SELECT column_name FROM information_schema.columns WHERE table_name ='passenger_subset'	AND column_name NOT IN(SELECT column_name FROM information_schema.columns WHERE table_name ='passenger');
	--> 16x. They seem to have renamed their columns as well



-- Table: passengers_aggregated  --> DROP
	SELECT * FROM passengers_aggregated LIMIT 100;
	
	-- Compare Row numbers with passengers (2350497)
	SELECT COUNT(*) FROM passengers_aggregated; --50495
	
	--Compare column numbers with passengers(38)
	SELECT COUNT(*) AS No_of_Column FROM information_schema.columns WHERE table_name ='passengers_aggregated'; --10
	
	-- add'l column?
	SELECT column_name FROM information_schema.columns WHERE table_name ='passengers_aggregated' AND column_name NOT IN(SELECT column_name FROM information_schema.columns WHERE table_name ='passenger');
	--> 10x. They seem to have renamed their columns as well



-- Table: sample -->DROP (flight sample)
SELECT * FROM sample LIMIT 100

-- Table: temptable
SELECT * FROM temptable LIMIT 100  -->DROP (flight sample)

-- Table: test_table
SELECT * FROM test_table LIMIT 100  -->DROP (empty)

-- -- Table: week_one
SELECT * FROM week_one LIMIT 100 -->DROP (flight sample)
--------------------------------------------------------------------------------------------
-- DESCRIPTION OF TABLES BELOW ARE PROVIDED ALREADY. NO NEED TO DO EDA AT THIS TIME.
-- -- Table: flights
SELECT * FROM flights LIMIT 100

-- -- Table: passengers
SELECT * FROM passengers LIMIT 100

-- -- Table: fuel_comsumption
SELECT * FROM fuel_comsumption LIMIT 100

-- -- Table: flights_test
SELECT * FROM flights_test LIMIT 100

-- Query to pull the 200K
SELECT * FROM flights ORDER BY random() LIMIT 200000


