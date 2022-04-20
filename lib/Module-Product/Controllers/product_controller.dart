import 'package:get/get.dart';
import 'package:test_task/Module-API/api_service.dart';
import 'package:test_task/Module-Product/Models/product_model.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        Rx(productList.value = products as List<Product>);
      }
    } finally {
      isLoading(false);
    }
  }
}