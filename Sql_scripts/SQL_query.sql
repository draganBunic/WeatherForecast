
CREATE TABLE Air
(
	air_temperature_max   DECIMAL(6,3) NULL,
	air_temperature_min   DECIMAL(6,3) NULL,
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	air_temperature       DECIMAL(6,3) NULL,
	air_temperature_unit  CHAR(10) NULL,
	air_pressure_at_sea_level  DECIMAL(8,3) NULL,
	air_pressure_at_sea_level_unit  CHAR(10) NULL,
	id_weather_forecast   INTEGER NOT NULL
)
;


CREATE TABLE Clouds
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	value                 DECIMAL(6,3) NULL,
	id_cloudType          INTEGER NOT NULL,
	id_weather_forecast   INTEGER NOT NULL,
	value_unit            VARCHAR(20) NULL
)
;


CREATE TABLE CloudType
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	type                  VARCHAR(50) NULL
)
;


CREATE TABLE DewPointTemperature
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	dew_point_temperature  DECIMAL(5,2) NULL,
	dew_point_temperature_unit  VARCHAR(20) NULL
)
;


CREATE TABLE Fog
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fog_area_fraction     DECIMAL(5,2) NULL,
	fog_area_fraction_unit  VARCHAR(20) NULL
)
;


CREATE TABLE Humidity
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	relative_humidity     DECIMAL(5,2) NULL,
	relative_humidity_unit  VARCHAR(20) NULL
)
;


CREATE TABLE Location
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	altitude              decimal(8,5) NULL,
	latitude              DECIMAL(8,5) NULL,
	longitude             DECIMAL(8,5) NULL
)
;


CREATE TABLE Precipitation
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	precipitation_amount  DECIMAL(5,2) NULL,
	precipitation_amount_max  DECIMAL(5,2) NULL,
	precipitation_amount_min  DECIMAL(5,2) NULL,
	probability_of_precipitation  DECIMAL(5,2) NULL,
	precipitation_unit    CHAR(10) NULL,
	probability_of_precipitation_unit  CHAR(10) NULL,
	symbol_code           VARCHAR(20) NULL,
	id_weather_forecast   INTEGER NOT NULL
)
;


CREATE TABLE WeatherForecast
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	time_from             DATETIME2 NULL,
	time_to               DATETIME2 NULL,
	id_location           INTEGER NOT NULL,
	id_fog                INTEGER NOT NULL,
	id_wind               INTEGER NOT NULL,
	id_humidity           INTEGER NOT NULL,
	id_dew_point_temperature  INTEGER NOT NULL
)
;


CREATE TABLE Wind
(
	id                    INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	wind_from_direction   DECIMAL(6,2) NULL,
	wind_from_direction_unit  VARCHAR(20) NULL,
	wind_speed            DECIMAL(5,2) NULL,
	wind_speed_unit       VARCHAR(20) NULL,
	wind_speed_of_gust    DECIMAL(5,2) NULL,
	wind_speed_of_gust_unit  VARCHAR(20) NULL
)
;


ALTER TABLE Air
	ADD FOREIGN KEY (id_weather_forecast) REFERENCES WeatherForecast(id)
;



ALTER TABLE Clouds
	ADD FOREIGN KEY (id_cloudType) REFERENCES CloudType(id)
;


ALTER TABLE Clouds
	ADD FOREIGN KEY (id_weather_forecast) REFERENCES WeatherForecast(id)
;



ALTER TABLE Precipitation
	ADD FOREIGN KEY (id_weather_forecast) REFERENCES WeatherForecast(id)
;



ALTER TABLE WeatherForecast
	ADD FOREIGN KEY (id_location) REFERENCES Location(id)
;


ALTER TABLE WeatherForecast
	ADD FOREIGN KEY (id_fog) REFERENCES Fog(id)
;


ALTER TABLE WeatherForecast
	ADD FOREIGN KEY (id_wind) REFERENCES Wind(id)
;


ALTER TABLE WeatherForecast
	ADD FOREIGN KEY (id_humidity) REFERENCES Humidity(id)
;


ALTER TABLE WeatherForecast
	ADD FOREIGN KEY (id_dew_point_temperature) REFERENCES DewPointTemperature(id)
;