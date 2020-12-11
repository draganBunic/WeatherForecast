insert into dbo.cloudtype(type) values('low');
insert into dbo.cloudtype(type) values('medium');
insert into dbo.cloudtype(type) values('high');

insert into dbo.location(altitude,latitude,longitude) values(300,51,20);
insert into dbo.wind(wind_from_direction,wind_from_direction_unit,wind_speed,wind_speed_unit,wind_speed_of_gust,wind_speed_of_gust_unit) values(120,'degrees',2.5,'m/s',7.6,'m/s');
insert into dbo.wind(wind_from_direction,wind_from_direction_unit,wind_speed,wind_speed_unit,wind_speed_of_gust,wind_speed_of_gust_unit) values(163,'degrees',6.5,'m/s',4.7,'m/s');
insert into dbo.fog(fog_area_fraction,fog_area_fraction_unit) values(41.4,'%');
insert into dbo.fog(fog_area_fraction,fog_area_fraction_unit) values(4.2,'%');
insert into dbo.dewpointtemperature(dew_point_temperature,dew_point_temperature_unit) values(12.5,'celsius');
insert into dbo.dewpointtemperature(dew_point_temperature,dew_point_temperature_unit) values(5.5,'celsius');
insert into dbo.humidity(relative_humidity,relative_humidity_unit) values(25.1,'%');
insert into dbo.humidity(relative_humidity,relative_humidity_unit) values(37.2,'%');
insert into dbo.weatherforecast(time_from,time_to, id_location,id_fog,id_wind,id_humidity,id_dew_point_temperature) values('2020-12-11T15:00:00Z','2020-12-11T15:00:00Z',1,1,1,1,1);
insert into dbo.weatherforecast(time_from,time_to, id_location,id_fog,id_wind,id_humidity,id_dew_point_temperature) values('2020-12-11T15:00:00Z','2020-12-11T16:00:00Z',1,2,2,2,2);

insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(58.0,1,1,'%');
insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(23.0,2,1,'%');
insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(85.0,3,1,'%');
insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(38.0,1,2,'%');
insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(43.0,2,2,'%');
insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(75.0,3,2,'%');

insert into dbo.air(air_temperature_max,air_temperature_min,air_temperature,air_temperature_unit,air_pressure_at_sea_level,air_pressure_at_sea_level_unit,id_weather_forecast) values(35,24.4,27.4,'celsius',1020.5,'hPa',1);
insert into dbo.air(air_temperature_max,air_temperature_min,air_temperature,air_temperature_unit,air_pressure_at_sea_level,air_pressure_at_sea_level_unit,id_weather_forecast) values(25,11.2,21.5,'celsius',1008.5,'hPa',2);

insert into dbo.precipitation(precipitation_amount,precipitation_amount_min,precipitation_amount_max,probability_of_precipitation,precipitation_unit,probability_of_precipitation_unit,symbol_code,id_weather_forecast) values(4.2,6.2,1.7,31.2,'mm','%','partlycloudy_day',1);
insert into dbo.precipitation(precipitation_amount,precipitation_amount_min,precipitation_amount_max,probability_of_precipitation,precipitation_unit,probability_of_precipitation_unit,symbol_code,id_weather_forecast) values(3.2,5.2,2.7,21.6,'mm','%','partlycloudy_day',2);