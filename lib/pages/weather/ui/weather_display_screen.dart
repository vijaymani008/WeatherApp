import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/pages/weather/bloc/weather_bloc.dart';

class WeatherDisplayScreen extends StatefulWidget {
  final String location;
  const WeatherDisplayScreen({required this.location, super.key});

  @override
  State<WeatherDisplayScreen> createState() => _WeatherDisplayScreenState();
}

class _WeatherDisplayScreenState extends State<WeatherDisplayScreen> {
  final WeatherBloc weatherBloc = WeatherBloc();
  @override
  void initState() {
    super.initState();
    print("location : " + widget.location.toString());
    weatherBloc.add(FetchWeatherEvent(widget.location));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: Text("Weather Display Screen"),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        listenWhen: (previous, current) => current is WeatherActionState,
        buildWhen: (previous, current) => current is! WeatherActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WeatherLoadingState:
              return Center(child: const CircularProgressIndicator());
            case WeatherLoadedState:
              final successState = state as WeatherLoadedState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CityName          : " + successState.weatherData.name.toString()),
                    Text("Weather Condition : " + successState.weatherData.weather![0].description.toString()),
                    Text("Min Temperature   : " + successState.weatherData.main!.tempMin.toString()),
                    Text("Max Temperature   : " + successState.weatherData.main!.tempMax.toString()),
                    Text("Humidity          : "+successState.weatherData.main!.humidity.toString())
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
