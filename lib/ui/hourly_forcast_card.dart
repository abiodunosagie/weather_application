import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/utilities/photo_helper.dart';

import '../model/weather_forcast_model.dart';
import '../utilities/forcast_util.dart';

Widget hourlyForcastCard(AsyncSnapshot<WeatherForcastModel> snapshot, index) {
  var forcastList = snapshot.data!.list;
  var dayOfWeek = '';
  DateTime actualDate = DateTime.fromMillisecondsSinceEpoch(
      forcastList![index].dt! * 1000 as int);
  var fulDate = Util.getFormattedTime(actualDate);
  //split the date to get the day.
  dayOfWeek = fulDate!.split(',')[0];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dayOfWeek,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500),
        ),
      ),
      getWeatherImage(
          width: 50,
          height: 50,
          weatherDescription: '${forcastList[index].weather![0].main}'),
      const SizedBox(
        height: 10,
      ),
      Text(
        '${forcastList[index].main!.temp!.toStringAsFixed(0)}°',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'H:${forcastList[index].main!.humidity!.toStringAsFixed(0)}%',
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
