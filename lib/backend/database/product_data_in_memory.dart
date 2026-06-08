import 'package:trabalho_final/types/product_type.dart';
import 'package:uuid/uuid.dart';

class ProductDataInMemory {
    static final List<ProductType> products = [
    ProductType(
      id: Uuid().v4(), 
      name: "Initial Data",
      price: 999, 
      quantity: 10
    )
  ];
}