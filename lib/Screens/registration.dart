import 'package:assignmet_1/Widgets/evaluatedbutton.dart';
import 'package:assignmet_1/Widgets/textfield.dart';
import 'package:assignmet_1/heading.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}
TextEditingController _edtxtMail = TextEditingController();
TextEditingController _edtxtName = TextEditingController();
TextEditingController _edtxtNum = TextEditingController();
void _onPressed() {}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomSheet:  Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(mainAxisSize:MainAxisSize.min,
                            children: [
                              CoustTextfield(controller: _edtxtMail,inputtype: TextInputType.emailAddress, hint: "Mail",suffixIcon: Icon(Icons.person) ,radius: 8.0,width: 10,),
                              const SizedBox(height: 10,),
                              CoustTextfield(controller: _edtxtName,inputtype:TextInputType.name,hint: "Name",radius: 8,width: 10,),
                              const SizedBox(height: 10,),
                              Row(
                                  children: [
                                    Expanded(flex:1,child: CoustTextfield(controller: _edtxtNum,inputtype: TextInputType.phone,hint:"Phone Number" ,radius: 8,width: 10,),
                                
                                ),
                                const Expanded(flex: 1,child: CoustEvalButton(onPressed:_onPressed ,buttonName:"Verify"  ,radius: 8,width: double.infinity,FontSize: 20,),
                                ),
                              ],
                              ),   
                              const SizedBox(height: 10,),          
                             const SizedBox(
                              width: double.infinity,
                               child: CoustEvalButton(onPressed: _onPressed,FontSize: 20,radius: 8,width: double.infinity,buttonName:"Register" ),
                             ),            
                            ],
                          ),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Heading(
                    sText1: "",
                    sText2: "Register an Account",bVisibil: false,)),
            //Heading(sText1: "",sText2: "Register an Account"),
          ],
        ),
      ),
    );
  }
}
