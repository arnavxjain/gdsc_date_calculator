import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/date_week_extensions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final topPadding = MediaQuery.of(context).padding.top;

    final now = new DateTime.now();
    String formatter = DateFormat.yMMMd('en_US').format(now);

    // text field 1 (no. of days)
    dynamic noOfDays = TextEditingController();
    dynamic year = TextEditingController();

    const snackBar1 = SnackBar(
      content: Text(
          'No input values detected. Please enter a valid number',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              fontSize: 14
          )
      ),
      backgroundColor: Colors.redAccent,
    );

    const snackBar2 = SnackBar(
      content: Text(
          'Make sure the number of days is less than 366 & Year has 4 digits',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              fontSize: 14
          )
      ),
      backgroundColor: Colors.redAccent,
    );

    const gdscSnackbar = SnackBar(
      content: Text(
          'Google Developer Student Club 🐐❤️',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              fontSize: 14,
            color: Colors.black87
          )
      ),
      backgroundColor: Colors.greenAccent,
    );

    bool isLeapYear(int year) {
      if (year % 4 == 0) {
        if (year % 100 == 0) {
          return year % 400 == 0;
        } else {
          return true;
        }
      } else {
        return false;
      }
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      noOfDays.dispose();
      year.dispose();
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: topPadding, left: 20, right: 20),
            height: 126,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFDADADA))
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Date Calculator",
                  style: GoogleFonts.inter(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      fontSize: 20
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Image.asset("lib/assets/gdsc.png", width: 43),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(gdscSnackbar);
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: ShapeDecoration(
              color: const Color(0xFFDADADA),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 0.9,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Today's date →",
                  style: GoogleFonts.inter(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.81,
                      fontSize: 18
                  ),
                ),
                Text(formatter,
                  style: GoogleFonts.abel(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Find out the date of any day throughout any year, using the inputs provided below.",
              style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                  fontSize: 12
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 60),

          // Inputs start here

          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: ShapeDecoration(
              color: const Color(0xFFF1F1F1),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 0.9,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Number of days",
                  style: GoogleFonts.inter(
                      color: const Color(0xFF6D6D6D),
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                      fontSize: 18
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: TextField(
                    controller: noOfDays,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.abel(
                      color: const Color(0xFF6D6D6D),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
                    maxLength: 3,
                    decoration: InputDecoration(
                      hintText: "XXX",
                      counterText: "",
                      focusColor: Colors.transparent,
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.inter(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        // letterSpacing: 0,
                        // fontSize: 14
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: ShapeDecoration(
              color: const Color(0xFFF1F1F1),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 0.9,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Year",
                  style: GoogleFonts.inter(
                      color: const Color(0xFF6D6D6D),
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                      fontSize: 18
                  ),
                ),
                SizedBox(
                  width: 53,
                  height: 30,
                  child: TextField(
                    controller: year,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.abel(
                      color: const Color(0xFF6D6D6D),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
                    maxLength: 4,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "XXXX",
                      focusColor: Colors.transparent,
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.inter(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        // letterSpacing: 0,
                        // fontSize: 14
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (year.text == '' || noOfDays.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(snackBar1);
              } else {
                final dayCount = int.parse(noOfDays.text);
                final yearCount = int.parse(year.text);

                // print(dayCount);
                // print(yearCount);

                if (dayCount > 365 || yearCount <= 999 || dayCount < 1) {
                  print('OL');
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);

                  // print(yearCount);
                  // print(dayCount);
                } else {
                  print('verified');

                  int futureYear = yearCount;
                  int dayOfYear = dayCount;

                  DateTime startDate = DateTime(futureYear, 1, 1);

                  DateTime targetDate = startDate.add(Duration(days: dayOfYear - 1));

                  int firstDayOfWeek = startDate.weekday;
                  int adjustedDayOfYear = dayOfYear + (firstDayOfWeek - 1);
                  int weekOfYear = (adjustedDayOfYear / 7).ceil();

                  String formattedDate = DateFormat('dd/MM/yyyy').format(targetDate);

                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                          height: 315,
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFE6E6E6),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 12,
                                cornerSmoothing: 0.9,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("$dayCount days into $yearCount",
                                    style: GoogleFonts.inter(
                                        color: const Color(0xFF6D6D6D),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.6,
                                        fontSize: 19
                                    ),
                                  ),
                                  CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(CupertinoIcons.multiply_circle_fill, color: Colors.grey, size: 30)
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10, bottom: 19),
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("The date for this particular day is", textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      color: const Color(0xFF6D6D6D),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.6,
                                      fontSize: 18
                                  )
                              ),
                              Text(formattedDate.toString(), textAlign: TextAlign.left,
                                style: GoogleFonts.abel(
                                    color: const Color(0xFF6385FF),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 3,
                                    fontSize: 20
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text("The week of the year is", textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      color: const Color(0xFF6D6D6D),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.6,
                                      fontSize: 18
                                  )
                              ),
                              Text(weekOfYear.toString(), textAlign: TextAlign.left,
                                style: GoogleFonts.abel(
                                    color: const Color(0xFF6385FF),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 3,
                                    fontSize: 20
                                ),
                              ),
                              // {
                              const SizedBox(height: 14,),
                              isLeapYear(futureYear) ? Text("$futureYear will be a leap year.", textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                color: const Color(0xFF00855F),
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.6,
                                fontSize: 18
                              )) : Text("$futureYear will not be a leap year.", textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: const Color(0xFF00855F),
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.6,
                                fontSize: 20
                            )
                            // ),
                              ),
                              // }
                            ],
                          ),
                        );
                      }
                  );

                }
              }
            },
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                color: const Color(0xFF6385FF),
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 12,
                    cornerSmoothing: 0.9,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Calculate",
                    style: GoogleFonts.inter(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                        fontSize: 18
                    ),
                  ),
                  const Icon(CupertinoIcons.chevron_right_circle, size: 25, color: Colors.white, weight: 0.8,)
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          CupertinoButton(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 12,
                      cornerSmoothing: 0.9,
                    ),
                  ),
                  color: const Color(0xFFF1F1F1)
                ),
                child: Text("About this App",
                  style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.6,
                      fontSize: 15
                  ),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE6E6E6),
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 12,
                              cornerSmoothing: 0.9,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("About this App",
                                  style: GoogleFonts.inter(
                                      color: const Color(0xFF6D6D6D),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.6,
                                      fontSize: 19
                                  ),
                                ),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(CupertinoIcons.multiply_circle_fill, color: Colors.grey, size: 30)
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text("This app was created as a task for the Google Developer Student Club, by student Arnav Jain. It uses Flutter to run the app, and makes use of multiple libraries for enhancement.", textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    color: const Color(0xFF00855F),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.6,
                                    fontSize: 15
                                )
                              // ),
                            ),
                          ],
                        )
                      );
                    }
                );

              },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
            child: Text("App developed and managed by Arnav Jain",
              style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                  fontSize: 13
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
