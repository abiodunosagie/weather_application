// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/weather_forcast_model.dart';
import 'daily_forcast_card.dart';

class DailyForcastView extends StatelessWidget {
  final AsyncSnapshot<WeatherForcastModel> snapshot;
  const DailyForcastView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forcastList = snapshot.data!.list;
    var cityName = snapshot.data!.city;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(118, 255, 255, 255),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 74, 42, 155),
              Color.fromARGB(255, 33, 24, 88),
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
                '${cityName!.name} Daily Forcast',
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
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                  itemCount: forcastList!.length,
                  itemBuilder: (context, index) {
                    return dailyForcastCard(snapshot, index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
