import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/dtos/edit_product_dto.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/backend/repositories/product_in_memory_repository.dart';
import 'package:trabalho_final/frontend/layout/header.dart';
import 'package:trabalho_final/types/product_type.dart';

class EditProduct extends StatefulWidget {
  final VoidCallback onProductEdited;
  final ProductType product;

  const EditProduct({
    Key? key,
    required this.onProductEdited,
    required this.product,
  }) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final List<String> categories = ["Técnologia", "Geral", "Roupa"];
  String? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.product.name;
    _priceController.text = widget.product.price.toString();
    _quantityController.text = widget.product.quantity.toString();
    _selectedCategory = widget.product.category;
  }

  @override
  Widget build(BuildContext context) {
    final ProductRepositoryInterface productRepository =
        ProductInMemoryRepository();
    return Scaffold(
      appBar: Header(title: "Editar Produto"),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite um nome';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Preço'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite um preço';
                }

                if (double.tryParse(value) == null &&
                    double.tryParse(value)! <= 0) {
                  return 'Digite um número válido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(labelText: 'Quantidade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite uma quantidade';
                }

                if (int.tryParse(value)! < 0) {
                  return 'O valor mínimo é zero';
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(categories[0]),
                    value: categories[0],
                    groupValue: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = categories[0];
                        print(_selectedCategory);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(categories[1]),
                    value: categories[1],
                    groupValue: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = categories[1];
                        print(_selectedCategory);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(categories[2]),
                    value: categories[2],
                    groupValue: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = categories[2];
                        print(_selectedCategory);
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                productRepository.edit(
                  EditProductDTO(
                    id: widget.product.id,
                    name: _nameController.text,
                    price: double.parse(_priceController.text),
                    quantity: int.parse(_quantityController.text),
                    category: _selectedCategory!,
                  ),
                );
                widget.onProductEdited();
                Navigator.pop(context);
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
