using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeatherForecastAPI.Models
{
    public class WeatherForecast
    {
        public float Latitude { get; set; }

        public float Longitude { get; set; }

        public string Time_from { get; set; }

        public string Time_to { get; set; }

        public string Type { get; set; }

        public string Value { get; set; }

        public float Air_temperature { get; set; }

        public float Dew_point_temperature { get; set; }

        public float Fog_area_fraction { get; set; }

        public float Relative_humidity { get; set; }

    }
}