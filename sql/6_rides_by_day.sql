SELECT
    member_casual,
    TRIM(day_of_week) as day_of_week,
    COUNT(*) AS total_rides,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage,
    ROUND(AVG(ride_length_mins), 2) AS avg_mins
FROM trips_clean
GROUP BY member_casual, day_of_week
ORDER BY member_casual,
    CASE TRIM(day_of_week)
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;