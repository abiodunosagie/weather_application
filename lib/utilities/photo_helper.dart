// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

Widget getWeatherImage(
    {required String weatherDescription,
    required double width,
    required double height}) {
  switch (weatherDescription) {
    case 'Clear':
      {
        return Container(
          child: Image.asset(
            'images/sun.png',
            width: width,
            height: height,
          ),
        );
      }
    case 'Clouds':
      {
        return Container(
            child: Image.asset(
          'images/clouds.png',
          width: width,
          height: height,
        ));
      }
    case 'Rain':
      {
        return Container(
            child: Image.asset(
          'images/Mooncloudmidrain.png',
          width: width,
          height: height,
        ));
      }
    case 'Wind':
      {
        return Container(
            child: Image.asset(
          'images/Mooncloudfastwind.png',
          width: width,
          height: height,
        ));
      }
    case 'Snow':
      {
        return Container(
            child: Image.asset(
          'images/snow.png',
          width: width,
          height: height,
        ));
      }
    default:
      {
        return Container(
            child: Image.asset(
          'images/Suncloudmidrain.png',
          width: width,
          height: height,
        ));
      }
  }
}
