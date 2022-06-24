class History {
  final int id;
  final DateTime date;
  final DateTime time;

  History({required this.id, required this.date, required this.time});

  History.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        date = item["date"],
        time = item["time"];

  Map<String, Object> toMap() {
    return {'id': id, 'date': date, 'time': time};
  }
}
