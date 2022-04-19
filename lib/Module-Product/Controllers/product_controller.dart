import 'package:get/get.dart';
import 'package:test_task/Module-API/api_service.dart';
import 'package:test_task/Module-Product/Models/product_model.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductElement>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      List? products = (await ApiService.fetchProducts())?.cast<List>();
        productList.assignAll(products as Iterable<ProductElement>);
    } finally {
      isLoading(false);
    }
  }
}