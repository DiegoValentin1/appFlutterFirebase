
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diego_administracion_flutter/entities/restaurant.dart';
import 'package:diego_administracion_flutter/utils/list_restaurant_data.dart';
import 'package:diego_administracion_flutter/utils/restaurant_details.dart';
import 'package:flutter/material.dart';
//AIzaSyACBx0cfvInzNy7RmaiEaP8L_pN1rEdgxs

//AIzaSyBVNt30TteZTnBYaIB8dJ68ntjW9W0rX_w
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  List<Restaurant> restaurants = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    db.collection("restaurants").snapshots().listen((event) {
      restaurants = [];
      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()["name"],
          doc.data()["description"],
          List<String>.from(doc.data()["images"]),
          doc.data()["rating"],
          doc.data()["count"],
          doc.data()["latitud"],
          doc.data()["longitud"],
        );
        restaurants.add(restaurant);
      }
      if (mounted) {
        setState(() {
          loading = false;
        });
        print(restaurants[0].longitude);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetails(
                    name: restaurants[index].name,
                    rating: restaurants[index].rating,
                    images: restaurants[index].images,
                    description: restaurants[index].description,
                    latitude: restaurants[index].latitude,
                    longitude: restaurants[index].longitude,
                  ),
                ),
              );
            },
            child: ListRestaurantData(restaurant: restaurants[index]),
          );
        },
      ),
    );
  }
}

