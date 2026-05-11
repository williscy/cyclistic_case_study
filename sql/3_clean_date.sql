SELECT COUNT(*) AS total_rows
FROM trips;
-- 5552994

SELECT member_casual, COUNT(*) AS count
FROM trips
GROUP BY member_casual;
-- casual: 1999497, member: 3553497

SELECT rideable_type, COUNT(*) AS count
FROM trips
GROUP BY rideable_type;
-- classic: 1948041, electric: 3604953


-- Check for duplicates
SELECT COUNT(*) AS duplicate_ride_ids
FROM (
    SELECT ride_id
    FROM trips
    GROUP BY ride_id
    HAVING COUNT(*) > 1
) AS dupes;
-- 0

-- Check for NULL
SELECT
    COUNT(*) FILTER (WHERE ride_id IS NULL) AS null_ride_id,
    COUNT(*) FILTER (WHERE started_at IS NULL) AS null_started_at,
    COUNT(*) FILTER (WHERE ended_at IS NULL) AS null_ended_at,
    COUNT(*) FILTER (WHERE member_casual IS NULL) AS null_member_casual,
    COUNT(*) FILTER (WHERE start_station_name IS NULL) AS null_start_station_name,
    COUNT(*) FILTER (WHERE end_station_name IS NULL) AS null_end_station_name
FROM trips;
-- 0, 0, 0, 0, 1184673, 1243305


-- Check for bad ride
SELECT 
    COUNT(*) FILTER (WHERE ended_at <= started_at) AS zero_or_negative,
    COUNT(*) FILTER (
        WHERE EXTRACT(EPOCH FROM (ended_at - started_at)) < 60) AS under_1_mins,
    COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '24 hours') AS over_24_hours 
FROM trips;
-- 29, 147401, 5585


-- Create a clean table
DROP TABLE IF EXISTS trips_clean;

CREATE TABLE trips_clean AS
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
    ROUND(EXTRACT(EPOCH FROM (ended_at - started_at)) / 60.0, 2) AS ride_length_mins,
    TO_CHAR(started_at, 'Day') AS day_of_week,
    EXTRACT(HOUR FROM started_at) AS start_hour,
    TO_CHAR(started_at, 'Month') AS month
FROM trips
WHERE
    ended_at > started_at
    AND EXTRACT(EPOCH FROM (ended_at - started_at)) >= 60
    AND ended_at - started_at <= INTERVAL '24 hours';



SELECT COUNT(*) AS clean_rows 
FROM trips_clean;
-- 5400008


SELECT 
    MIN(ride_length_mins) AS min_mins,
    MAX(ride_length_mins) AS max_mins,
    ROUND(AVG(ride_length_mins), 2) AS avg_mins
FROM trips_clean;
-- 1.00, 1439.98, 14.92


SELECT 
    member_casual, 
    COUNT(*) AS count
FROM trips_clean
GROUP BY member_casual;
-- casual: 1915806, 3484202