CREATE DATABASE airline_performance;
USE airline_performance;

CREATE TABLE airlines (
    airline_code VARCHAR(3) PRIMARY KEY,
    airline_name VARCHAR(150),
    country VARCHAR(100)
);

CREATE TABLE airports (
    airport_code VARCHAR(3) PRIMARY KEY,
    airport_name VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(100),
    latitude DOUBLE,
    longitude DOUBLE,
    timezone VARCHAR(50)
);

CREATE TABLE calendar (
    date_key DATE PRIMARY KEY,
    year SMALLINT NOT NULL,
    quarter SMALLINT NOT NULL,
    month SMALLINT NOT NULL,
    day_of_month SMALLINT NOT NULL,
    day_of_week SMALLINT NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    is_weekend BOOLEAN NOT NULL
);

CREATE TABLE aircraft (
    tail_number VARCHAR(10) PRIMARY KEY,
    manufacturer VARCHAR(100),
    model VARCHAR(100),
    year_built SMALLINT
);

CREATE TABLE flights (
    flight_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    flight_date DATE NOT NULL,
    airline_code VARCHAR(3) NOT NULL,
    tail_number VARCHAR(10),
    flight_number VARCHAR(10),
    origin_code VARCHAR(3) NOT NULL,
    dest_code VARCHAR(3) NOT NULL,
    crs_dep_time SMALLINT,
    dep_time SMALLINT,
    dep_delay NUMERIC(7,2),
    dep_delay_minutes NUMERIC(7,2),
    dep_del15 SMALLINT,
    dep_time_blk VARCHAR(15),
    taxi_out NUMERIC(6,2),
    wheels_off SMALLINT,
    wheels_on SMALLINT,
    taxi_in NUMERIC(6,2),
    crs_arr_time SMALLINT,
    arr_time SMALLINT,
    arr_delay NUMERIC(7,2),
    arr_delay_minutes NUMERIC(7,2),
    arr_del15 SMALLINT,
    arr_time_blk VARCHAR(15),
    cancelled BOOLEAN NOT NULL DEFAULT FALSE,
    cancellation_code VARCHAR(5),
    diverted BOOLEAN NOT NULL DEFAULT FALSE,
    crs_elapsed_time NUMERIC(7,2),
    actual_elapsed_time NUMERIC(7,2),
    air_time NUMERIC(7,2),
    distance NUMERIC(7,2),
    distance_group SMALLINT,
    carrier_delay NUMERIC(7,2),
    weather_delay NUMERIC(7,2),
    nas_delay NUMERIC(7,2),
    security_delay NUMERIC(7,2),
    late_aircraft_delay NUMERIC(7,2),
    delay_category VARCHAR(20),
    FOREIGN KEY (flight_date) REFERENCES calendar(date_key),
    FOREIGN KEY (airline_code) REFERENCES airlines(airline_code),
    FOREIGN KEY (origin_code) REFERENCES airports(airport_code),
    FOREIGN KEY (dest_code) REFERENCES airports(airport_code)
);