import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stage_2/model/products.dart';

class ProductsApi {
  static Future<List<Products>> getProducts() async {
    String id = '79e45231a74a4256b7a35dc3313746d7';
    String appId = 'QR3TT7SDPV6LFEF';
    String apiKey = '1896ad2b73eb4387a31463f8d3fbd70e20240706120534059467';

    final uri = Uri.parse(
        'https://api.timbu.cloud/products?organization_id=$id&Appid=$appId&Apikey=$apiKey');
    final response = await http.get(uri);
    final body = response.body;
    final data = jsonDecode(body);
    final result = data['items'] as List<dynamic>;
    final products = result.map((e) {
      final name = e['name'];
      final priceList = e['current_price'] as List<dynamic>;
      final priceMap = priceList.first as Map<String, dynamic>;
      final prices = priceMap['NGN'] as List<dynamic>;
      final price = prices.isNotEmpty ? prices[0].toString() : 'N/A';
      final photos = e['photos'] as List<dynamic>;
      final photoUrl = photos.isNotEmpty ? photos.first['url'] : 'No Image';
      final description = e['description'] ?? 'not available';
      final unit = e['available_quantity'] ?? 0;

      print(e['available_quantity']);

      return Products(
          name: name,
          price: price,
          src: photoUrl,
          description: description,
          productUnit: unit);
    }).toList();
    return products;
  }
}
