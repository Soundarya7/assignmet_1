import 'dart:convert';

import 'package:assignmet_1/models/ratingmodel.dart';
import 'package:assignmet_1/utils/bbapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RatingNotifier extends StateNotifier<RatingState>{
  RatingNotifier():super(RatingState());
  
Future<void> postreviews(BuildContext context, int? id,
      double? rating, String? review,  WidgetRef ref) async {
         final prefs = await SharedPreferences.getInstance();
    final extractData =json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    String token = extractData['token'];
    print("getProperties: ${token}");
    const url = Bbapi.post_review;

    var response = await http.post(Uri.parse(url),
    headers: {
        'Authorization': 'Token $token',
      },
        body: json.encode({
          "property": id!,
          "rating": rating!,
          "review": review!,
        }));
    print("username: $id!");
    var userDetails = json.decode(response.body);
    print('booking response:$userDetails');
    print('booking response Status Code:${response.statusCode}');
    switch (response.statusCode) {
      case 201:
       
        print('success');
        showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Registation successful'),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        Navigator.of(context).pushNamed('/');  //Goto Login page if Registered succesfully
        break;
      case 400:
        showDialog(
            context: context!,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Failed'),
                content: Text("$userDetails"),
                actions: [
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        break;
    }
    // Handle other status codes as needed
  }

}
final ratingprovider =
    StateNotifierProvider<RatingNotifier, RatingState>((ref) {
  return RatingNotifier();
});
