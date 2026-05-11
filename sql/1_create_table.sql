CREATE TABLE trips (
    ride_id VARCHAR(50) PRIMARY KEY,
    rideable_type VARCHAR(20),
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR(150),
    start_station_id VARCHAR(50),
    end_station_name VARCHAR(150),
    end_station_id VARCHAR(50),
    start_lat DOUBLE PRECISION,
    end_lat DOUBLE PRECISION,
    start_lng DOUBLE PRECISION,
    end_lng DOUBLE PRECISION,
    member_casual VARCHAR(10)
);