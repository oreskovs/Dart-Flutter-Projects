import 'package:favorite_places_app/screens/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places_app/models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlaceDetailsScreen(place: places[index]),
                ),
              );
            },
            title: Text(
              places[index].title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              places[index].location.address,
              style: TextStyle(color: Colors.white),
            ),
          ),
    );
  }
}
