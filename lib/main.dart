import 'package:flutter/material.dart';
import 'package:stage_2/pages/product_list_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const ProductListPage(),
    },
  ));
}
