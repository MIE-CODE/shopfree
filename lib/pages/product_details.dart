import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  String productName;
  String productPrice;
  String productSrc;
  String productDescription;
  ProductDetails(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productSrc,
      required this.productDescription});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffFFCBCB)),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Color(0xffFFCBCB)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff42032C),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Hero(
                tag: 'product-img-${widget.productSrc}',
                child: Image.network(
                  'https://api.timbu.cloud/images/${widget.productSrc}',
                  height: 360,
                  width: 400,
                  repeat: ImageRepeat.noRepeat,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff42032C)),
                    ),
                    Text(
                      '₦ ${widget.productPrice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD36B00)),
                    )
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  child: Text(
                    widget.productName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'About :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(widget.productDescription)
          ],
        ),
      ),
    );
  }
}
