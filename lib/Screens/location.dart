import 'dart:convert';

import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget{
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
   String _address = '';

  String _coordinates = 'Coordinates will be shown here';

  void _getCoordinates() async {
    try {
      final result = await fetchCoordinates(_address);
      setState(() {
        _coordinates = 'Latitude: ${result['lat']}, Longitude: ${result['lon']}';
      });
    } catch (e) {
      setState(() {
        _coordinates = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: CoustColors.colrFill,
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _address = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter address',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCoordinates,
              child: Text('Get Coordinates'),
            ),
            SizedBox(height: 20),
            Text(_coordinates),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchCoordinates(String address) async {
  const String baseUrl = 'https://nominatim.openstreetmap.org/search';
  const String format = 'json';

  final response = await http.get(
    Uri.parse('$baseUrl?q=$address&format=$format&addressdetails=1'),
    headers: {
      'User-Agent': 'YourAppName', // Nominatim requires a User-Agent header
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse.isNotEmpty) {
      return jsonResponse[0];
    } else {
      throw Exception('No results found');
    }
  } else {
    throw Exception('Failed to fetch coordinates');
  }
}
