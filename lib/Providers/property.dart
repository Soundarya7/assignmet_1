import 'dart:convert';

import 'package:assignmet_1/models/propertystate.dart';
import 'package:assignmet_1/utils/bbapi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PropertyNotifier extends StateNotifier<Propertystate> {
  PropertyNotifier() : super(Propertystate());
  

  Future<List<Propertystate>> getProperties() async {
    final prefs = await SharedPreferences.getInstance();
    final extractData =json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    String token = extractData['token'];
    print("getProperties: ${token}");

    const url = Bbapi.properties;
    try{
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Token $token',
      },
    );
     print("HTTP Response: ${response.statusCode} - ${response.body}");
     var userDetails = json.decode(response.body);
      print("Response: ${userDetails}");
       if (response.statusCode == 200) {
        print("Response 200");
        List<dynamic> userDetails = json.decode(response.body);
        if (userDetails.isNotEmpty) {
          final property = userDetails.first;
            print("property: ${property}");
                   
            state = state.copyWith(
            id: property['id'] as int?,
            propertyPic: property['property_pic'] as String?,
            address1: property['address_1'] as String?,
            address2: property['address_2'] as String?,
            reviewCount: property['review_count'] as int?,
            averageRating: (property['average_rating'] as num?)?.toDouble(),
            location: property['location'] as String?,
            state: property['state'] as String?,
            city: property['city'] as String?,
            pincode: property['pincode'] as String?,
            activationStatus: property['activation_status'] as String?,
          );
          print(state.state);
           return userDetails.map((json) => Propertystate.fromJson(json)).toList();
        }
        else {
          print("Response 200 but empty body");
          throw Exception('No properties found');
        }
      } else {
        print("Failed response: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to load properties');
      }
    } catch (e) {
      print("Exception caught: $e");
      throw Exception('Failed to load properties');
    }
  }
}

final propertyprovider =
    StateNotifierProvider<PropertyNotifier, Propertystate>((ref) {
  return PropertyNotifier();
});
