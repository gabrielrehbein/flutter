class ProductType {
  String id;
  String name;
  double price;
  int quantity;
  String category;

  ProductType({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.category = "Técnologia",
  });
}
