import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/hive_model.dart';
import 'package:water_drinker/model/model.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:line_icons/line_icons.dart';

// ignore: camel_case_types
class homebody extends StatefulWidget {
  const homebody({Key? key}) : super(key: key);

  @override
  _homebodyState createState() => _homebodyState();
}

// ignore: camel_case_types
class _homebodyState extends State<homebody> {
  // final List<String> _waterdrunk = [];
  int target = 0;
  int progress = 0;
  final String hiveBoxName = "History";
  late Box<HiveModel> hiveBox;

  // void populateMap(String amount) {
  //   String hour, minute;
  //   DateTime now = DateTime.now();
  //   if (now.hour < 10) {
  //     hour = "0" + now.hour.toString();
  //   } else {
  //     hour = now.hour.toString();
  //   }
  //   if (now.minute < 10) {
  //     minute = "0" + now.minute.toString();
  //   } else {
  //     minute = now.minute.toString();
  //   }
  //   String _time = hour + ":" + minute;
  //   String waterInput = "$_time - $amount cl";
  //   _waterdrunk.add(waterInput);
  // }

  @override
  void initState() {
    super.initState();
    hiveBox = Hive.box<HiveModel>(hiveBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Today",
              style: GoogleFonts.roboto(
                  color: const Color(0xff323062),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 12, bottom: 0),
                child: Column(
                  children: [
                    Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: WidgetMask(
                                blendMode: BlendMode.srcATop,
                                childSaveLayer: true,
                                mask: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Consumer<Models>(
                                        builder: (context, model, child) {
                                      return WaveWidget(
                                        config: CustomConfig(
                                          gradients: [
                                            [
                                              Colors.blue,
                                              const Color(0x6609c6f9)
                                            ],
                                            [
                                              Colors.lightBlue,
                                              const Color(0x77009ffd)
                                            ],
                                            [
                                              const Color(0x554d5dfb),
                                              const Color(0x6608c8f6)
                                            ],
                                            [
                                              Colors.lightBlueAccent,
                                              const Color(0x554d5dfb)
                                            ]
                                          ],
                                          durations: [
                                            35000,
                                            19440,
                                            10800,
                                            6000
                                          ],
                                          heightPercentages: [
                                            0.20,
                                            0.23,
                                            0.25,
                                            0.30
                                          ],
                                          blur: const MaskFilter.blur(
                                              BlurStyle.solid, 2),
                                          gradientBegin: Alignment.bottomLeft,
                                          gradientEnd: Alignment.topRight,
                                        ),
                                        waveAmplitude: 0,
                                        size: Size(
                                          300,
                                          model.dropHeight.toDouble(),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/waterdroplet.png",
                                  fit: BoxFit.contain,
                                  width: 220,
                                  height: 220,
                                )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 180,
                            alignment: Alignment.bottomCenter,
                            child: Consumer<Models>(
                                builder: (context, model, child) {
                              return Text(model.waterPercentage.toString(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 55,
                                      color: const Color(0xff323062),
                                      fontWeight: FontWeight.w800));
                            }),
                          ),
                          Text('cl',
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff323062),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Progress",
                                style: GoogleFonts.roboto(
                                    color: const Color(0xff323062),
                                    fontSize: 14),
                              ),
                              Consumer<Models>(
                                  builder: (context, model, child) {
                                return Text(
                                  model.progress.toString() + " cl",
                                  style: GoogleFonts.roboto(
                                      color: model.targetHit,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                );
                              })
                            ],
                          ),
                          const Expanded(
                              child: SizedBox(
                            width: 10,
                          )),
                          Column(
                            children: [
                              Text(
                                "Target",
                                style: GoogleFonts.roboto(
                                    color: const Color(0xff323062),
                                    fontSize: 14),
                              ),
                              Consumer<Models>(
                                  builder: (context, model, child) {
                                return Text(
                                  model.dailyGoal.toString() + " cl",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xff323062),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                );
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 127,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Provider.of<Models>(context, listen: false)
                                    .waterPercent(25);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                primary: const Color(0xFFEEEEFF),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    LineIcons.tint,
                                    color: Color(0xff323062),
                                  ),
                                  Text(
                                    "25cl",
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xff323062),
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 127,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Provider.of<Models>(context, listen: false)
                                    .waterPercent(50);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                primary: const Color(0xFFF8F8F7),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    LineIcons.wineBottle,
                                    color: Color(0xff323062),
                                  ),
                                  Text(
                                    "50cl",
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xff323062),
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 127,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Provider.of<Models>(context, listen: false)
                                    .waterPercent(100);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                primary: const Color(0xFFFFF8ED),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    LineIcons.mugHot,
                                    color: Color(0xff323062),
                                  ),
                                  Text(
                                    "100cl",
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xff323062),
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 127,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Provider.of<Models>(context, listen: false)
                                    .waterPercent(150);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                primary: const Color(0xFFF8E9E5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    LineIcons.blender,
                                    color: Color(0xff323062),
                                  ),
                                  Text(
                                    "150cl",
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xff323062),
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
