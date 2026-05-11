SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_mins), 2) AS avg_mins
FROM trips_clean
GROUP BY member_casual, rideable_type
ORDER BY 
    member_casual, 
    total_rides DESC;