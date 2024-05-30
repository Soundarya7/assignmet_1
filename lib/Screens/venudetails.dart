import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:flutter/material.dart';

class VenuDetailsScreen extends StatefulWidget {
  const VenuDetailsScreen({super.key});

  @override
  State<VenuDetailsScreen> createState() => _VenuDetailsScreenState();
}

class _VenuDetailsScreenState extends State<VenuDetailsScreen> {
  String sName = "Swagath Grand banquet hall";
  String imagePath = "images/flutter.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoustColors.colrFill,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
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
                padding: EdgeInsets.only(top: 25.0, left: 15),
                child: Text("Venue Details",
                    style:
                        TextStyle(color: CoustColors.colrEdtxt4, fontSize: 20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hall Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            imagePath,
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          sName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        const Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Plot No. 2-4, 70/26/1/2, Alkapuri \'X\' Roads, Nagole, Hyderabad, Telangana 500068',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.grey),
                            SizedBox(width: 8.0),
                            Text(
                              '040 2212 3456',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.grey),
                            SizedBox(width: 8.0),
                            Text(
                              'swagathgrand@gmail.com',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.directions, color: Colors.teal),
                            SizedBox(width: 8.0),
                            TextButton(
                              onPressed: () {
                                // Handle Get Directions
                              },
                              child: Text(
                                'Get Directions',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.teal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Wrap(
                          spacing: 8.0,
                          children: [
                            Chip(
                              label: Text('Banquet Hall'),
                              backgroundColor: Colors.purple[100],
                            ),
                            Chip(
                              label: Text('Hotel'),
                              backgroundColor: Colors.purple[100],
                            ),
                            Chip(
                              label: Text('Function Hall'),
                              backgroundColor: Colors.purple[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Customer reviews',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star_half, color: Colors.amber),
                            Icon(Icons.star_border, color: Colors.amber),
                            SizedBox(width: 8.0),
                           
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 20,),
                             Text('3.6 out of 5'),
                            SizedBox(width: 8.0),
                            Text('85 total ratings'),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                // Handle view more reviews
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Recent reviews',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ReviewCard(),
                  ReviewCard(),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle see more reviews
                      },
                      child: Text('See more reviews'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Handle leave a review
                      },
                      child: Text('Leave a review',
                          style: TextStyle(color: Colors.purple)),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle book
                      },
                      child: Text('Book'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/50'), // Placeholder image URL
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Top reviews',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Excellent service',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.0),
            Text(
              'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat vo',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
