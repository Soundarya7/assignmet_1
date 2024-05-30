import 'package:flutter/material.dart';

class CoustNavigation extends StatefulWidget {
  // ignore: non_constant_identifier_names
   CoustNavigation({super.key,required this.nav_index});
   int nav_index;

  @override
  State<CoustNavigation> createState() => _CoustNavigationState();
}

class _CoustNavigationState extends State<CoustNavigation> {
  List<BottomNavigationBarItem> botmnav_list = [];
  //int nav_index = 1; // Setting current index to 1 to select search by default

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    botmnav_list = [];
    botmnav_list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'));
    botmnav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.search), label: 'Search'));
    botmnav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_rounded), label: 'Manager'));
    botmnav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: botmnav_list,
        currentIndex: widget.nav_index,
        onTap: (ind) {
          setState(() {
             widget.nav_index = ind;
          });
          print("${widget.nav_index}");
          switch (widget.nav_index) {
            case 0: //Home
               Navigator.pushNamed(context, '/home');
              break;
            case 1: // Search
            print("case1");
               Navigator.pushNamed(context, '/venue');
              break;
            case 2: // Manager
              break;
            case 3: // Settings
              break;
          }
        });
  }
}
