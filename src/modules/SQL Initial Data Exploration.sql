--Select relevant records from passenger table
SELECT * FROM passengers
WHERE year = 2018 OR year = 2019
ORDER BY year, month;

--Select Jan 2018 records from one airline only from passenger table to better understand data
SELECT origin_airport_id, dest_airport_id, aircraft_type, COUNT(*) FROM 
	(SELECT payload, seats, origin_airport_id, dest_airport_id, aircraft_type 
	 FROM passengers 
	 WHERE year = 2018 AND month = 1 AND unique_carrier_name = 'United Air Lines Inc.'
	) AS sq
GROUP BY origin_airport_id, dest_airport_id, aircraft_type
HAVING COUNT(*) > 1;

SELECT * FROM passengers WHERE year = 2018 AND month = 1 AND unique_carrier_name = 'United Air Lines Inc.' 
AND origin_airport_id = 11618 AND dest_airport_id = 11057 AND aircraft_type = 888;

SELECT * FROM passengers WHERE year = 2018 AND month = 1 AND unique_carrier_name = 'United Air Lines Inc.'; 
-- AND origin_airport_id = 10423 AND dest_airport_id = 12266 AND aircraft_type = 614;

--Count number of times each carrier shows up in Jan 2018 data
SELECT unique_carrier_name, COUNT (*) as count_rows FROM  passengers
WHERE year = 2018 AND month = 1
GROUP BY unique_carrier_name
ORDER BY count_rows DESC;

--Count unique carriers in Jan 2018 data
SELECT COUNT (DISTINCT unique_carrier_name) FROM passengers
WHERE year = 2018 AND month = 1;

--FLIGHTS TABLE EXPLORATION
SELECT COUNT(*) FROM flights; -- 15927485 rows overall

SELECT * FROM flights LIMIT 20;

--Is op_carrier a duplicate of mkt_carrier?
SELECT COUNT(*) FROM flights
WHERE op_unique_carrier != mkt_carrier;

--Is op_carrier_fl_num a duplicate of mkt_carrier_fl_num?
SELECT op_carrier_fl_num, mkt_carrier_fl_num FROM flights
WHERE op_carrier_fl_num != mkt_carrier_fl_num;

--Are there any values where dup is not 'N'?
SELECT DISTINCT(dup) FROM flights;

--Are there any values where flight is > 1?
SELECT flights FROM flights WHERE flights != 1;

--Are codeshares creating duplicate rows?
SELECT branded_code_share FROM flights LIMIT 5000;

--Codeshares Investigation
SELECT op_unique_carrier, mkt_unique_carrier, branded_code_share 
FROM flights 
WHERE branded_code_share LIKE '%CODESHARE';

-- Check the years in the flights table
SELECT MIN(fl_date) FROM flights;

-- Why do some flights have NaN/Os scheduled/actual departure/arrival time?
-- explore: crs_dep_time, dep_time, crs_arr_time, arr_time
SELECT * FROM flights LIMIT 10;
SELECT COUNT(*) FROM flights WHERE crs_dep_time IS NULL; --0
SELECT COUNT(*) FROM flights WHERE dep_time IS NULL; --258,814
SELECT COUNT(*) FROM flights WHERE crs_arr_time IS NULL; --0
SELECT COUNT(*) FROM flights WHERE arr_time IS NULL; --275,079

--Do the flights that were cancelled have a null dep and arr time?
SELECT DISTINCT cancellation_code FROM flights 
WHERE cancelled != 0 AND dep_time IS NOT NULL;

-- See all cancellation codes
SELECT DISTINCT cancellation_code FROM flights;

-- Do any flights that were cancelled have an arrival time? 
SELECT COUNT(*) FROM flights 
WHERE cancelled != 0 AND arr_time IS NOT NULL;

SELECT * FROM flights WHERE dep_time IS NULL AND cancelled = 0
LIMIT 5000;
--there are only 8 flights where there is no departure time and they were not cancelled. 
--7 out of the 8 are coming from Alaska and are KS flights with AS_CODESHARE
--Many are also the same plane. This seems like most likely an error in the data. 

SELECT * FROM flights WHERE dep_time IS NULL AND arr_time IS NOT NULL; --only 1 record

--Figure out if 'codeshares' are duplicates.
SELECT * FROM flights 
WHERE branded_code_share LIKE '%CODESHARE' AND mkt_carrier_fl_num != op_carrier_fl_num
LIMIT 500;

SELECT * 
FROM flights 
WHERE fl_date = '2018-02-16' 
AND origin = 'PDX' AND dest = 'SEA'
ORDER BY op_carrier_fl_num;

SELECT DISTINCT(fl_date) FROM flights_test
ORDER BY fl_date;

