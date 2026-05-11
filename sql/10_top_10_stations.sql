-- For memeber:
SELECT
    start_station_name,
    COUNT(*) AS total_rides
FROM trips_clean
WHERE member_casual = 'member'
    AND start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;

-- For casual:
SELECT
    start_station_name,
    COUNT(*) AS total_rides
FROM trips_clean
WHERE member_casual = 'casual'
    AND start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;