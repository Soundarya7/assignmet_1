import 'package:assignmet_1/Widgets/evaluatedbutton.dart';
import 'package:assignmet_1/Widgets/text.dart';
import 'package:assignmet_1/Widgets/textfield.dart';
import 'package:assignmet_1/heading.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {
    bool bVisibility = false;
    String  sBtnName = "SendOtp";

   void _onRegistration(BuildContext context) {
   Navigator.of(context).pushNamed('/second');
  }

  // ignore: non_constant_identifier_names
  void _OnPressedOTP(BuildContext context){
      if(_edtxtOtp.text.length == 10){
        bVisibility = true;
        sBtnName = "Login";
        setState(() {
        });
      }

  }
  final TextEditingController _edtxtOtp = TextEditingController();
  @override
   Widget build(BuildContext context) {
    return  Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(mainAxisSize:MainAxisSize.min, children: [
                    CoustTextfield(iLength: 10,controller: _edtxtOtp,inputtype:TextInputType.phone,hint: "Phone Number",suffixIcon:Icon(Icons.person),radius:8.0,width:10),
                    const SizedBox(
                      height: 20,
                    ),
                      Visibility(
                        visible: bVisibility,
                        child: Row(children: [Expanded(flex:1,child: CoustTextfield(iLength: 1,inputtype:TextInputType.phone,hint: "",radius:8.0,width:10)),
                                                      const SizedBox(width: 10,),
                                                      Expanded(flex: 1,child: CoustTextfield(iLength: 1,inputtype:TextInputType.phone,hint: "",radius:8.0,width:10)),
                                                      const SizedBox(width: 10,),
                                                      Expanded(flex: 1,child: CoustTextfield(iLength: 1,inputtype:TextInputType.phone,hint: "",radius:8.0,width:10)),
                                                      const SizedBox(width: 10,),
                                                      Expanded(flex: 1,child: CoustTextfield(iLength: 1,inputtype:TextInputType.phone,hint: "",radius:8.0,width:10)),   
                                                      const SizedBox(width: 10,),
                                                      const Text("Resend Otp:")
                                                      ],),
                      ),const SizedBox(
                      height: 20,
                      ),
                      SizedBox(
                      height: 50,
                      width: double.infinity,
                      child:CoustEvalButton(onPressed: (){_OnPressedOTP(context);},buttonName:sBtnName,width: double.infinity,radius: 8,FontSize: 20,),
                    ),
                       const SizedBox( 
                      height: 30,
                    ),
                  
                    const coustText(sName: "Don't have an account?",Textsize: 15,),
                    TextButton(
                      onPressed: (){_onRegistration(context);},
                        child: const Text(
                          "Register here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                             fontSize: 15),
                        ))
                  ],),
      ),

      
      body: const Center(
        child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Heading(
                          sText1: "Welcome!",
                          sText2: "Please login to your Account",bVisibil: true,),
                    )),

                //Heading(sText1: "",sText2: "Register an Account"),
            
              ],
            ),
      ),
    );
      
  }
}