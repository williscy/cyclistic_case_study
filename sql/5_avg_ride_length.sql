SELECT
    member_casual,
    ROUND(AVG(ride_length_mins), 2) AS avg_ride_mins,
    ROUND(MAX(ride_length_mins), 2) AS max_ride_mins,
    ROUND(MIN(ride_length_mins), 2) AS min_ride_mins
FROM trips_clean
GROUP BY member_casual
ORDER BY avg_ride_mins;