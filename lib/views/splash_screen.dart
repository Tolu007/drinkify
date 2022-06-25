import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/model.dart';
import 'package:water_drinker/views/home.dart';
import 'package:water_drinker/views/onboarding/onboarding.dart';

// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Provider.of<Models>(
        context,
        listen: false,
      ).newUser
          ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Onboarding(),
              ),
            )
          : Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const home(),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Text(
              "Drinkify",
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: const Color(0xff323062),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
