import 'dart:convert';

import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<VenueCard> _items = [];

  @override
  void initState() {
    super.initState();
    GetData();
    for (int i = 0; i < 5; i++) {
      _items.add(VenueCard(
          name: "Swagath Grand",
          location: 'Bachupally, Hyderabad\nAug 25, 2023'));
    }
  }

  Future<void> GetData() async {
    final prefs = await SharedPreferences.getInstance();
    final extractData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    String sname = extractData['username'];
    setState(() {
      sUsername = sname;
    });
  }

  String sUsername = "Abc";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoustColors.colrFill,
      bottomNavigationBar: CoustNavigation(
        nav_index: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
              width: double.infinity,
              height: 90,
              decoration: const BoxDecoration(
                  color: Color(0xFF6418C3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(25),
                      bottomStart: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Welcome Back",
                            style: TextStyle(
                                color: CoustColors.colrEdtxt4,
                                fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(sUsername,
                              style: const TextStyle(
                                  color: CoustColors.colrEdtxt4,
                                  fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: IconButton(
                            icon: const Icon(Icons.notifications),
                            color: CoustColors.colrHighlightedText,
                            onPressed: () {
                              print("Notification Clicked");
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: IconButton(
                            icon: const Icon(Icons.person),
                            color: CoustColors.colrHighlightedText,
                            onPressed: () {
                              print("Person Clicked");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, top: 5),
                    child: Text('Quick Access',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuickAccessCard(
                          icon: Icons.book,
                          label: 'My Bookings',
                        ),
                        QuickAccessCard(
                          icon: Icons.history,
                          label: 'Payment History',
                        ),
                        QuickAccessCard(
                          icon: Icons.account_balance_wallet,
                          label: 'Wallets',
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, top: 5),
                    child: Text('Newly',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return Column(
                            children: [
                              Image.asset(
                                'images/flutter.jpg',
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 8),
                              Text(item.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(item.location,
                                  style: TextStyle(
                                      color: Colors.grey)),
                            ],
                          );
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, top: 5),
                    child: Text('Recently viewed',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/flutter.jpg',
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        Text("Swagath grand banquet Hall",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, top: 5),
                    child: Text('Testimonial',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Banquet Bookz: Event planning made easy! Love the intuitive design.',
                              textAlign: TextAlign.center),
                          SizedBox(height: 8),
                          Text('Kristin Watson',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    color: Colors.amber, size: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String label;

  QuickAccessCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$label");
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: 100,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: CoustColors.colrHighlightedText),
            const SizedBox(height: 5.0),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class VenueCard {
  final String name;
  final String location;

  VenueCard({required this.name, required this.location});
}