SELECT
    member_casual,
    TRIM(month) AS month,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_mins), 2) AS avg_mins
FROM trips_clean
GROUP BY member_casual, month
ORDER BY member_casual, 
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
    END;