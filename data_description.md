# Data Description
We can find the **all** information about specific attributes in this file.

### Table **flights**

Variables:

- **fl_date**: Flight Date (yyyy-mm-dd)
- **mkt_unique_carrier**: Unique Marketing Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
- **branded_code_share**: Reporting Carrier Operated or Branded Code Share Partners
- **mkt_carrier**: Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.
- **mkt_carrier_fl_num**: Flight Number
- **op_unique_carrier**: Unique Scheduled Operating Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users,for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
- **tail_num**: Tail Number
- **op_carrier_fl_num**: Flight Number
- **origin_airport_id**: Origin Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
- **origin**: Origin Airport
- **origin_city_name**: Origin Airport, City Name
- **dest_airport_id**: Destination Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
- **dest**: Destination Airport
- **dest_city_name**: Destination Airport, City Name
- **crs_dep_time**: CRS Departure Time (local time: hhmm)
- **dep_time**: Actual Departure Time (local time: hhmm)
- **dep_delay**: Difference in minutes between scheduled and actual departure time. Early departures show negative numbers.	
- **taxi_out**: Taxi Out Time, in Minutes
- **wheels_off**: Wheels Off Time (local time: hhmm)
- **wheels_on**: Wheels On Time (local time: hhmm)
- **taxi_in**: 	Taxi In Time, in Minutes
- **crs_arr_time**: CRS Arrival Time (local time: hhmm)
- **arr_time**: Actual Arrival Time (local time: hhmm)
- **arr_delay**: Difference in minutes between scheduled and actual arrival time. Early arrivals show negative numbers.
- **cancelled**: Cancelled Flight Indicator (1=Yes)
- **cancellation_code**: Specifies The Reason For Cancellation
- **diverted**: Diverted Flight Indicator (1=Yes)
- **dup**: Duplicate flag marked Y if the flight is swapped based on Form-3A data
- **crs_elapsed_time**: CRS Elapsed Time of Flight, in Minutes
- **actual_elapsed_time**: Elapsed Time of Flight, in Minutes
- **air_time**: Flight Time, in Minutes
- **flights**: Number of Flights
- **distance**: Distance between airports (miles)
- **carrier_delay**: Carrier Delay, in Minutes
- **weather_delay**: Weather Delay, in Minutes
- **nas_delay**: National Air System Delay, in Minutes
- **security_delay**: Security Delay, in Minutes
- **late_aircraft_delay**: Late Aircraft Delay, in Minutes
- **first_dep_time**: First Gate Departure Time at Origin Airport
- **total_add_gtime**: Total Ground Time Away from Gate for Gate Return or Cancelled Flight
- **longest_add_gtime**: Longest Time Away from Gate for Gate Return or Cancelled Flight


### Table **passengers**

Variables:

- **departures_scheduled**: Departures Scheduled
- **departures_performed**: Departures Performed
- **payload**: Available Payload (pounds)
- **seats**: Available Seats
- **passengers**: Non-Stop Segment Passengers Transported
- **freight**: Non-Stop Segment Freight Transported (pounds)
- **mail**: Non-Stop Segment Mail Transported (pounds)
- **distance**: Distance between airports (miles)
- **ramp_to_ramp**: Ramp to Ramp Time (minutes)
- **air_time**: Airborne Time (minutes)
- **unique_carrier**: Unique Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
- **airline_id**: An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation.
- **unique_carrier_name**: Unique Carrier Name. When the same name has been used by multiple carriers, a numeric suffix is used for earlier users, for example, Air Caribbean, Air Caribbean (1).
- **region**: Carrier's Operation Region. Carriers Report Data by Operation Region
- **carrier**: Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.
- **carrier_name**: Carrier Name
- **carrier_group**: Carrier Group Code
- **carrier_group_new**: Carrier Group New
- **origin_airport_id**: Origin Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
- **origin_city_market_id**: Origin Airport, City Market ID. City Market ID is an identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.	
- **origin**: Origin Airport
- **origin_city_name**: Origin City
- **origin_country**: Origin Country Code
- **origin_country_name**: Origin Country
- **dest_airport_id**: Destination Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
- **dest_city_market_id**: Destination Airport, City Market ID. City Market ID is an identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.
- **dest**: Destination Airport
- **dest_city_name**: Destination City
- **dest_country**: Destination Country Code
- **dest_country_name**: Destination Country
- **aircraft_group**: Aircraft Group
- **aircraft_type**: Aircraft Type
- **aircraft_config**: Aircraft Configuration
- **month**: Month
- **year**: Year
- **distance_group**: Distance Intervals, every 500 Miles, for Flight Segment
- **class**: Service Class


