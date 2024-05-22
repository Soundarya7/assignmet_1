import 'package:assignmet_1/Providers/loaded.dart';
import 'package:assignmet_1/Providers/phoneauthnotifier.dart';
import 'package:assignmet_1/Widgets/evaluatedbutton.dart';
import 'package:assignmet_1/Widgets/textfield.dart';
import 'package:assignmet_1/Widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

TextEditingController _edtxtMail = TextEditingController();
TextEditingController _edtxtName = TextEditingController();
TextEditingController _edtxtpassword = TextEditingController();
TextEditingController _edtxtNum = TextEditingController();

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet(context);
    });
  }
   void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CoustTextfield(
                controller: _edtxtMail,
                inputtype: TextInputType.emailAddress,
                hint: "Mail",
                suffixIcon: const Icon(Icons.person),
                radius: 8.0,
                width: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              CoustTextfield(
                controller: _edtxtName,
                inputtype: TextInputType.name,
                hint: "Name",
                radius: 8,
                width: 10,
              ), const SizedBox(
                height: 10,
              ),
               CoustTextfield(
                controller: _edtxtpassword,
                password: true,
                hint: "Password",
                radius: 8,
                width: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CoustTextfield(
                      controller: _edtxtNum,
                      inputtype: TextInputType.phone,
                      hint: "Phone Number",
                      radius: 8,
                      width: 10,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Consumer(
                      builder: (context, ref, child) {
                        var loaded = ref.watch(loadingProvider);
                        return CoustEvalButton(
                          onPressed: () {
                            ref
                                .read(phoneAuthProvider.notifier)
                                .phoneAuth(context, _edtxtNum.text.trim(), ref);
                          },
                          buttonName: "Verify",
                          radius: 8,
                          width: double.infinity,
                          FontSize: 20,
                          isLoading: loaded,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child)
                 { var verfication = ref.watch(phoneAuthProvider);
                 
                  return
                  verfication.vrfCompleted == true? 
                  const Row(children: [Expanded(flex:1,child: 
                                              OTPTextField(length: 6,),
                                              ),
                                              ],):Container();
                                               },
              ),
                                            const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) { return  CoustEvalButton(
                      onPressed: () {ref .read(phoneAuthProvider.notifier).signInWithPhoneNumber("",context,ref,_edtxtNum.text.trim());},
                      FontSize: 20,
                      radius: 8,
                      width: double.infinity,
                      buttonName: "Register"); },
                 
                ),
              ),
            ],
          ),
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
  
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Heading(
                  sText1: "",
                  sText2: "Register an Account",
                  bVisibil: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
