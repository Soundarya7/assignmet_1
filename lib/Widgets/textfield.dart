import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CoustTextfield extends StatefulWidget{
  CoustTextfield({super.key,this.controller,this.inputtype,this.hint,this.suffixIcon,this.iconColor,this.radius,this.width,this.iLength});
  TextEditingController? controller;
  final TextInputType? inputtype;
  final String? hint;
  final Widget? suffixIcon;
  final Color? iconColor;
  final  double? radius;
  final  double? width;
  final  int? iLength;
  @override
  State<CoustTextfield> createState() => _CoustTextfieldState();
}

class _CoustTextfieldState extends State<CoustTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller:widget.controller, 
                                inputFormatters: [
        LengthLimitingTextInputFormatter(widget.iLength),
      ],keyboardType: widget.inputtype,decoration: InputDecoration(
                                hintText: widget.hint,
                                suffixIcon: widget.suffixIcon,
                                suffixIconColor: widget.iconColor,
                                border: OutlineInputBorder(
                                    borderRadius:BorderRadius.all(Radius.circular(widget.radius!)),
                                    borderSide: BorderSide(width: widget.width!)),
                              ),);
  }
}