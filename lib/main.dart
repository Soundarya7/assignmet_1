import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Screens/login.dart';
import 'package:assignmet_1/Screens/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()async {
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
        buttonTheme: const ButtonThemeData(buttonColor:CoustColors.colrButton3,textTheme: ButtonTextTheme.primary ),
        scaffoldBackgroundColor:CoustColors.colrButton3
      ),
       routes: {
        '/':(BuildContext context){
          return const LoginScreen();
        },
         '/second':(BuildContext context){
          return  const SecondScreen();
        },
      
      },
    );
  }
}
