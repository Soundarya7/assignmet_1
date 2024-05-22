import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Widgets/textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Venuscreen extends StatefulWidget {
  Venuscreen({super.key});

  @override
  State<Venuscreen> createState() => _VenuscreenState();
}

class _VenuscreenState extends State<Venuscreen> {
  List<BottomNavigationBarItem> botmNav_list = [];

  int BNIndex = 0;

  String _value2 = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    botmNav_list = [];
    botmNav_list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'));
    botmNav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.search), label: 'Search'));
    botmNav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_rounded), label: 'Manager'));
    botmNav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CoustColors.colrFill,
      bottomNavigationBar: BottomNavigationBar(
        items: botmNav_list,
        fixedColor: Colors.blue,
        currentIndex: BNIndex,
        onTap: (ind) {
          setState(() {
            BNIndex = ind;
          });
        },
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                  color: Color(0xFF6418C3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(20),
                      bottomStart: Radius.circular(20))),
              child: const Text("Venues",
                  style: TextStyle(color: CoustColors.colrEdtxt4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
