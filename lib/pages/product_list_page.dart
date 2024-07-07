import 'package:flutter/material.dart';
import 'package:stage_2/components/product_item_tile.dart';
import 'package:stage_2/model/products.dart';
import 'package:stage_2/services/products_api.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Products> products = [];
  bool isLoading = true;
  String error = '';
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff42032C),
        title: const Text(
          'Products',
          style: TextStyle(color: Color(0xffFFCBCB)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductItemTile(
                      productName: product.name,
                      productPrice: product.price,
                      productSrc: product.src,
                      productDescription: product.description,
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> getProducts() async {
    try {
      final response = await ProductsApi.getProducts();
      setState(() {
        products = response;
        isLoading = false;
      });
      print(response.length);
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }
}
