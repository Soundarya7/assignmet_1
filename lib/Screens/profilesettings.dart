import 'dart:convert';

import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Widgets/evaluatedbutton.dart';
import 'package:assignmet_1/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetingsScreen extends StatefulWidget {
  const ProfileSetingsScreen({super.key});

  @override
  State<ProfileSetingsScreen> createState() => _ProfileSetingsScreenState();
}

class _ProfileSetingsScreenState extends State<ProfileSetingsScreen> {
  final _validationkey = GlobalKey<FormState>();
   String sUsername = "example1";
    String smail = "example@email.com";
    String snum = "1234567890";
  final TextEditingController _dobController = TextEditingController();
 // final TextEditingController nameController = TextEditingController(text: "Name");
  

  @override
  void initState() {
    super.initState();
    _dobController.text =
        DateFormat('dd - MM - yyyy').format(DateTime(1990, 1, 1));
        GetData();
        
  }
  Future<void> GetData() async {
      final prefs = await SharedPreferences.getInstance();
      final extractData =
          json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
      String sname = extractData['username'];
      String smailid = extractData['email'];
      String snumber = extractData['mobileno'];
      setState(() {
        sUsername = sname;
        smail = smailid;
        snum = snumber;
      });
    }
   
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = DateFormat('dd - MM - yyyy').format(picked);
      });
    }
  }
 TextEditingController _edtxtMail = TextEditingController();
  TextEditingController _edtxtName = TextEditingController();
  TextEditingController _edtxtNum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoustColors.colrFill,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 90,
              // ignore: unnecessary_const
              decoration: const BoxDecoration(
                  color: Color(0xFF6418C3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(25),
                      bottomStart: Radius.circular(25))),
              child: const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 15),
                child: Text("Profile Settings",
                    style:
                        TextStyle(color: CoustColors.colrEdtxt4, fontSize: 20)),
              ),
            ),
            Form(
              key: _validationkey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustTextfield(
                      isVisible: true,
                      title: "Name",
                      controller: _edtxtNum,
                      inputtype: TextInputType.phone,
                      hint: sUsername,
                      radius: 8,
                      width: 10,
                      validator: (_edtxtName) {
                        if (_edtxtName == null || _edtxtName.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CoustTextfield(
                      isVisible: true,
                      title: "Email",
                      controller: _edtxtMail,
                      inputtype: TextInputType.phone,
                      hint: smail,
                      radius: 8,
                      width: 10,
                      validator: (_edtxtMail) {
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (_edtxtMail == null || _edtxtMail.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!emailRegex.hasMatch(_edtxtMail)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CoustTextfield(
                      isVisible: true,
                      title: "Phone Number",
                      controller: _edtxtNum,
                      inputtype: TextInputType.phone,
                      hint: snum,
                      radius: 8,
                      width: 10,
                      validator: (_edtxtNum) {
                        if (_edtxtNum == null || _edtxtNum.isEmpty) {
                          return 'Please enter Mobile Number';
                        }
                        if (_edtxtNum.length < 13) {
                          return 'Please enter 10 digit Mobile Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Text("Date of Birth"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onTap: () {
                        _selectDate(context);
                      },
                      controller:_dobController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(8)),
                            borderSide: BorderSide(width: 10)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CoustTextfield(
                      isVisible: true,
                      title: "Location",
                      controller: _edtxtNum,
                      inputtype: TextInputType.phone,
                      hint: "Hyderabad",
                      radius: 8,
                      width: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            CoustEvalButton(
              onPressed: () {
                if (_validationkey.currentState!.validate()) {}
              },
              buttonName: "Update",
              radius: 8,
              width: double.infinity,
              FontSize: 20,
            )
          ],
        ),
      ),
    );
  }
}