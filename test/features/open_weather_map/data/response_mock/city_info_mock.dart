// 20201117222347
// http://api.openweathermap.org/data/2.5/weather?q=Fortaleza&units=metric&appid={apiKey}

const cityInfoMock = {
  "coord": {"lon": -38.52, "lat": -3.72},
  "weather": [
    {"id": 803, "main": "Clouds", "description": "broken clouds", "icon": "04n"}
  ],
  "base": "stations",
  "main": {
    "temp": 27.66,
    "feels_like": 29.6,
    "temp_min": 27.22,
    "temp_max": 28,
    "pressure": 1010,
    "humidity": 78
  },
  "visibility": 10000,
  "wind": {"speed": 5.1, "deg": 70},
  "clouds": {"all": 75},
  "dt": 1605662358,
  "sys": {
    "type": 1,
    "id": 8363,
    "country": "BR",
    "sunrise": 1605600635,
    "sunset": 1605644878
  },
  "timezone": -10800,
  "id": 6320062,
  "name": "Fortaleza",
  "cod": 200
};
