import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/types/product_type.dart';

ListView buildListProduct(ProductRepositoryInterface productRepository){
  List<ProductType> products = productRepository.all();
  return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: [
              Text("Nome: ${products[index].name}"),
              Text("Preço: ${products[index].price.toString()}"),
              Text("Quantidade: ${products[index].quantity.toString()}"),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      productRepository.delete(products[index].id);
                    },
                    child: Icon(Icons.delete),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Editei');
                    },
                    child: Icon(Icons.edit),
                  )
                ],
              ),
              Padding(padding: EdgeInsetsGeometry.all(20))
            ],
            spacing: 100,
          ),
          
          
        );
      },
    );
}