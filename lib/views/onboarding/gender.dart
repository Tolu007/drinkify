import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/model.dart';
import 'package:water_drinker/views/age_intro.dart';

class GenderSelect extends StatefulWidget {
  const GenderSelect({Key? key}) : super(key: key);

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  int _selectedGender = -1;
  double _imageMaleHeight = 50;
  double _imageMaleWidth = 50;
  double _imageFemaleHeight = 50;
  double _imageFemaleWidth = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your Gender",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Center(
          child: Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _selectedGender = 0;
                      setState(() {
                        _imageMaleHeight = 70;
                        _imageMaleWidth = 70;
                      });
                    },
                    child: Image.asset(
                      "name",
                      width: _imageMaleWidth,
                      height: _imageMaleHeight,
                    ),
                  ),
                  Text("Male",
                      style: GoogleFonts.poppins(
                        color: Colors.lightBlue,
                        fontSize: 18,
                      ))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _selectedGender = 1;
                      setState(() {
                        _imageMaleHeight = 70;
                        _imageMaleWidth = 70;
                      });
                    },
                    child: Image.asset("name"),
                  ),
                  Text(
                    "Female",
                    style: GoogleFonts.poppins(
                      color: Colors.lightBlue,
                      fontSize: 18,
                    ),
                  )
                ],
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
              onPressed: () {
                if (_selectedGender > -1) {
                  Provider.of<Models>(context, listen: false)
                      .uploadIntData('age', _selectedGender);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AgeSelect(),
                    ),
                  );
                }
              },
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
