import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Module-Product/Models/product_model.dart';

class ApiService{
  static var client = http.Client();

  static Future<List<ProductElement>?> fetchProducts() async {
    var response = await client.get(Uri.parse('https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9'));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        debugPrint("done");
        return productFromJson(jsonString);
      }
    } catch (e){
      throw e;
    }
  }
}