import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/pages/weather/bloc/weather_bloc.dart';
import 'package:weatherapp/pages/weather/ui/weather_display_screen.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController weatherController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
        appBar: AppBar(
          title: const Text("Location Selection"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: weatherController,

                decoration: const InputDecoration(
                    hintText: 'City',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherDisplayScreen(
                                  location: weatherController.text.toString(),
                                )));
                  },
                  child: Text("Get Weather Data"))
            ],
          ),
        ));
  }
}
