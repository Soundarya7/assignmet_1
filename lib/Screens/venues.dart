import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/models/venues_listmodel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Venuscreen extends StatefulWidget {
  const Venuscreen({super.key});

  @override
  State<Venuscreen> createState() => _VenuscreenState();
}

class _VenuscreenState extends State<Venuscreen> {
  List<BottomNavigationBarItem> botmnav_list = [];
  final List<VenuesListmodel> _items = [];
  int nav_index = 1; // Setting current index to 1 to select search by default

  @override
  void initState() {
    super.initState();
    botmnav_list = [];
    botmnav_list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'));
    botmnav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.search), label: 'Search'));
    botmnav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_rounded), label: 'Manager'));
    botmnav_list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'));

    for (int i = 0; i < 1; i++) {
      _items.add(VenuesListmodel("Swagath Grand", 'images/flutter.jpg', 3.5, 84,
          'Bachupally, Hyderabad\nAug 25, 2023'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoustColors.colrFill,
      bottomNavigationBar: BottomNavigationBar(
        items: botmnav_list,
        currentIndex: nav_index,
        onTap: (ind) {
          switch(ind){
            case 0:  //Home
            break;
            case 1:// Search
            break;
            
          }
        },
      ),
      body: Column(
        children: [
          Padding(
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
                    child: Text("Venues",
                        style: TextStyle(
                            color: CoustColors.colrEdtxt4, fontSize: 20)),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),), 
            Expanded(
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Card(
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0,bottom: 16,right: 16,left: 25),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(),
                                  // Image.asset(
                                  //   "images/flutter.jpg",
                                  //   height: 50,
                                  //   width: 50,
                                  //   fit: BoxFit.fill,
                                  // ),
                                  // Image.network(
                                  //   item.image,
                                  //   width: 50,
                                  //   height: 50,
                                  //   fit: BoxFit.cover,
                                  // ),
                                   SizedBox(width: 16),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.heading,
                                            style:  const TextStyle(
                                              fontSize: 24,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 16),
                                              const SizedBox(width: 4),
                                              Text(
                                                  '${item.rating} (${item.review})',
                                                  style: const TextStyle(fontStyle: FontStyle.italic,
                                                      fontSize:16,color: Colors.black)),
                                                      
                                            ],
                                          ),
                                          Text(
                                            item.description,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: CoustColors.colrSubText,
                                            ),
                                          ),
                                         
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle button press
                                     Navigator.of(context).pushNamed('/venue_details');
                                    print(
                                        'Button pressed for ${item.heading}         ${_items[index]}');
                                  },
                                  child: const Text('View Details'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          
        ],
      ),
    );
  }
}
