import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
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
  }
}
