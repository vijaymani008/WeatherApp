part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
abstract class WeatherActionState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherData;

  WeatherLoadedState(this.weatherData);
}
class WeatherLoadingFailureState extends WeatherState{
  final String error;

  WeatherLoadingFailureState(this.error);
}
