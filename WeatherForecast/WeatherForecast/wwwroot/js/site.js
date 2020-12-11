// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

feather.replace()
var url = "";

function getParameters(link, departure) {
    var button = 1;

    if (departure) {
        button = 1;
    } else {
        button = 2;
    }

    let url = link;
    fetch(url).then(response => response.text())
        .then(data => {
            let parse = new DOMParser();
            let xml = parse.parseFromString(data, "application/xml");

            var x2js = new X2JS();
            jsstring = x2js.xml2json(xml);

            $.post('https://localhost:44374/api/WeatherForecastSimple', jsstring);

            document.getElementById('dewPoint' + button).textContent = jsstring.weatherdata.product.time[0].location.dewpointTemperature._value + '°C';
            document.getElementById('humidity' + button).textContent = jsstring.weatherdata.product.time[0].location.humidity._value + '%';
            document.getElementById('temperature' + button).textContent = jsstring.weatherdata.product.time[0].location.temperature._value + '°C';
            document.getElementById('fog' + button).textContent = jsstring.weatherdata.product.time[0].location.fog._percent + '%';
            document.getElementById('highClouds' + button).textContent = jsstring.weatherdata.product.time[0].location.highClouds._percent + '%';
            document.getElementById('middleClouds' + button).textContent = jsstring.weatherdata.product.time[0].location.mediumClouds._percent + '%';
            document.getElementById('lowClouds' + button).textContent = jsstring.weatherdata.product.time[0].location.lowClouds._percent + '%';

            if (jsstring.weatherdata.product.time[0].location.fog._percent > 50) {
                document.getElementById("fogIcon" + button).style.opacity = 0;

            } else {
                document.getElementById("fogIcon" + button).style.opacity = 1;
            }

            if (jsstring.weatherdata.product.time[0].location.highClouds._percent > 50) {
                document.getElementById("highCloudsIcon" + button).style.opacity = 1;

            } else if (jsstring.weatherdata.product.time[0].location.highClouds._percent <= 50 && jsstring.weatherdata.product.time[0].location.highClouds._percent > 20) {
                document.getElementById("highCloudsIcon" + button).style.opacity = 0.4;
            } else {
                document.getElementById("highCloudsIcon" + button).style.opacity = 0.01;
            }

            if (jsstring.weatherdata.product.time[0].location.mediumClouds._percent > 50) {
                document.getElementById("middleCloudsIcon" + button).style.opacity = 1;

            } else if (jsstring.weatherdata.product.time[0].location.mediumClouds._percent <= 50 && jsstring.weatherdata.product.time[0].location.mediumClouds._percent > 20) {
                document.getElementById("middleCloudsIcon" + button).style.opacity = 0.4;
            } else {
                document.getElementById("middleCloudsIcon" + button).style.opacity = 0;
            }

            if (jsstring.weatherdata.product.time[0].location.lowClouds._percent > 50) {
                document.getElementById("lowCloudsIcon" + button).style.opacity = 1;

            } else if (jsstring.weatherdata.product.time[0].location.lowClouds._percent <= 50 && jsstring.weatherdata.product.time[0].location.lowClouds._percent > 20) {
                document.getElementById("lowCloudsIcon" + button).style.opacity = 0.4   ;
            } else {
                document.getElementById("lowCloudsIcon"+button).style.opacity = 0;
            }
        })
};

/* https://api.opencagedata.com/geocode/v1/json?q=%27Nesto%27&key=18465d5c0ec5408fb6083f9b16bd61e6 */

function getGPS(departure) {    
    console.log('Departure:' + departure);
    let url = ""

    var lat;
    var lon;
    var link;
    
    if (departure) {
        var myInput = document.getElementById('departureID');
        if (myInput && myInput.value) {
            if ((myInput.value[0] >= 'a' && myInput.value[0] <= 'z') || (myInput.value[0] >= 'A' && myInput.value[0] <= 'Z')) {
                url = 'https://api.opencagedata.com/geocode/v1/json?q=' + myInput.value + '&key=18465d5c0ec5408fb6083f9b16bd61e6';
                fetch(url).then(response => response.text()).then(data => {
                    var jsonData = JSON.parse(data);
                    console.log(jsonData);
                    console.log(jsonData.total_results);
                    if (jsonData.total_results == 0) {
                        alert("GPS Location not found!"); 
                    } else {
                        lat = jsonData.results[0].geometry.lat;
                        lon = jsonData.results[0].geometry.lng;
                        link = 'https://api.met.no/weatherapi/locationforecast/1.9/?lat=' +
                            lat + '&lon=' + lon;
                        console.log(link);
                        getParameters(link, departure);
                    }
                })
            } else {
                lat = myInput.value.split(',')[0];
                lon = myInput.value.split(',')[1];

                    link = 'https://api.met.no/weatherapi/locationforecast/1.9/?lat=' +
                        lat + '&lon=' + lon;
                console.log(link);
                getParameters(link, departure);
            }
        } else {
            alert("No DEPARTURE value!");
        }
    } else {

        var myInput = document.getElementById('destinationID');
        if (myInput && myInput.value) {
            if ((myInput.value[0] >= 'a' && myInput.value[0] <= 'z') || (myInput.value[0] >= 'A' && myInput.value[0] <= 'Z')) {
                url = 'https://api.opencagedata.com/geocode/v1/json?q=' + myInput.value + '&key=18465d5c0ec5408fb6083f9b16bd61e6';
                fetch(url).then(response => response.text()).then(data => {
                    var jsonData = JSON.parse(data);
                    console.log(jsonData);
                    console.log(jsonData.total_results);
                    if (jsonData.total_results == 0) {
                        alert("GPS Location not found!");
                    } else {
                        lat = jsonData.results[0].geometry.lat;
                        lon = jsonData.results[0].geometry.lng;
                        link = 'https://api.met.no/weatherapi/locationforecast/1.9/?lat=' +
                            lat + '&lon=' + lon;
                        console.log(link);
                        getParameters(link, departure);
                    }
                })
            } else {
                lat = myInput.value.split(',')[0];
                lon = myInput.value.split(',')[1];

                link = 'https://api.met.no/weatherapi/locationforecast/1.9/?lat=' +
                    lat + '&lon=' + lon;
                console.log(link);
                getParameters(link, departure);
            }
        } else {
            alert("No DESTINATION value!");
        }

        url = 'https://api.opencagedata.com/geocode/v1/json?q=' + document.getElementById('destinationID').value + '&key=18465d5c0ec5408fb6083f9b16bd61e6'; /*document.getElementById('destinationID')*/
        var myInput = document.getElementById('destinationID');
        if (myInput && myInput.value) {

            url = 'https://api.opencagedata.com/geocode/v1/json?q=' + document.getElementById('destinationID').value + '&key=18465d5c0ec5408fb6083f9b16bd61e6';
        } else {
            alert("No DESTINATION value!");
        }
    }
    
};