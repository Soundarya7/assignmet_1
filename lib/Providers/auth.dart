import 'dart:convert';
import 'package:assignmet_1/Providers/loaded.dart';
import 'package:assignmet_1/Providers/phoneauthnotifier.dart';
import 'package:http/http.dart' as http;
import 'package:assignmet_1/models/authstate.dart';
import 'package:assignmet_1/utils/bbapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      print('trylogin is false');
      return false;
    }

    final extractData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    if (state.token == null) {
      state = state.copyWith(
        username: extractData['username'],
        mobileno: extractData['mobileno'],
        email: extractData['email'],
        usertype: extractData['usertype'],
        token: extractData['token'],
      );
    }

    print('access token:${state.token}');
    return true;
  }

  Future<void> registerUser(BuildContext context, String? username,
      String? email, String? phonenum, String? password, WidgetRef ref) async {
    const url = Bbapi.register;

    final prefs = await SharedPreferences.getInstance();
    final loadingState = ref.read(loadingProvider2.notifier);
    loadingState.state = true;
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type':
              'application/json', // Set the content type to application/json
        },
        body: json.encode({
          "username": username!,
          "email": email!,
          "mobileno": phonenum!,
          "password": password!
        }));
    print("username: $username!");
    var userDetails = json.decode(response.body);
    print('booking response:$userDetails');
    switch (response.statusCode) {
      case 201:
        loadingState.state = false;
        print('success');
        showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Registation successful'),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        break;
      case 500:
        loadingState.state = false;
        break;
    }
    // Handle other status codes as needed
  }

  Future<void> numCheck(
      BuildContext context, String? phonenum, WidgetRef ref) async {
    const url = Bbapi.mobilecheck;
    print("NumCheck${phonenum}");
    final prefs = await SharedPreferences.getInstance();
    final loadingState = ref.read(loadingProvider2.notifier);
    loadingState.state = true;
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type':
              'application/json', // Set the content type to application/json
        },
        body: json.encode({"mobileno": phonenum!}));
    print("username: $phonenum!");
    var userDetails = json.decode(response.body);
    print('booking response:$userDetails');
    switch (response.statusCode) {
      case 200:
        loadingState.state = false;
        print('success');
        ref.read(enablepasswaorProvider.notifier).state = true;
        ref
            .read(phoneAuthProvider.notifier)
            .phoneAuth(context, "+91$phonenum", ref);
        // showDialog(
        //   context: context!,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text('Success'),
        //       content: const Text('Registation successful'),
        //       actions: [
        //         ElevatedButton(
        //           child: const Text('OK'),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );

        break;
      case 400:
        loadingState.state = false;
        print('success');
        showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text("$userDetails"),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        break;
      case 500:
        loadingState.state = false;
        break;
    }
    // Handle other status codes as needed
  }

  Future<void> loginOtp(
      BuildContext context, String? token, WidgetRef ref) async {
    const url = Bbapi.login_otp;
    //print("Otp check${otp}");
    final prefs = await SharedPreferences.getInstance();
    String? verificationId = prefs.getString('verificationid');
    final loadingState = ref.read(loadingProvider2.notifier);
    loadingState.state = true;

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type':
              'application/json', // Set the content type to application/json
        },
        body: json.encode({"token": token}));
    print("verificationId: $verificationId");
    var userDetails = json.decode(response.body);
    print('booking response:$userDetails');
    switch (response.statusCode) {
      case 200:
        loadingState.state = false;
        print('success');
        state = state.copyWith(
            token: userDetails["token"],
            username: userDetails["username"],
            email: userDetails["email"],
            mobileno: userDetails["mobileno"],
            usertype: userDetails["usertype"]);
        final userData = json.encode({
          'token': state.token,
          'username': state.username,
          'email': state.email,
          'mobileno': state.mobileno,
          'usertype': state.usertype,
        });
        await prefs.setString('userData', userData);
        Navigator.of(context).pushNamed('/venue');
        break;
      case 400:
        loadingState.state = false;
        print('success');
        showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text("$userDetails"),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        break;
      case 500:
        loadingState.state = false;
        break;
    }
    // Handle other status codes as needed
  }
}

final authprovider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
