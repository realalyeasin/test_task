import 'package:get/get.dart';
import '../Module-Home/Bindings/home_bindings.dart';
import '../Module-Home/Views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: ()=> HomeView(),
      binding: HomeBinding()
    )
  ];
}

