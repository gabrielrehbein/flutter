import 'package:trabalho_final/backend/dtos/edit_product_dto.dart';
import 'package:trabalho_final/backend/interfaces/product_repository_interface.dart';
import 'package:trabalho_final/backend/database/product_data_in_memory.dart';
import 'package:trabalho_final/backend/dtos/create_product_dto.dart';
import 'package:trabalho_final/types/product_type.dart';
import 'package:uuid/uuid.dart';

class ProductInMemoryRepository implements ProductRepositoryInterface {

  @override
  List<ProductType> all(){
    return ProductDataInMemory.products;
  }

  @override
  ProductType create(CreateProductDTO createProductDTO){
    ProductType product = ProductType(
      id: Uuid().v4(),
      name: createProductDTO.name, 
      price: createProductDTO.price, 
      quantity: createProductDTO.quantity
    );
    ProductDataInMemory.products.add(product);
    return product;
  }

  @override
  void delete(String id){
    ProductDataInMemory.products.removeWhere(
      (ProductType product) => product.id == id,
    );
  }

  @override
  void edit(EditProductDTO editProductDTO) {
      ProductType product = ProductDataInMemory.products.where(
        (ProductType product) => product.id == editProductDTO.id,
      ).first;

      product.name = editProductDTO.name;
      product.price = editProductDTO.price;
      product.quantity = editProductDTO.quantity;
  }
}