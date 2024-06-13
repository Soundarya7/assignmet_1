import 'dart:convert';

import 'package:assignmet_1/models/propertystate.dart';
import 'package:assignmet_1/utils/bbapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:assignmet_1/models/calendrestate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the StateNotifier
class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier() : super(CalendarState(bookedDates: {}));
 

  Future<void> fetchBookedDates(BuildContext context,  Propertystate property,WidgetRef ref) async {
   final prefs = await SharedPreferences.getInstance();
    final extractData =json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    String token = extractData['token'];
    var url ='${Bbapi.get_review}' + '${property.id!}/';
    print("getProperties: ${url}");
    try{
    var response = await http.get(Uri.parse(url),
    headers: {
       'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
       );
    if (response.statusCode == 200) {
      List bookedDates = json.decode(response.body);
      final Map<DateTime, List> datesMap = {
        for (var date in bookedDates)
          if (date['is_approved'] == 'y')
            DateTime.parse(date['date']): ['booked']
      };
      state = CalendarState(bookedDates: datesMap);
    } else {
      throw Exception('Failed to load booked dates');
    }
  }catch (e) {
      print("Exception caught: $e");
      throw Exception('Failed to load properties');
    }
  }
}

// Define the StateProvider
final calendarProvider = StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  return CalendarNotifier();
});