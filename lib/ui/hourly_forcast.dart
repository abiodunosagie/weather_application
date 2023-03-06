// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/weather_forcast_model.dart';
import 'hourly_forcast_card.dart';

class HourlyForcast extends StatelessWidget {
    HourlyForcast({super.key, required this.snapshot});
  AsyncSnapshot<WeatherForcastModel> snapshot;

  @override
  Widget build(BuildContext context) {
    var forcastList = snapshot.data!.list;
  var cityName = snapshot.data!.city;
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(118, 255, 255, 255),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 67, 38, 138),
            Color.fromARGB(255, 30, 23, 70),
          ],
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${cityName!.name} Hourly Forcast',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
          const Divider(
            // thickness: 1,
            color: Colors.white,
            height: 1.3,
          ),
          Expanded(
            flex: 1,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                itemCount: forcastList!.length,
                itemBuilder: (context, index) {
                  return hourlyForcastCard(snapshot, index);
                }),
          ),
        ],
      ),
    ),
  );
  }
}