--PASSENGERS TABLE
--Count rows in passenger table
SELECT * FROM passengers LIMIT 10;

--Count rows of 2018 and 2019 for domestic US flights only
SELECT COUNT(*) FROM passengers
WHERE (year = 2018 OR year = 2019)
AND (origin_country = 'US' AND dest_country = 'US');

--Select all columns of potential interest
SELECT 
	departures_performed, 
	payload, 
	seats,
	passengers,
	freight,
	mail,
	distance,
	ramp_to_ramp,
	air_time,
	unique_carrier,
	airline_id,
	origin,
	dest,
	aircraft_group,
	aircraft_type,
	aircraft_config,
	year,
	month,
	distance_group,
	class
FROM passengers
WHERE (origin NOT LIKE '%0%' AND origin NOT LIKE '%1%' AND origin NOT LIKE '%2%' AND origin NOT LIKE '%3%'
	   AND origin NOT LIKE '%4%' AND origin NOT LIKE '%5%' AND origin NOT LIKE '%6%'
	   AND origin NOT LIKE '%7%' AND origin NOT LIKE '%8%' AND origin NOT LIKE '%9%')
	   AND (year = 2018 OR year = 2019) 
	   AND (origin_country = 'US' AND dest_country = 'US');
	   
--Count relevant rows
SELECT COUNT(*) FROM passengers
WHERE (origin NOT LIKE '%0%' AND origin NOT LIKE '%1%' AND origin NOT LIKE '%2%' AND origin NOT LIKE '%3%'
	   AND origin NOT LIKE '%4%' AND origin NOT LIKE '%5%' AND origin NOT LIKE '%6%'
	   AND origin NOT LIKE '%7%' AND origin NOT LIKE '%8%' AND origin NOT LIKE '%9%')
	   AND (year = 2018 OR year = 2019) 
	   AND (origin_country = 'US' AND dest_country = 'US');

SELECT DISTINCT distance_group FROM passengers LIMIT 50;

--Select all features to answer EDA question 9 (use origin airport)
SELECT 
	origin,
	SUM(departures_performed) AS total_departures, 
	SUM(passengers) AS total_departing_passengers,
	year,
	month
FROM passengers
WHERE 
	(origin NOT LIKE '%0%' AND origin NOT LIKE '%1%' AND origin NOT LIKE '%2%' AND origin NOT LIKE '%3%'
		AND origin NOT LIKE '%4%' AND origin NOT LIKE '%5%' AND origin NOT LIKE '%6%'
		AND origin NOT LIKE '%7%' AND origin NOT LIKE '%8%' AND origin NOT LIKE '%9%')
	AND (dest NOT LIKE '%0%' AND dest NOT LIKE '%1%' AND dest NOT LIKE '%2%' AND dest NOT LIKE '%3%'
		AND dest NOT LIKE '%4%' AND dest NOT LIKE '%5%' AND dest NOT LIKE '%6%'
		AND dest NOT LIKE '%7%' AND dest NOT LIKE '%8%' AND dest NOT LIKE '%9%')
	AND (year = 2018 OR year = 2019) 
	AND (origin_country = 'US' AND dest_country = 'US')
GROUP BY origin, year, month;

--Select all features to answer EDA question 9 (use dest airport)
SELECT 
	dest,
	SUM(departures_performed) AS total_arrivals, 
	SUM(passengers) AS total_arriving_passengers,
	year,
	month
FROM passengers
WHERE 
	(origin NOT LIKE '%0%' AND origin NOT LIKE '%1%' AND origin NOT LIKE '%2%' AND origin NOT LIKE '%3%'
		AND origin NOT LIKE '%4%' AND origin NOT LIKE '%5%' AND origin NOT LIKE '%6%'
		AND origin NOT LIKE '%7%' AND origin NOT LIKE '%8%' AND origin NOT LIKE '%9%')
	AND (dest NOT LIKE '%0%' AND dest NOT LIKE '%1%' AND dest NOT LIKE '%2%' AND dest NOT LIKE '%3%'
		AND dest NOT LIKE '%4%' AND dest NOT LIKE '%5%' AND dest NOT LIKE '%6%'
		AND dest NOT LIKE '%7%' AND dest NOT LIKE '%8%' AND dest NOT LIKE '%9%')
	AND (year = 2018 OR year = 2019) 
	AND (origin_country = 'US' AND dest_country = 'US')
GROUP BY dest, year, month;

--Explore Fuel Comsumption Table
--Count values in fuel consumption table
SELECT COUNT(*) FROM fuel_comsumption;

--Explore 
SELECT * FROM fuel_comsumption LIMIT 10;

