import 'package:assignmet_1/Providers/loaded.dart';
import 'package:assignmet_1/Widgets/evaluatedbutton.dart';
import 'package:assignmet_1/Widgets/text.dart';
import 'package:assignmet_1/Widgets/textfield.dart';
import 'package:assignmet_1/Widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String sBtnName = "SendOtp";
  bool bLogin = false;
  void _onRegistration(BuildContext context) {
    Navigator.of(context).pushNamed('/second');
  }

  // ignore: non_constant_identifier_names
  // void _OnPressedOTP(BuildContext context){
  //     if (bVisibility== true){
  //         Navigator.of(context).pushNamed('/venue');
  //     }
  //     if(_edtxtOtp.text.length == 10){
  //       bVisibility = true;
  //       sBtnName = "Login";
  //       setState(() {
  //       });
  //     }

  // }

  final bottomSheetHeightNotifier = ValueNotifier<double>(0.0);

  final TextEditingController _edtxtOtp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CoustTextfield(
                iLength: 10,
                controller: _edtxtOtp,
                inputtype: TextInputType.phone,
                hint: "Phone Number",
                suffixIcon: Icon(Icons.person),
                radius: 8.0,
                width: 10),
            const SizedBox(
              height: 20,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                var isVisible = ref.watch(loadingProvider);
                return Column(
                  children: [
                    isVisible == true
                        ? Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CoustTextfield(
                                      iLength: 1,
                                      inputtype: TextInputType.phone,
                                      hint: "",
                                      radius: 8.0,
                                      width: 10)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: CoustTextfield(
                                      iLength: 1,
                                      inputtype: TextInputType.phone,
                                      hint: "",
                                      radius: 8.0,
                                      width: 10)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: CoustTextfield(
                                      iLength: 1,
                                      inputtype: TextInputType.phone,
                                      hint: "",
                                      radius: 8.0,
                                      width: 10)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: CoustTextfield(
                                      iLength: 1,
                                      inputtype: TextInputType.phone,
                                      hint: "",
                                      radius: 8.0,
                                      width: 10)),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Resend Otp:")
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: CoustEvalButton(
                        onPressed: () {
                          ref.read(loadingProvider.notifier).state = !isVisible;
                          if (bLogin == true) {
                            Navigator.of(context).pushNamed('/venue');
                          } else {
                            if (ref.watch(loadingProvider) == true) {
                              sBtnName = "Login";
                              bLogin = true;
                            } else {
                              sBtnName = "SendOtp";
                            }
                          }
                        },
                        buttonName: sBtnName,
                        width: double.infinity,
                        radius: 8,
                        FontSize: 20,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const coustText(
              sName: "Don't have an account?",
              Textsize: 15,
            ),
            TextButton(
                onPressed: () {
                  _onRegistration(context);
                },
                child: const Text(
                  "Register here",
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 15),
                ))
          ],
        ),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Heading(
                sText1: "Welcome!",
                sText2: "Please login to your Account",
                bVisibil: true,
              ),
            ),
            //Heading(sText1: "",sText2: "Register an Account"),
          ],
        ),
      ),
    );
  }
}
