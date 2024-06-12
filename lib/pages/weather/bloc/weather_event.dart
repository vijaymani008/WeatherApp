part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent{
  final String location;

  FetchWeatherEvent(this.location);
}
