class Product {
  final String name;
  final String price;
  final String src;

  Product({required this.name, required this.price, required this.src});
}

class Products {
  String name;
  String price;
  String src;
  String description;

  Products(
      {required this.name,
      required this.price,
      required this.src,
      required this.description});
}
