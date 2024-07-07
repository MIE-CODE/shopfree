import 'package:flutter/material.dart';
import 'package:stage_2/pages/product_details.dart';

// ignore: must_be_immutable
class ProductItemTile extends StatefulWidget {
  String productName;
  String productPrice;
  String productSrc;
  String productDescription;

  ProductItemTile(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productSrc,
      required this.productDescription});

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
            Hero(
              tag: 'product-img-${widget.productSrc}',
              child: Image.network(
                'https://api.timbu.cloud/images/${widget.productSrc}',
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
            Text(
              widget.productName,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xff42032C)),
            ),
            MaterialButton(
              onPressed: detail,
              color: const Color(0xffD36B00),
              child: Text(
                '₦ ${widget.productPrice}',
                style: const TextStyle(color: Color(0xff42032C)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
