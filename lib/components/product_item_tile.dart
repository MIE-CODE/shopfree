import 'package:flutter/material.dart';
import 'package:stage_2/pages/product_details.dart';

// ignore: must_be_immutable
class ProductItemTile extends StatefulWidget {
  String productName;
  String productPrice;
  String productSrc;
  String productDescription;
  double productUnit;

  ProductItemTile(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productSrc,
      required this.productDescription,
      required this.productUnit});

  @override
  State<ProductItemTile> createState() => _ProductItemTileState();
}

class _ProductItemTileState extends State<ProductItemTile> {
  void detail() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetails(
                  productName: widget.productName,
                  productPrice: widget.productPrice,
                  productSrc: widget.productSrc,
                  productDescription: widget.productDescription,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Color unitColor = widget.productUnit < 1.0
        ? const Color(0xffdc143c)
        : const Color.fromARGB(255, 52, 158, 100);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: const Offset(0, 3),
                  color: Colors.black.withOpacity(0.05))
            ],
            color: const Color(0xffE6D2AA),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              onTap: detail,
              contentPadding: const EdgeInsets.only(right: 20, left: 0),
              leading: Hero(
                tag: 'product-img-${widget.productSrc}',
                child: Image.network(
                  'https://api.timbu.cloud/images/${widget.productSrc}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
              title: Text(
                widget.productName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff42032C)),
              ),
              subtitle: Row(
                children: [
                  const Text(
                    'Unit: ',
                    style: TextStyle(color: Color.fromARGB(255, 53, 68, 203)),
                  ),
                  Text(
                    '${widget.productUnit}',
                    style: TextStyle(color: unitColor),
                  )
                ],
              ),
              trailing: MaterialButton(
                onPressed: detail,
                color: const Color(0xffF1EFDC),
                child: Text(
                  '₦ ${widget.productPrice}',
                  style: const TextStyle(color: Color(0xff42032C)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
