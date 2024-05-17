import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Heading extends StatelessWidget {
  final  sText1,sText2;
 final bool bVisibil;

  const Heading({
    super.key,
    required this.sText1,
    required this.sText2,
    required this.bVisibil,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
        // decoration: BoxDecoration(color: const Color.fromARGB(255, 108, 23, 255)),
        child:  Padding(
          padding: const EdgeInsets.only(top:0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("BanquetBookz",style: TextStyle(color: Colors.white,fontSize: 30)),
              Visibility(visible: bVisibil,child: Text(sText1,style: const TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold))),
              Text(sText2,style: const TextStyle(color: Colors.white,fontSize: 20,),)],
            ),
          ),
        ));
  }
  Widget custom(){
    return const Center(
        // decoration: BoxDecoration(color: const Color.fromARGB(255, 108, 23, 255)),
        child:  Padding(
          padding: EdgeInsets.only(top:50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("BanquetBookz",style: TextStyle(color: Colors.white,fontSize: 30)),
            ],
          ),
        ));

  }
}
