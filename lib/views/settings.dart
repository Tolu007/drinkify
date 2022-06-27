import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_drinker/model/model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:water_drinker/model/notification_service.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.90,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.roboto(
                            color: const Color(0xff323062),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            "Reminder Setting",
                            style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              NotificationService().showNotification(1,
                                  "My Notification", "Go and drink water", 2);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Consumer<Models>(
                                      builder: (context, model, child) {
                                    return Radio(
                                        value: 0,
                                        groupValue: model.gender,
                                        activeColor: Colors.lightBlue,
                                        onChanged: (int? value) {
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .radioButton(value!);
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .suggestBody();
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .waterflow();
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .uploadIntData("gender", 0);
                                        });
                                  }),
                                ),
                                Text(
                                  "Male",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: const Color(0xff323062)),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Consumer<Models>(
                                      builder: (context, model, child) {
                                    return Radio(
                                        value: 1,
                                        groupValue: model.gender,
                                        activeColor: Colors.lightBlue,
                                        onChanged: (int? value) {
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .radioButton(value!);
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .suggestBody();
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .waterflow();
                                          Provider.of<Models>(context,
                                                  listen: false)
                                              .uploadIntData("gender", 1);
                                        });
                                  }),
                                ),
                                Text(
                                  "Female",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: const Color(0xff323062)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Consumer<Models>(
                                  builder: (context, model, child) {
                                return Text(
                                  "Age(" + model.age.toString() + ")",
                                  style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff323062)),
                                );
                              }),
                              Consumer<Models>(
                                builder: (context, model, child) {
                                  return Slider(
                                    min: 0,
                                    max: 100,
                                    activeColor: Colors.lightBlue,
                                    value: model.age.toDouble(),
                                    onChanged: (value) {
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .ageSlider(value.floor());
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .suggestBody();
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .waterflow();
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .uploadIntData("age", value.floor());
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Consumer<Models>(
                                  builder: (context, model, child) {
                                return Text(
                                  "Daily Goal(" +
                                      model.dailyGoal.toString() +
                                      " cl)",
                                  style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff323062)),
                                );
                              }),
                              Consumer<Models>(
                                  builder: (context, model, child) {
                                return Slider(
                                    min: 0,
                                    max: 500,
                                    divisions: 50,
                                    activeColor: Colors.lightBlue,
                                    value: model.dailyGoal.toDouble(),
                                    onChanged: (value) {
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .dailyGoals(value.toInt());
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .waterflow();
                                      Provider.of<Models>(context,
                                              listen: false)
                                          .uploadIntData(
                                              "dailyGoal", value.toInt());
                                    });
                              }),
                              Row(
                                children: [
                                  Consumer<Models>(
                                      builder: (context, model, child) {
                                    return Text(
                                      "Suggested: " +
                                          model.suggested.toString() +
                                          " cl",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xff323062),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }),
                                  const Expanded(
                                      child: SizedBox(
                                    width: 10,
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
