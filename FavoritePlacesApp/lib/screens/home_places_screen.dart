import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places_app/screens/add_place_screen.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:favorite_places_app/providers/user_places.dart';

class HomePlacesScreen extends ConsumerStatefulWidget {
  const HomePlacesScreen({super.key});

  @override
  ConsumerState<HomePlacesScreen> createState() => _HomePlacesScreenState();
}

class _HomePlacesScreenState extends ConsumerState<HomePlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  void addPlace() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;

    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places', style: TextStyle(color: Colors.white)),
        actions: [IconButton(onPressed: addPlace, icon: const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder:
              (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : PlacesList(places: userPlaces),
        ),
      ),
    );
  }
}
