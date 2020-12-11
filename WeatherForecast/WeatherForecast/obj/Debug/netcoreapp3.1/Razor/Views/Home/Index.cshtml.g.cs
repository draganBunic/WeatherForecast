#pragma checksum "C:\Users\VeZzE\Desktop\WeatherForecast\WeatherForecast\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "58a5a22fcf64f6cad94aef5950a85972db5537ab"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\VeZzE\Desktop\WeatherForecast\WeatherForecast\Views\_ViewImports.cshtml"
using WeatherForecast;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\VeZzE\Desktop\WeatherForecast\WeatherForecast\Views\_ViewImports.cshtml"
using WeatherForecast.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"58a5a22fcf64f6cad94aef5950a85972db5537ab", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"34073240c2e66dea0925c7fa3fda359c4c3320dc", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 1 "C:\Users\VeZzE\Desktop\WeatherForecast\WeatherForecast\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Weather Forecast";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<div class=""d-flex justify-content-center"">
    <div class=""info-side1"">
        <label class=""lab"">
            DEPARTURE
        </label>
        <div class=""row"">
            <div class=""location-container row"">
                <div class=""col-md-12 col-lg-6"">
                    <input type=""text"" id=""departureID"" placeholder=""Ex. 11.43,12.12"" class=""form-control"">
                </div>
                <div class=""col-md-12 col-lg-6"">
                    <button class=""location-button"" id=""button1"" onclick=""getGPS(true)"">
                        <i data-feather=""map-pin""></i>
                        <span>Check</span>
                    </button>
                </div>
            </div>
        </div>

        <div class=""today-info"">
            <div class=""dew-point"">
                <span class=""title"">Dew Point</span><span class=""value"" id=""dewPoint1""></span>
                <div class=""clear""></div>
            </div>
            <div class=""humidity"">
                <s");
            WriteLiteral(@"pan class=""title"">Humidity</span><span class=""value"" id=""humidity1""></span>
                <div class=""clear""></div>
            </div>
            <div class=""wind"">
                <span class=""title"">Temperature</span><span class=""value"" id=""temperature1""></span>
                <div class=""clear""></div>
            </div>
        </div>

        <!--<img class=""d-flex justify-content-center"" src=""~/lib/img/Cloud.png"" style=""opacity: 1; margin-top: 100px; width:50px; height:50px; "">-->
        <ul class=""week-list"">
            <li><div class=""day-temp""><span id=""fog1""><br /></span></div><span class=""day-name""> <br> Fog</span><i class=""day-icon"" id=""fogIcon1"" data-feather=""sun"" style=""opacity: 0; margin-top: 70px;""></i></li>
            <li><div class=""day-temp""><span id=""lowClouds1""><br /></span></div><span class=""day-name"">Low <br> Clouds</span><i class=""day-icon"" id=""lowCloudsIcon1"" data-feather=""cloud"" style=""opacity: 0; margin-top: 100px;""></i></li>
            <li><div class=""day-temp"">");
            WriteLiteral(@"<span id=""middleClouds1""><br /></span></div><span class=""day-name"">Medium <br> Clouds</span><i class=""day-icon"" id=""middleCloudsIcon1"" data-feather=""cloud"" style=""opacity: 0; margin-top: 70px;""></i></li>
            <li><div class=""day-temp""><span id=""highClouds1""><br /></span></div><span class=""day-name"">High <br> Clouds</span><i class=""day-icon"" id=""highCloudsIcon1"" data-feather=""cloud"" style=""opacity: 0; margin-top: 40px;""></i></li>
            <div class=""clear""></div>
        </ul>
    </div>
    <div class=""info-side2"">
        <span class=""lab"">DESTINATION</span>
        <div class=""row"">
            <div class=""location-container row"">
                <div class=""col-md-12 col-lg-6"">
                    <input type=""text"" id=""destinationID"" placeholder=""Ex. Banjaluka"" class=""form-control"">
                </div>
                <div class=""col-md-12 col-lg-6"">
                    <button class=""location-button"" id=""button2"" onclick=""getGPS(false)"">
                        <i data-feather");
            WriteLiteral(@"=""map-pin""></i>
                        <span>Check</span>
                    </button>
                </div>
            </div>
        </div>
        <div class=""today-info"">
            <div class=""dew-point"">
                <span class=""title"">Dew Point</span><span class=""value"" id=""dewPoint2""></span>
                <div class=""clear""></div>
            </div>
            <div class=""humidity"">
                <span class=""title"">Humidity</span><span class=""value"" id=""humidity2""></span>
                <div class=""clear""></div>
            </div>
            <div class=""wind"">
                <span class=""title"">Temperature</span><span class=""value"" id=""temperature2""></span>
                <div class=""clear""></div>
            </div>
        </div>
        <ul class=""week-list"">
            <li><div class=""day-temp""><span id=""fog2""><br /></span></div><span class=""day-name""> <br> Fog</span><i class=""day-icon"" id=""fogIcon2"" data-feather=""sun"" style=""opacity: 1; margin-top: 70px;""><");
            WriteLiteral(@"/i></li>
            <li><div class=""day-temp""><span id=""lowClouds2""><br /></span></div><span class=""day-name"">Low <br> Clouds</span><i class=""day-icon"" id=""lowCloudsIcon2"" data-feather=""cloud"" style=""opacity: 1; margin-top: 100px;""></i></li>
            <li><div class=""day-temp""><span id=""middleClouds2""><br /></span></div><span class=""day-name"">Medium <br> Clouds</span><i class=""day-icon"" id=""middleCloudsIcon2"" data-feather=""cloud"" style=""opacity: 1; margin-top: 70px;""></i></li>
            <li><div class=""day-temp""><span id=""highClouds2""><br /></span></div><span class=""day-name"">High <br> Clouds</span><i class=""day-icon"" id=""highCloudsIcon2"" data-feather=""cloud"" style=""opacity: 1; margin-top: 40px;""></i></li>
            <div class=""clear""></div>
        </ul>
    </div>
</div>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591