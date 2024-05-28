import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final buttonTextProvider = StateProvider<String>((ref) => 'Submit');
    final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
     
      return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) { 
           String sButton = ref.watch(buttonTextProvider);
           print("entered mail: ${ref.watch(buttonTextProvider.notifier).state}");
          return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a number or an email',
              ),
              onChanged: (text) {
                if (_isNumber(text)) {
                  print("entered Num");
                   ref.read(buttonTextProvider.notifier).state = 'Number Entered';
                 
                } else if (_isEmail(text)) {
                   print("entered mail");
                   ref.read(buttonTextProvider.notifier).state= 'Email Entered';
                    
                } else {
                   ref.read(buttonTextProvider.notifier).state = 'Submit';
                }
              },
            ),
            SizedBox(height: 20),
                 ElevatedButton(
                  onPressed: () {},

                  child: Text((ref.watch(buttonTextProvider))),
                ),
            
          ],
        );
        },
      ),
    ),
      );
  }
   bool _isNumber(String text) {
    return RegExp(r'^\d+$').hasMatch(text);
  }

  bool _isEmail(String text) {
    return RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(text);
  }
}