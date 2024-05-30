import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Providers/auth.dart';
import 'package:assignmet_1/Screens/home.dart';
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
        '/': (context) {   //Loginpage
                  return Consumer(
                    builder: (context, ref, child) {
                      final authState = ref.watch(authprovider);
                      // Check if the user is authenticated and profile is complete
                  
                      // If the user is not authenticated, attempt auto-login
                      return FutureBuilder(
                        future: ref.watch(authprovider.notifier).tryAutoLogin(),
                        builder: (context, snapshot) {
                          print("print circular");
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: const CircularProgressIndicator()); // Show SplashScreen while waiting
                          } else {
                            // Based on auto-login result, navigate to appropriate screen
                            return snapshot.data == true
                                ? HomeScreen()//Welcome page
                                :LoginScreen(); //Login page
                          }
                        },
                      );
                    },
                  );
                },
        '/second': (BuildContext context) {  //registration page
          return const SecondScreen();
        },
        '/home': (BuildContext context) {  //welcome page
          return const HomeScreen();
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
