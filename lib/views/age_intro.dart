import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
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
    return Column(
      children: [
        Text(
          "Your Age",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Center(
          child: Row(
            children: [
              Image.asset(""),
              NumberPicker(
                minValue: 10,
                maxValue: 10,
                value: _currentAge,
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
        Row(
          children: [
            const Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const home(),
                ),
              ),
              child: Text(
                "Next",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
