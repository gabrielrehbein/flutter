
import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/dtos/create_product_dto.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/backend/repositories/product_in_memory_repository.dart';
import 'package:trabalho_final/frontend/layout/build_header.dart';


class CreateProduct extends StatefulWidget {
  final VoidCallback onProductCreated;
  
  const CreateProduct(
    { 
    Key? key,
    required this.onProductCreated,
    }
  ) : super(key: key);

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductRepositoryInterface productRepository = ProductInMemoryRepository();
    return Scaffold(
      appBar: buildHeader(),
      body: Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite um nome'; // Mensagem de erro se estiver vazio
              }
              return null; // Retorna null se estiver tudo certo
            },
          ),
          TextFormField(
            controller: _priceController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Preço'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite um preço'; // Mensagem de erro se estiver vazio
              }

              if (double.tryParse(value) == null && double.tryParse(value)! <= 0){
                return 'Digite um número válido';
              }
              return null; // Retorna null se estiver tudo certo
            },
          ),
          TextFormField(
            controller: _quantityController,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: const InputDecoration(labelText: 'Quantidade'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite uma quantidade'; // Mensagem de erro se estiver vazio
              }

              if (int.tryParse(value)! < 0){
                return 'O valor mínimo é zero';
              }
              return null; // Retorna null se estiver tudo certo
            },
          ),
          ElevatedButton(
            onPressed: (){
              productRepository.create(
                CreateProductDTO(
                  name: _nameController.text,
                  price: double.parse(_priceController.text), 
                  quantity: int.parse(_quantityController.text)
                )
              );
              widget.onProductCreated();
              Navigator.pop(context);
            },
            child: Icon(Icons.add)
          )
        ],
      ),
    )
    );
    
  }
}