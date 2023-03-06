// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

// ignore: duplicate_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/utilities/photo_helper.dart';

import '../model/weather_forcast_model.dart';

import '../utilities/forcast_util.dart';

Widget midView(AsyncSnapshot<WeatherForcastModel> snapshot) {
  //variables to access the data from the api payload
  var forcastList = snapshot.data!.list;
  var country = snapshot.data!.city!.country;
  var city = snapshot.data!.city!.name;
  // ignore: unused_local_variable
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forcastList![0].dt! * 1000 as int);

  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //City list
    Text(
      '$city, $country',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 25.0,
      ),
    ),
    //The weather degree here
    Text(
      '${forcastList[0].main!.temp!.toStringAsFixed(0)}°',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 90.0,
        fontWeight: FontWeight.w200,
      ),
    ),
    //weather description
    Text(
      '${forcastList[0].weather![0].description}',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
      ),
    ),
    //Weather high and low figures
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //high temperature
        Text('H:${forcastList[0].main!.tempMax!.toStringAsFixed(0)}°',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),

        SizedBox(
          width: 20,
        ),
        //Low temperature
        Text('L:${forcastList[0].main!.tempMin!.toStringAsFixed(0)}°',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
      ],
    ),
  ]);
}
