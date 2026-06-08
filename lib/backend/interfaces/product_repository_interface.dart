import 'package:trabalho_final/backend/dtos/create_product_dto.dart';
import 'package:trabalho_final/backend/dtos/edit_product_dto.dart';
import 'package:trabalho_final/types/product_type.dart';

abstract class ProductRepositoryInterface {
  List<ProductType> all();

  ProductType create(CreateProductDTO createProductDTO);

  void delete(String id);
  void edit(EditProductDTO editProductDTO);

}