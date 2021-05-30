abstract class OpenWeatherMapEvents {
  const OpenWeatherMapEvents();
}

class GetWeatherInfoForCityEvent implements OpenWeatherMapEvents {
  final String cityName;

  GetWeatherInfoForCityEvent({this.cityName});
}
