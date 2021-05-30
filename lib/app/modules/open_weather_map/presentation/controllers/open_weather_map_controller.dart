import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_weather_info_for_city.dart';
import '../events/open_weather_map_events.dart';
import '../states/open_weather_map_states.dart';

class OpenWeatherMapController extends Bloc<OpenWeatherMapEvents, OpenWeatherMapStates> {
  final GetWeatherInfoForCity usecase;

  OpenWeatherMapController(this.usecase) : super(IdleState());

  @override
  Stream<OpenWeatherMapStates> mapEventToState(OpenWeatherMapEvents event) async* {
    switch (event.runtimeType) {
      case GetWeatherInfoForCityEvent:
        yield* _mapGetWeatherInfoForCityToState(event);
        break;
      default:
        yield IdleState();
    }
  }

  Stream<OpenWeatherMapStates> _mapGetWeatherInfoForCityToState(GetWeatherInfoForCityEvent event) async* {
    yield FetchingDataState();

    final result = await usecase(Params(cityName: event.cityName));

    yield result.fold(
      (failure) => UnableToFetchDataState(),
      (success) => SuccessfullyLoadedDataState(weatherInformation: success),
    );
  }
}
