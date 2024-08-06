import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/color.dart';
import '../data/model/plant_model.dart';
import 'favourite.dart';

// class CartPage extends StatefulWidget {
//   static List<Plants> cartItems = [];

//   const CartPage({super.key});

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     double totalAmount =
//         CartPage.cartItems.fold(0, (sum, item) => sum + item.price);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: CartPage.cartItems.length,
//                 itemBuilder: (context, index) {
//                   final plant = CartPage.cartItems[index];
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: ListTile(
//                       leading: Image.asset(
//                         plant.imagePath,
//                         fit: BoxFit.cover,
//                         width: 50,
//                         height: 50,
//                       ),
//                       title: Text(plant.name),
//                       subtitle: Text('\$${plant.price.toStringAsFixed(0)}'),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.remove_circle_outline),
//                         onPressed: () {
//                           setState(() {
//                             CartPage.cartItems.removeAt(index);
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Divider(),
//             Text(
//               'Total: \$${totalAmount.toStringAsFixed(2)}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: black.withOpacity(0.7),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle the checkout process
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: green,
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 textStyle: const TextStyle(fontSize: 18),
//               ),
//               child: const Center(
//                 child: Text('Proceed to Checkout'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CartPage extends StatefulWidget {
  static List<Plants> cartItems = [];
  static List<Plants> orderItems = [];

  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalAmount =
        CartPage.cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: green,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: CartPage.cartItems.length,
                itemBuilder: (context, index) {
                  final plant = CartPage.cartItems[index];
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
                            CartPage.cartItems.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (CartPage.cartItems.isNotEmpty) {
                  setState(() {
                    CartPage.orderItems.addAll(CartPage.cartItems);
                    CartPage.cartItems.clear();
                  });
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Success'),
                      content: const Text(
                          'Your order has been successfully processed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: green,
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Center(
                child: Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
