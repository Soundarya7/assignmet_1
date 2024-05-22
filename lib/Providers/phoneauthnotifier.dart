import 'dart:async';

import 'package:assignmet_1/Providers/loaded.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/phoneauthstate.dart';

class PhoneAuthNotifier extends StateNotifier<PhoneAuthState> {
  PhoneAuthNotifier() : super(PhoneAuthState());
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void restartTimer() {
    state =
        state.copyWith(countdown: 45, wait: true); // Reset countdown and wait
    startTimer(); // Start the timer again
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.countdown == 0) {
        waitTime();
        timer.cancel();
      } else {
        updateCountdown();
      }
    });
  }

  void updateCountdown() {
    state = state.copyWith(countdown: state.countdown - 1);
  }

  void waitTime() {
    state = state.copyWith(wait: !state.wait);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> phoneAuth(
      BuildContext context, String phoneNumber, WidgetRef ref) async {
    final loadingState = ref.watch(loadingProvider.notifier);
    final FirebaseAuth auth =
        FirebaseAuth.instance; // Ensure you have an instance of FirebaseAuth

    try {
      loadingState.state = true;

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          loadingState.state = false;
        
          // Handle auto-retrieval or instant verification
        },
        verificationFailed: (FirebaseException exception) {
          loadingState.state = false;
          _showAlertDialog(context, "Verification Failed",
              exception.message ?? "An error occurred.");
        },
        codeSent: (String verificationId, [int? forceResendingToken]) async {
          
        state=  state.copyWith(vrfCompleted: true);
          loadingState.state = false;
          print("Vrification Done ${state.vrfCompleted}");
          _showAlertDialog(
              context, "Code Sent", "Verification code sent on your mobile.");
          Navigator.of(context).pushNamed('verifyotp', arguments: phoneNumber);
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('verificationid', verificationId);
        },
        timeout: const Duration(seconds: 30),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto retrieval timeout
        },
      );
    } catch (e) {
      loadingState.state = false;
      _showAlertDialog(context, "Error", e.toString());
    }
  }

  Future<void> signInWithPhoneNumber(
      String smsCode,
      BuildContext context,
      WidgetRef ref,
      String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    String? verificationId = prefs.getString('verificationid');

    final loadingState = ref.watch(loadingProvider.notifier);
    try {
      loadingState.state = true;

      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: smsCode);

      await auth.signInWithCredential(credential).then((value) async {
        if (value.user != null) {
          var user = auth.currentUser!;

          user.getIdToken().then((ftoken) async {
            await prefs.setString('firebaseToken', ftoken!);
          });
        }
      });

      loadingState.state = false;
    } catch (e) {
      loadingState.state = false;
      if (e is PlatformException) {
        PlatformException exception = e;
        if (exception.code == 'firebase_auth') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(exception.message!),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }

        //showsnackbar(context, e.toString());
      }
    }
    loadingState.state = false;
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    // Implement any additional logic as needed
  }
}

final phoneAuthProvider =
    StateNotifierProvider<PhoneAuthNotifier, PhoneAuthState>((ref) {
  return PhoneAuthNotifier();
});
