import 'package:flutter/material.dart';

class CoustEvalButton extends StatelessWidget{
  const CoustEvalButton({super.key,this.onPressed,this.buttonName,this.bgColor,this.width,this.radius,this.textColor,this.FontSize});
 final VoidCallback? onPressed;
 final String? buttonName;
 final MaterialStateProperty<Color?>? bgColor;
 final double? width;
 final double? radius;
 final Color? textColor;
 final double? FontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child:Text(buttonName!,style: TextStyle(color: textColor, fontSize: FontSize),),style: ButtonStyle(
                                      backgroundColor:bgColor,
                                      maximumSize: MaterialStatePropertyAll(
                                          Size.fromWidth(width!)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(radius!))))),);
  }
  
}