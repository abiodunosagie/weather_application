import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/model/weather_forcast_model.dart';
import 'package:weather_application/ui/daily_forcast.dart';
import 'package:weather_application/ui/hourly_forcast.dart';
import 'package:weather_application/ui/mid_view.dart';
import 'package:weather_application/utilities/constants.dart';

import 'network/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherForcastModel> forcastObject;
  late String _cityName = 'Lagos';

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    forcastObject = getWeather(_cityName);

    // forcastObject.then((weather) => print(weather.city?.name));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KbackgroundColor,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              textFieldView(),
              FutureBuilder<WeatherForcastModel>(
                  future: forcastObject,
                  builder:
                      (context, AsyncSnapshot<WeatherForcastModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          midView(snapshot),
                          HourlyForcast(snapshot: snapshot),
                          DailyForcastView(snapshot: snapshot),
                          Text(
                            'All Rights reserved | Abiodun Osagie ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          )),
    );
  }
//textfield
  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: 'Enter City Name',
          labelStyle: GoogleFonts.poppins(color: Colors.white),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(
            8,
          ),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forcastObject = getWeather(_cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForcastModel> getWeather(String cityName) =>
      Network().getWeatherForcast(cityName: _cityName);
}
