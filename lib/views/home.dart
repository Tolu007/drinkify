import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:water_drinker/views/history.dart';
import 'package:water_drinker/views/homebody.dart';
//import 'package:water_drinker/views/notification.dart';
import 'package:water_drinker/views/settings.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  int _selectedIndex = 0;
  final List<Widget> _views = [
    const homebody(),
    const History(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _views,
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(LineIcons.home, color: Colors.grey),
              label: '',
              activeIcon: Icon(LineIcons.home, color: Color(0xff323062)),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.tintSlash, color: Colors.grey),
              label: '',
              backgroundColor: Color(0xff323062),
              activeIcon: Icon(LineIcons.tint, color: Color(0xff323062)),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.tools,
                color: Colors.grey,
              ),
              label: '',
              backgroundColor: Color(0xff323062),
              activeIcon: Icon(
                LineIcons.tools,
                color: Color(0xff323062),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff323062),
          onTap: onTabPressed,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void onTabPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
