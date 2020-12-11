create view SimpleForecast as 
	select latitude, longitude, time_from, time_to, CloudType.type, Clouds.value,  air_temperature, dew_point_temperature, fog_area_fraction, relative_humidity
		from dbo.clouds right join dbo.cloudtype on Clouds.id_cloudType=CloudType.id
			left join dbo.weatherforecast on Clouds.id_weather_forecast=WeatherForecast.id
				left join dbo.air on Air.id_weather_forecast=WeatherForecast.id
					left join dbo.precipitation on Precipitation.id_weather_forecast=WeatherForecast.id
			right join dbo.location on Location.id=Weatherforecast.id_location
				left join dbo.dewpointtemperature on DewPointTemperature.id=WeatherForecast.id_dew_point_temperature
					left join dbo.fog on Fog.id=WeatherForecast.id_fog
						left join dbo.wind on Wind.id=WeatherForecast.id_wind
							left join dbo.humidity on Humidity.id=WeatherForecast.id_humidity


