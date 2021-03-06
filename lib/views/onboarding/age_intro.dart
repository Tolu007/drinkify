import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/model.dart';
import 'package:water_drinker/views/home.dart';

class AgeSelect extends StatefulWidget {
  const AgeSelect({Key? key}) : super(key: key);

  @override
  State<AgeSelect> createState() => _AgeSelectState();
}

class _AgeSelectState extends State<AgeSelect> {
  int _currentAge = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Text(
              "Your Age",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/age.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  NumberPicker(
                    minValue: 10,
                    maxValue: 100,
                    value: _currentAge,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                    selectedTextStyle: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    onChanged: (value) => setState(() {
                      _currentAge = value;
                    }),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            SizedBox(
              width: 240,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<Models>(context, listen: false)
                      .uploadIntData('age', _currentAge);
                  Provider.of<Models>(context, listen: false)
                      .showOnboardingScreen();
                  Provider.of<Models>(context, listen: false)
                      .suggestTargetBody(_currentAge);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const home(),
                    ),
                  );
                },
                child: Text(
                  "Next",
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
    );
  }
}
