import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/data/api_services.dart';
import 'package:weatherapp/data/remote_services.dart';
import 'package:weatherapp/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final RemoteService _apiService = ApiService();
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>(fetchWeatherEvent);
  }

  FutureOr<void> fetchWeatherEvent(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    try{
      emit(WeatherLoadingState());
      final response = await _apiService.getWeatherData(event.location);
      print("response : " + response.body);
      if(response.statusCode ==200){
        print("statecode First");
        WeatherModel weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
        print("statecode seconde : " +weatherModel.main!.humidity.toString());
        emit(WeatherLoadedState(weatherModel));
        print("statecode secondedd");
      }
    //   else if (response.statusCode == 404) {
    // final data = jsonDecode(response.body);
    // emit(WeatherLoadingFailureState(data['message']));
    // } else if (response.statusCode == 429) {
    // emit(WeatherLoadingFailureState('Limit crossed'));
    // } else {
    // emit(
    // WeatherLoadingFailureState('Unknown error ${response.statusCode}'));
    // }
    }
    catch(error){
      print("statecode thired");
      emit(WeatherLoadingFailureState('Unable to fetch weather data'));
      debugPrint("fetchingWeatherDataError : $error");
    }
  }
}
