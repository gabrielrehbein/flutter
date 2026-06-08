import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/backend/repositories/product_in_memory_repository.dart';
import 'package:trabalho_final/frontend/layout/build_header.dart';
import 'package:trabalho_final/frontend/pages/create_product.dart';
import 'package:trabalho_final/frontend/pages/edit_product.dart';

class ListProduct extends StatefulWidget {
  final ProductRepositoryInterface productRepository;

  const ListProduct({super.key, required this.productRepository});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    final products = widget.productRepository.all();

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${products[index].id}"),
                Text("Nome: ${products[index].name}"),
                Text(
                  "Preço: R\$ ${products[index].price.toStringAsFixed(2)}",
                ),
                Text("Quantidade: ${products[index].quantity}"),
              ],
            ),
            trailing: Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProduct(
                          onProductEdited: () {
                            setState(() {});
                          },
                          product: products[index],
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      widget.productRepository.delete(products[index].id);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
