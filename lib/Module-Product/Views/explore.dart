import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/Module-Product/Controllers/product_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Explore extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: productController.productList.length,
              itemBuilder: (context, index) => Card(
                      child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  padding: const EdgeInsets.all(15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 350,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          productController
                                              .productList[index].thumbnail,
                                          height: 180,
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      ListTile(
                                        title: Text(productController
                                            .productList[index].title),
                                        subtitle: Text(
                                            "Price - ${productController.productList[index].price.toString()}"),
                                      ),
                                      Center(
                                          child: FlatButton(
                                        color: Colors.deepOrangeAccent,
                                        onPressed: () {},
                                        child: Text("Order Now"),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Image.network(
                        productController.productList[index].thumbnail),
                  )),
              staggeredTileBuilder: (index) => StaggeredTile.count(
                  (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0);
        }
      }),
    );
  }
}
