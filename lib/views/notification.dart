import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Notice extends StatefulWidget {
  const Notice({ Key? key }) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {

  bool _isSwitched = false;
  TimeOfDay picked = TimeOfDay.now();
  TimeOfDay toPicked = TimeOfDay.now();

  var items = ['30m', '1hr', '1hr 30m', '2hr', '2hr 30m', '3hr', '3hr 30m', '4hr'];

  String dropDownValue = '30m';
  String hours = "07";
  String minutes = "00";
  String thours = "12";
  String tminutes = "00";

  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.lightBlue,
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text("Notifications", 
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
         
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.773,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                   Text(
                         "Notifications",
                         style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                       ),
                   const Expanded(child: SizedBox(width: 10,)),
                  Switch(value: _isSwitched, onChanged: toggleSwitch,) 
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                   Text(
                         "From",
                         style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                       ),
                   const Expanded(child: SizedBox(width: 10,)),
                   GestureDetector(
                     onTap: () async{
                       picked = (await showTimePicker(context: context, initialTime: const TimeOfDay(hour: 7, minute: 0), initialEntryMode: TimePickerEntryMode.dial))!;
                       if(picked.hour < 10){
                         hours = '0'+picked.hour.toString();
                       }else{
                         hours = picked.hour.toString();
                       }
                       if(picked.minute < 10){
                         minutes = '0'+picked.minute.toString();
                       }else{
                          minutes = picked.minute.toString();
                       }
                       setState(() {
                         
                       });
                     },
                     child: SizedBox(
                       width: 50,
                       height: 20,
                       child: Text(hours + ":" +minutes, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                       ),
                   )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                   Text(
                         "To",
                         style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                       ),
                   const Expanded(child: SizedBox(width: 10,)),
                     GestureDetector(
                     onTap: () async{
                       toPicked = (await showTimePicker(context: context, initialTime: const TimeOfDay(hour: 7, minute: 0), initialEntryMode: TimePickerEntryMode.dial))!;
                       if(picked.hour < 10){
                         thours = '0'+toPicked.hour.toString();
                       }else{
                         thours = toPicked.hour.toString();
                       }
                       if(picked.minute < 10){
                         tminutes = '0'+toPicked.minute.toString();
                       }else{
                          tminutes = toPicked.minute.toString();
                       }
                       setState(() {
                         
                       });
                     },
                     child: SizedBox(
                       width: 50,
                       height: 20,
                       child: Text(thours + ":" +tminutes, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                       ),
                   )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                   Text(
                         "Intervals",
                         style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                       ),
                   const Expanded(child: SizedBox(width: 10,)),
                    DropdownButton(
                      value: dropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.lightBlue,),
                      items: items.map((String items){
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items)
                          );
                      } ).toList(),

                      onChanged: (String ?newValue){
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        ] 
      ),
    );
}
  void toggleSwitch(bool value) {
    if (_isSwitched == false){
      setState(() {
        _isSwitched = true;
      });
    }else{
      setState(() {
        _isSwitched = false;
      });
    }
  }
}