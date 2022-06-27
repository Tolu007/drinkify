import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:water_drinker/model/model.dart';
import 'package:water_drinker/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'model/hive_model.dart';
import 'model/notification_service.dart';

const String hiveBoxName = "History";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  final applicationDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocumentDir.toString());
  Hive.registerAdapter(HiveModelAdapter());
  await Hive.openBox<HiveModel>(hiveBoxName);
  runApp(ChangeNotifierProvider(create: (_) => Models(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime time = DateTime.now();
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    Provider.of<Models>(context, listen: false).loadData();
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      08,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      10,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      12,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      14,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      16,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      18,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      20,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      22,
    );
    NotificationService().showNotification(
      0,
      "Drinkify",
      "Time to hydrate!",
      time.year,
      time.month,
      time.day,
      23,
    );
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/logo.png"), context);
    precacheImage(const AssetImage("assets/waterdroplet.png"), context);
    precacheImage(const AssetImage("assets/bottle.png"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
