import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/repositories/product_in_memory_repository.dart';
import 'package:trabalho_final/frontend/layout/build_header.dart';
import 'package:trabalho_final/types/product_type.dart';

class ConfirmDeleteProduct extends StatelessWidget {
  final ProductType product;
  final VoidCallback onConfirm;

  const ConfirmDeleteProduct({
    Key? key,
    required this.product,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Tem certeza que deseja deletar o produto ${product.name}?",
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    onConfirm();
                    ProductInMemoryRepository().delete(product.id);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Deletar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
