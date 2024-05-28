import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Screens/login.dart';
import 'package:assignmet_1/Screens/registration.dart';
import 'package:assignmet_1/Screens/venudetails.dart';
import 'package:assignmet_1/Screens/venues.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          buttonTheme: const ButtonThemeData(
            buttonColor: Color(0xFF6418C3),
          ),
          scaffoldBackgroundColor: CoustColors.colrButton3,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors
                .white, // Setting CircularProgressIndicator color to white
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF6418C3),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor:  CoustColors.colrButton3,
            unselectedItemColor: CoustColors.colrSubText,
          )),
      routes: {
        '/': (BuildContext context) {
          return const LoginScreen();
        },
        '/second': (BuildContext context) {
          return const SecondScreen();
        },
        '/venue': (BuildContext context) {
          return const Venuscreen();
        },
         '/venue_details': (BuildContext context) {
          return const VenuDetailsScreen();
        },
      },
    );
  }
}
