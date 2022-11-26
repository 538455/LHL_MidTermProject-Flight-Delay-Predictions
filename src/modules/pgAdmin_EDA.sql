-- Let's get an overview of the tables in the database

-- -- Table: flight_subset
SELECT * FROM flight_subset LIMIT 100;
-- This table contains an avg delay (departure and arrival) for each carrier, per year/month/route. Route is depicted using the airport ID of the departing airport and the arrival airport

-- -- Table: flights_temp
SELECT * FROM flights_temp LIMIT 100;
---- Same number of rows as flights, but 5x additional columns
SELECT COUNT(*) FROM flights_temp; --returns 15927485
SELECT COUNT(*) FROM flights; --returns 15927485


-- -- Table: pass_sample
SELECT * FROM pass_sample LIMIT 100;
-- Seems to be a monthly consolidation of how many times in a month an airline did a route, to include total number of passenger.
-- OF NOTE: There's a distance column for each route which could be useful for calculating fuel consumption

-- -- Table: passenger_subset
SELECT * FROM passenger_subset LIMIT 100;

-- -- Table: passengers_aggregated
-- SELECT * FROM passengers_aggregated LIMIT 100

-- -- Table: sample
-- SELECT * FROM sample LIMIT 100

-- -- Table: temptable
-- SELECT * FROM temptable LIMIT 100

-- -- Table: test_table
-- SELECT * FROM test_table LIMIT 100

SELECT * FROM flights LIMIT 100000;

-- -- Table: week_one
-- SELECT * FROM week_one LIMIT 100
--------------------------------------------------------------------------------------------
-- DESCRIPTION OF TABLES BELOW ARE PROVIDED ALREADY
-- -- Table: flights
-- SELECT * FROM flights LIMIT 100

-- -- Table: passengers
-- SELECT * FROM passengers LIMIT 100

-- -- Table: fuel_comsumption
-- SELECT * FROM fuel_comsumption LIMIT 100
-- -- Table: flights_test
-- SELECT * FROM flights_test LIMIT 100
