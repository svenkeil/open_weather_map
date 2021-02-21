// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_map_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $OpenWeatherMapController = BindInject(
  (i) => OpenWeatherMapController(i<GetWeatherInfoForCity>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OpenWeatherMapController on _OpenWeatherMapControllerBase, Store {
  Computed<bool> _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_OpenWeatherMapControllerBase.hasData'))
      .value;

  final _$currentTemperatureAtom =
      Atom(name: '_OpenWeatherMapControllerBase.currentTemperature');

  @override
  double get currentTemperature {
    _$currentTemperatureAtom.reportRead();
    return super.currentTemperature;
  }

  @override
  set currentTemperature(double value) {
    _$currentTemperatureAtom.reportWrite(value, super.currentTemperature, () {
      super.currentTemperature = value;
    });
  }

  final _$cityAtom = Atom(name: '_OpenWeatherMapControllerBase.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$countryAtom = Atom(name: '_OpenWeatherMapControllerBase.country');

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$weatherDescriptionAtom =
      Atom(name: '_OpenWeatherMapControllerBase.weatherDescription');

  @override
  String get weatherDescription {
    _$weatherDescriptionAtom.reportRead();
    return super.weatherDescription;
  }

  @override
  set weatherDescription(String value) {
    _$weatherDescriptionAtom.reportWrite(value, super.weatherDescription, () {
      super.weatherDescription = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_OpenWeatherMapControllerBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$getWeatherInfoForCityAsyncAction =
      AsyncAction('_OpenWeatherMapControllerBase.getWeatherInfoForCity');

  @override
  Future<void> getWeatherInfoForCity(String cityName) {
    return _$getWeatherInfoForCityAsyncAction
        .run(() => super.getWeatherInfoForCity(cityName));
  }

  @override
  String toString() {
    return '''
currentTemperature: ${currentTemperature},
city: ${city},
country: ${country},
weatherDescription: ${weatherDescription},
hasError: ${hasError},
hasData: ${hasData}
    ''';
  }
}
