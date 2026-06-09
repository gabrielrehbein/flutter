class CreateProductDTO {
  final String name;
  final double price;
  final int quantity;
  final String category;

  CreateProductDTO({
    required this.name,
    required this.price,
    required this.quantity,
    required this.category,
  });
}
