import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Test Task",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    )
  );
}


