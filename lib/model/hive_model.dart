import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final int quantity;

  HiveModel({required this.date, required this.time, required this.quantity});
}
