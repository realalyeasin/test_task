import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/Module-Product/Controllers/product_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
          return Center(
            child: Text(productController.productList.length.toString()),
          );
      }),
    );
  }
}

