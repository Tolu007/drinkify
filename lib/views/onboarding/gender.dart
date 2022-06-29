import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/model.dart';
import 'package:water_drinker/views/onboarding/age_intro.dart';

class GenderSelect extends StatefulWidget {
  const GenderSelect({Key? key}) : super(key: key);

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  int selectedGender = -1;
  double _imageMaleHeight = 70;
  double _imageMaleWidth = 70;
  double _imageFemaleHeight = 70;
  double _imageFemaleWidth = 70;

  Color _mcolor = Colors.grey;
  Color _fcolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Text(
              "Your Gender",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
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
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectedGender = 0;
                          setState(() {
                            _imageMaleHeight = 200;
                            _imageMaleWidth = 200;
                            _mcolor = Colors.lightBlue;
                            _fcolor = Colors.grey;
                            _imageFemaleHeight = 70;
                            _imageFemaleWidth = 70;
                          });
                        },
                        child: Image.asset(
                          "assets/man.png",
                          width: _imageMaleHeight,
                          height: _imageMaleWidth,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        "Male",
                        style: GoogleFonts.poppins(
                          color: _mcolor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectedGender = 1;
                          setState(() {
                            _imageFemaleHeight = 200;
                            _imageFemaleWidth = 200;
                            _mcolor = Colors.grey;
                            _fcolor = Colors.lightBlue;
                            _imageMaleHeight = 70;
                            _imageMaleWidth = 70;
                          });
                        },
                        child: Image.asset(
                          "assets/woman.png",
                          width: _imageFemaleWidth,
                          height: _imageFemaleHeight,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        "Female",
                        style: GoogleFonts.poppins(
                          color: _fcolor,
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
            SizedBox(
              width: 240,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedGender > -1) {
                    Provider.of<Models>(context, listen: false)
                        .uploadIntData('gender', selectedGender);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AgeSelect(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
