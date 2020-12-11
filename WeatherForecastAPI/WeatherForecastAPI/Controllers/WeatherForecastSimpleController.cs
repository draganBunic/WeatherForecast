using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json.Linq;

namespace WeatherForecastAPI.Controllers
{
    public class WeatherForecastSimpleController : ApiController
    {
        // GET: WeatherForecastSimple

        private IMemoryCache memoryCache;

        public HttpResponseMessage Get(float lat, float lon)
        {
            
            DateTime thisDay = DateTime.Today;
            Console.WriteLine(thisDay.ToString("yyyymmdd"));
            string query = @" 
            select * from SimpleForecast where latitude = "+ lat + " and longitude = " + lon;
            
            DataTable table = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.
                ConnectionStrings["WForecastDB"].ConnectionString))
            using (var cmd = new SqlCommand(query, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.Text;
                table.TableName = "WeatherForecastSimple";
                da.Fill(table);
            }
            /*
            bool AlreadyExist = memoryCache.TryGetValue("CachedTime", out table);
            if (!AlreadyExist) {
                var cacheEntryOptions = new MemoryCacheEntryOptions().
                    SetSlidingExpiration(TimeSpan.FromSeconds(120));
                memoryCache.Set("CachedTime", table, cacheEntryOptions);
            } 
            */
            return Request.CreateResponse(HttpStatusCode.OK, table);
        }

        public string Post()
        {

            //JObject json = JObject.Parse(jsstring);
            //Console.WriteLine(json);
            string query = @" EXEC	[dbo].[insert_weatherforecast]
		@varAltitude = " + 1 + ", @varLatitude = " + 15 + ", @varLongitude = " + 55 + ", @varWindFromDirection = " + 125.4 + ", @varWindSpeed = " + 125.4 + ", @varWindSpeedOfGust = " + 125.4 + ", @varFogAreaFraction = " + 125.4 + ",@varDewPointTemperature = " + 24 + ",@varRelativeHumidity = " + 24 + ",@varTimeFrom = '" + "2020-12-11T19:00:00Z" + "',@varTimeTo = '" + "2020-12-11T19:00:00Z" + "',@varLowClouds = " + 24 + ",@varMediumClouds = " + 24 + ",@varHighClouds = " + 24 + ",@varAirTemperature = " + 24 + ",@varAirTemperatureMin = " + 24 + ",@varAirTemperatureMax = " + 24 + ",@varAirPressure = " + 1024 + ",@varPrecipitationAmount = " + 24 + ",@varPrecipitationAmountMin = " + 24 + ",@varPrecipitationAmountMax = " + 24 + ",@varProbabilityOfPrecipitation = " + 24 + ",@varSymbol = '" + "partlycloudy_day" + "'";


            DataTable table = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.
                ConnectionStrings["WForecastDB"].ConnectionString))
            using (var cmd = new SqlCommand(query, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.Text;
                table.TableName = "WeatherForecastSimple";
                da.Fill(table);
            }
            try { } 
            catch(Exception) 
            {
                throw;
            }

            return "Added Successfully!!";
        }
    }
}