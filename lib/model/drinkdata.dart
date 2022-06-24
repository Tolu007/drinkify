class DrinkData{
  String time="";
  String quantity="";
  String date="";

  DrinkData();

  Map<String, dynamic> toJson() =>{
    'time': time,
    'quantity': quantity,
    'date': date
  };

  DrinkData.fromJson(Map<String, dynamic> json)
    : time = json['time'],
      quantity = json['quantity'],
      date = json['date'];
}