### Table **fuel_comsumption**

Variables:

- **month**: Month
- **airline_id**: An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation.
- **unique_carrier**: Unique Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
- **carrier**: Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.
- **carrier_name**: Carrier Name
- **carrier_group_new**: Carrier Group New
- **sdomt_gallons**: Total Scheduled Domestic, Fuel Consumption (Gallons)
- **satl_gallons**: Scheduled Service International Atlantic - Fuel Consumption (Gallons)
- **spac_gallons**: Scheduled Service International Pacific - Fuel Consumption (Gallons)
- **slat_gallons**: Scheduled Service International Latin America - Fuel Consumption (Gallons)
- **sint_gallons**: Scheduled Service International Subtotal - Fuel Consumption (Gallons)
- **ts_gallons**: Total Scheduled Service - Fuel Consumption (Gallons)
- **tdomt_gallons**: Total Domestic - Fuel Consumption (Gallons)
- **tint_gallons**: Total International - Fuel Consumption (Gallons)
- **total_gallons**: Grand Total - Fuel Consumption (Gallons)
- **sdomt_cost**: Total Scheduled Domestic, Fuel Cost (Dollars)
- **satl_cost**: Scheduled Service International Atlantic - Fuel Cost (Dollars)
- **spac_cost**: Scheduled Service International Pacific - Fuel Cost (Dollars)
- **slat_cost**: Scheduled Service International Latin America - Fuel Cost (Dollars)
- **sint_cost**: Scheduled Service International Subtotal - Fuel Cost (Dollars)
- **ts_cost**: Total Scheduled Service - Fuel Cost (Dollars)
- **tdomt_cost**: Total Domestic - Fuel Cost (Dollars)
- **tint_cost**: Total International - Fuel Cost (Dollars)
- **total_cost**: Grand Total - Fuel Cost (Dollars)
- **year**: year


### Table **flights_test**

This table consists of subset of columns from table flights. It represents flights from January 2020 which will be used for evaluation. Therefore, we are missing some features that we are not suppossed to know before the flight lands.

Variables:

- **fl_date**: Flight Date (yyyy-mm-dd)
- **mkt_unique_carrier**: Unique Marketing Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
- **branded_code_share**: Reporting Carrier Operated or Branded Code Share Partners
- **mkt_carrier**: Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.
- **mkt_carrier_fl_num**: Flight Number
- **op_unique_carrier**: Unique Scheduled Operating Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users,for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
- **tail_num**: Tail Number
- **op_carrier_fl_num**: Flight Number
- **origin_airport_id**: Origin Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
- **origin**: Origin Airport
- **origin_city_name**: Origin Airport, City Name
- **dest_airport_id**: Destination Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
- **dest**: Destination Airport
- **dest_city_name**: Destination Airport, City Name
- **crs_dep_time**: CRS Departure Time (local time: hhmm)
- **crs_arr_time**: CRS Arrival Time (local time: hhmm)
- **dup**: Duplicate flag marked Y if the flight is swapped based on Form-3A data
- **crs_elapsed_time**: CRS Elapsed Time of Flight, in Minutes
- **flights**: Number of Flights
- **distance**: Distance between airports (miles)
