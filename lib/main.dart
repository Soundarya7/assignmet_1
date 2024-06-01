import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Providers/auth.dart';
import 'package:assignmet_1/Screens/home.dart';
import 'package:assignmet_1/Screens/login.dart';
import 'package:assignmet_1/Screens/paymenthistory.dart';
import 'package:assignmet_1/Screens/notificationsettings.dart';
import 'package:assignmet_1/Screens/profilesettings.dart';
import 'package:assignmet_1/Screens/registration.dart';
import 'package:assignmet_1/Screens/settings.dart';
import 'package:assignmet_1/Screens/venudetails.dart';
import 'package:assignmet_1/Screens/venues.dart';
import 'package:assignmet_1/Widgets/bottomnavigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authprovider);
    print("authState.token${authState.token}");
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
            selectedItemColor: CoustColors.colrButton3,
            unselectedItemColor: CoustColors.colrSubText,
          )),
     // home: authState.token != null ? const HomeScreen() : const LoginScreen(),
      routes: {
        '/': (context) {
          //Loginpage
          return Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authprovider);
              // Check if the user is authenticated and profile is complete

              // If the user is not authenticated, attempt auto-login
              return FutureBuilder(
                future: ref.watch(authprovider.notifier).tryAutoLogin(),
                builder: (context, snapshot) {
                  print("print circular");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show SplashScreen while waiting
                  } else {
                    // Based on auto-login result, navigate to appropriate screen
                    return snapshot.data == true
                        ? CoustNavigation() //Welcome page
                        : LoginScreen(); //Login page
                  }
                },
              );
            },
          );
        },
        '/registration': (BuildContext context) {
          //registration page
          return const RegistrationScreen();
        },
        '/welcome': (BuildContext context) {//welcome page
          return  CoustNavigation();
        },
        '/venue_details': (BuildContext context) {
          return const VenuDetailsScreen();
        },
         '/profile_settings': (BuildContext context) {
          return  ProfileSetingsScreen();
        },
         '/payment_history': (BuildContext context) {
          return  PaymenthistoryScreen();
        },
        '/notification_settings': (BuildContext context) {
          return  NotificationSettingsScreen();
        },
        
        
        // '/home': (BuildContext context) {
        //   return const HomeScreen();
        // },
        // '/settings': (BuildContext context) {
        //   return const SettingsScreen();
        // },

      },
    );
  }
}
