import 'package:flutter/material.dart';
import '../../../data/services/product_service.dart';
import '../../../data/models/product_model.dart';

class HomeScreen extends StatelessWidget {
  final ProductService service = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: StreamBuilder<List<Product>>(
        stream: service.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return Center(child: Text("Barang kosong"));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    errorBuilder: (_, __, ___) => Icon(Icons.image),
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text("Rp ${product.price}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
