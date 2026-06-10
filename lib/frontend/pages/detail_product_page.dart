import 'package:flutter/material.dart';
import 'package:trabalho_final/frontend/layout/header.dart';
import 'package:trabalho_final/types/product_type.dart';

class DetailProductPage extends StatelessWidget {
  final ProductType product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: "Detalhes do Produto"),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ID: ${product.id}", style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text("Nome: ${product.name}", style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text(
              "Preço: R\$ ${product.price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              "Quantidade: ${product.quantity}",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              "Categoria: ${product.category}",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
