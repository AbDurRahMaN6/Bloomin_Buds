import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/color.dart';
import '../data/model/plant_model.dart';

class OrderPage extends StatelessWidget {
  static List<Plants> orderItems = [];

  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orderItems.length,
          itemBuilder: (context, index) {
            final plant = orderItems[index];
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
              ),
            );
          },
        ),
      ),
    );
  }
}
