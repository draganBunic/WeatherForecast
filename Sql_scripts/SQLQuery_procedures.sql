-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE insert_weatherforecast  
	@varAltitude decimal(8,5),
	@varLatitude decimal(8,5),
	@varLongitude decimal(8,5),
	@varWindFromDirection decimal(6,2),
	@varWindSpeed decimal(5,2),
	@varWindSpeedOfGust decimal(5,2),
	@varFogAreaFraction decimal(5,2),
	@varDewPointTemperature decimal(5,2),
	@varRelativeHumidity decimal(5,2),
	@varTimeFrom datetime2,
	@varTimeTo datetime2,
	@varLowClouds decimal(6,3),
	@varMediumClouds decimal(6,3),
	@varHighClouds decimal(6,3),
	@varAirTemperature decimal(6,3),
	@varAirTemperatureMin decimal(6,3),
	@varAirTemperatureMax decimal(6,3),
	@varAirPressure decimal(8,3),
	@varPrecipitationAmount decimal(5,2),
	@varPrecipitationAmountMin decimal(5,2),
	@varPrecipitationAmountMax decimal(5,2),
	@varProbabilityOfPrecipitation decimal(5,2),
	@varSymbol nvarchar(20)

AS   
	BEGIN  
		DECLARE @idLocation AS INT
		DECLARE @idWind AS INT
		DECLARE @idFog AS INT
		DECLARE @idDewPT AS INT
		DECLARE @idRelativeHumidity AS INT
		DECLARE @idWeatherForecast AS INT

		BEGIN TRAN
		insert into dbo.location(altitude,latitude,longitude) values(@varAltitude,@varLatitude,@varLongitude);
		set @idLocation = SCOPE_IDENTITY();
		insert into dbo.wind(wind_from_direction,wind_from_direction_unit,wind_speed,wind_speed_unit,wind_speed_of_gust,wind_speed_of_gust_unit) values(@varWindFromDirection,'degrees',@varWindSpeed,'m/s',@varWindSpeedOfGust,'m/s');
		set @idWind = SCOPE_IDENTITY();
		insert into dbo.fog(fog_area_fraction,fog_area_fraction_unit) values(@varFogAreaFraction,'%');
		set @idFog = SCOPE_IDENTITY();
		insert into dbo.dewpointtemperature(dew_point_temperature,dew_point_temperature_unit) values(@varDewPointTemperature,'celsius');
		set @idDewPT = SCOPE_IDENTITY();
		insert into dbo.humidity(relative_humidity,relative_humidity_unit) values(@varRelativeHumidity,'%');
		set @idRelativeHumidity = SCOPE_IDENTITY();
		insert into dbo.weatherforecast(time_from,time_to, id_location,id_fog,id_wind,id_humidity,id_dew_point_temperature) values(@varTimeFrom,@varTimeTo,@idLocation,@idFog,@idWind,@idRelativeHumidity,@idDewPT);
		set @idWeatherForecast = SCOPE_IDENTITY();

		insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(@varLowClouds,1,@idWeatherForecast,'%');
		insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(@varMediumClouds,2,@idWeatherForecast,'%');
		insert into dbo.clouds(value,id_cloudType,id_weather_forecast,value_unit) values(@varHighClouds,3,@idWeatherForecast,'%');
	
		insert into dbo.air(air_temperature_max,air_temperature_min,air_temperature,air_temperature_unit,air_pressure_at_sea_level,air_pressure_at_sea_level_unit,id_weather_forecast) values(@varAirTemperatureMax,@varAirTemperatureMin,@varAirTemperature,'celsius',@varAirPressure,'hPa',@idWeatherForecast);

		insert into dbo.precipitation(precipitation_amount,precipitation_amount_min,precipitation_amount_max,probability_of_precipitation,precipitation_unit,probability_of_precipitation_unit,symbol_code,id_weather_forecast) values(@varPrecipitationAmount,@varPrecipitationAmountMin,@varPrecipitationAmountMax,@varProbabilityOfPrecipitation,'mm','%',@varSymbol,@idWeatherForecast);
		commit TRAN;
	END
GO  
					