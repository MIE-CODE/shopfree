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
  double productUnit;

  Products(
      {required this.name,
      required this.price,
      required this.src,
      required this.description,
      required this.productUnit});
}
