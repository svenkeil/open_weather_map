import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/util/extensions.dart';
import '../../domain/usecases/get_weather_info_for_city.dart';

part 'open_weather_map_controller.g.dart';

@Injectable()
class OpenWeatherMapController = _OpenWeatherMapControllerBase
    with _$OpenWeatherMapController;

abstract class _OpenWeatherMapControllerBase with Store {
  final GetWeatherInfoForCity _usecase;

  _OpenWeatherMapControllerBase(GetWeatherInfoForCity usecase)
      : _usecase = usecase;

  @observable
  double currentTemperature;

  @observable
  String city;

  @observable
  String country;

  @observable
  String weatherDescription;

  @observable
  bool hasError = false;

  @computed
  bool get hasData =>
      currentTemperature != null &&
      city != null &&
      country != null &&
      weatherDescription != null;

  @action
  Future<void> getWeatherInfoForCity(String cityName) async {
    final result = await _usecase(Params(cityName: cityName));

    result.fold(
      (l) => hasError = true,
      (r) {
        country = r.country;
        city = r.cityName;
        currentTemperature = r.currentTemperature;
        weatherDescription = r.weatherDescription.capitalize();

        hasError = false;
      },
    );
  }
}
