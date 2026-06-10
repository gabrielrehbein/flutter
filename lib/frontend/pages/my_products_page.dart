import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/backend/repositories/product_in_memory_repository.dart';
import 'package:trabalho_final/frontend/components/list_product.dart';
import 'package:trabalho_final/frontend/layout/header.dart';
import 'package:trabalho_final/frontend/pages/create_product.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  final ProductRepositoryInterface productRepository =
      ProductInMemoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListProduct(productRepository: productRepository),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateProduct(
                onProductCreated: () {
                  setState(() {});
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
