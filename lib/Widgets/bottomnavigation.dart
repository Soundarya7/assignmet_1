import 'package:assignmet_1/Screens/home.dart';
import 'package:assignmet_1/Screens/settings.dart';
import 'package:assignmet_1/Screens/venudetails.dart';
import 'package:assignmet_1/Screens/venues.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoustNavigation extends StatefulWidget {
  // ignore: non_constant_identifier_names
   CoustNavigation({super.key});
  

  @override
  State<CoustNavigation> createState() => _CoustNavigationState();
}

class _CoustNavigationState extends State<CoustNavigation> {
  final _pageOptions = [
    HomeScreen(),
    Venuscreen(),
    VenuDetailsScreen(),
    SettingsScreen(),
    
  ];
  List<BottomNavigationBarItem> botmnav_list = [];
  int nav_index = 0; // Setting current index to 1 to select search by default

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
    return  Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        items: botmnav_list,
        currentIndex: nav_index,
        onTap: (ind) {
          setState(() {
             nav_index = ind;
          });
        }),
      body: _pageOptions[nav_index],
    );

   
  }
}
