import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Keranjang")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];

                return ListTile(
                  leading: Image.network(item.image, width: 50),
                  title: Text(item.name),
                  subtitle: Text("Rp ${item.price}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeItem(item);
                    },
                  ),
                );
              },
            ),
          ),

          // 🔥 TOTAL
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Total: Rp ${cart.totalPrice}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Checkout berhasil")),
                    );
                  },
                  child: Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
