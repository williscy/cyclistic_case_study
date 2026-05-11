-- Summary by day 
CREATE TABLE summary_by_day AS
SELECT
    member_casual,
    TRIM(day_of_week) AS day_of_week,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_mins), 2) AS avg_ride_mins,
    CASE TRIM(day_of_week)
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END AS day_order
FROM trips_clean
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_order;



-- Summary by month
CREATE TABLE summary_by_month AS
SELECT
    member_casual,
    TRIM(month) AS month,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_mins), 2) AS avg_ride_mins,
    CASE TRIM(month)
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END AS month_order
FROM trips_clean
GROUP BY member_casual, month
ORDER BY member_casual, month_order;

 

-- Summary by hour
CREATE TABLE summary_by_hour AS
SELECT
    member_casual,
    start_hour,
    COUNT(*) AS total_rides
FROM trips_clean
GROUP BY member_casual, start_hour;
 

-- Summary by bike type
CREATE TABLE summary_by_bike AS
SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_mins), 2) AS avg_ride_mins
FROM trips_clean
GROUP BY member_casual, rideable_type;
