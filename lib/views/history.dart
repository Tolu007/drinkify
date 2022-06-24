import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/hive_model.dart';
import 'package:water_drinker/model/model.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int mainIndex = 0;
  final String hiveBoxName = "History";
  late Box<HiveModel> hiveBox;

  @override
  void initState() {
    super.initState();
    hiveBox = Hive.box<HiveModel>(hiveBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 0, right: 0, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              child: Row(children: [
                Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  height: 50,
                  width: 50,
                ),
                Text(
                  'Drinkify',
                  style: GoogleFonts.roboto(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7875,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              color: const Color(0xff323062),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer<Models>(
                                      builder: (context, model, child) {
                                    return Text(model.progress.toString(),
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold));
                                  }),
                                  Text(
                                    'centiliter (cl)',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Expanded(
                                      child: SizedBox(
                                    height: 10,
                                  )),
                                  Text(
                                    'TODAY',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer<Models>(
                                      builder: (context, model, child) {
                                    return Text(model.weekly.toString(),
                                        style: GoogleFonts.montserrat(
                                            color: Colors.lightBlue,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold));
                                  }),
                                  Text(
                                    'centiliter (cl)',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Expanded(
                                      child: SizedBox(
                                    height: 10,
                                  )),
                                  Text('THIS WEEK',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Consumer<Models>(
                              builder: (context, model, child) {
                            // int count = model.idKeys.length;
                            if (hiveBox.isEmpty) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/bottle.png',
                                    height: 150,
                                    width: 150,
                                  ),
                                  Text('Nothing to show..',
                                      style: GoogleFonts.openSans(
                                        fontSize: 18,
                                        color: const Color(0xff323062),
                                      )),
                                ],
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Today History',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: const Color(0xff323062),
                                              fontWeight: FontWeight.w600)),
                                      const Expanded(
                                          child: SizedBox(width: 10)),
                                      Text('Time',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: const Color(0xff323062),
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Expanded(
                                    child: ValueListenableBuilder(
                                        valueListenable: hiveBox.listenable(),
                                        builder: (context,
                                            Box<HiveModel> history, _) {
                                          List<int> keys =
                                              history.keys.cast<int>().toList();
                                          int count = keys.length;
                                          return ListView.separated(
                                              itemCount: keys.length,
                                              separatorBuilder:
                                                  (context, index) {
                                                return const Divider();
                                              },
                                              itemBuilder: (_, index) {
                                                final int key =
                                                    keys[(count - 1) - index];
                                                final HiveModel? historyModel =
                                                    history.get(key);
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Icon(
                                                        LineIcons.tint,
                                                        color:
                                                            Color(0xff323062),
                                                        size: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        historyModel!.quantity
                                                                .toString() +
                                                            'cl',
                                                        style: GoogleFonts
                                                            .openSans(
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xff323062),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      const Expanded(
                                                          child: SizedBox(
                                                        width: 10,
                                                      )),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            historyModel.date,
                                                            style: GoogleFonts.openSans(
                                                                fontSize: 18,
                                                                color: const Color(
                                                                    0xff323062),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            historyModel.time,
                                                            style: GoogleFonts.openSans(
                                                                fontSize: 10,
                                                                color: const Color(
                                                                    0xdda7a9ab)),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        }),
                                  ),
                                ],
                              );
                            }
                          }),
                        ),
                      ),
                    ],
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
