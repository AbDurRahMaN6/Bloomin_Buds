import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/color.dart';
import '../data/model/plant_model.dart';

class FavoritePage extends StatefulWidget {
  static List<Plants> favoriteItems = [];

  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: FavoritePage.favoriteItems.length,
          itemBuilder: (context, index) {
            final plant = FavoritePage.favoriteItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset(
                  plant.imagePath,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                title: Text(plant.name),
                subtitle: Text('\$${plant.price.toStringAsFixed(0)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    setState(() {
                      FavoritePage.favoriteItems.removeAt(index);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
