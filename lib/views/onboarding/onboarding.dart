import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_drinker/views/onboarding/gender.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Text(
                "Hi,\nI am your personal hydration assistant.",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
              Text(
                "In order to provide tailored hydration advice, I need to get some basic information. Dnt worry it is our little secret",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 10,
                  width: 10,
                ),
              ),
              SizedBox(
                width: 240,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GenderSelect(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Let's go",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
