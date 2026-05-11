SELECT
    member_casual,
    start_hour,
    COUNT(*) AS total_rides
FROM trips_clean
GROUP BY member_casual, start_hour
ORDER BY 
    member_casual,
    start_hour;