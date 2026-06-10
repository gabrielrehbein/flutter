import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/frontend/pages/confirm_delete_product.dart';
import 'package:trabalho_final/frontend/pages/detail_product_page.dart';
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
    return ListView(
      children: [
        ...products.map((product) {
          return Card(
            child: ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nome: ${product.name}"),
                  Text("Preço: R\$ ${product.price.toStringAsFixed(2)}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailProductPage(product: product),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.yellow),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProduct(
                            onProductEdited: () {
                              setState(() {});
                            },
                            product: product,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmDeleteProduct(
                            onConfirm: () {
                              setState(() {});
                            },
                            product: product,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
