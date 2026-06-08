import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/backend/repositories/product_in_memory_repository.dart';
import 'package:trabalho_final/frontend/layout/build_header.dart';
import 'package:trabalho_final/frontend/pages/create_product.dart';
import 'package:trabalho_final/frontend/pages/edit_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MeusProdutosPage());
  }
}

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MeusProdutosPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  final ProductRepositoryInterface productRepository =
      ProductInMemoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(),
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
