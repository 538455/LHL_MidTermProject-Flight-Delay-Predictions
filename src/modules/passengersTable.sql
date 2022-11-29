-- Let's start viewing the table
SELECT * FROM passengers LIMIT 100
SELECT COUNT(*) FROM passengers

-- We'll need to create a route_ID, more specifically:
-- YYYYMM-airline_id-origin-dest
-- no airline ID in the flights table.. we'll use unique_carrier instead

-- And then convert those as route info:
-- averagePayload(lbs): payload / departures_performed
-- averageFreight(lbs): freight / departures_performed
-- averageMail(lbs): mail / departures_performed
-- availableSeats: seats / departures_performed
-- availablePassengers: passengers / departures_performed
-- averageSeatsoccupied(%): passengers / seats * 100

-- And add those:
-- aircraftGroup
-- aircraftType
-- aircraftConfiguration
-- distanceInterval(*500miles)
-- serviceClass

SELECT CONCAT(year, '_', month, '-', unique_carrier, '-', origin, '-', dest) AS routeId
	, payload / departures_performed AS averagePayload_lbs
	, freight / departures_performed AS averageFreight_lbs
	, mail / departures_performed AS averageMail_lbs
	, seats / departures_performed AS availableSeats
	, passengers / departures_performed AS averagePassengers
	--, passengers / seats * 100 AS averageSeatsoccupied_perc
	, aircraft_group AS aircraftGroup
	, aircraft_type AS aircraftType
	, aircraft_config AS aircraftConfiguration
	, distance_group AS distanceInterval_x500mi
	, class AS serviceClass
FROM passengers
WHERE departures_performed > 0
--LIMIT 100