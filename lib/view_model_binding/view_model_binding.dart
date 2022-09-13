import 'package:get/get.dart';
import 'package:riverpod/screens/add_products/controller/controller.dart';
import 'package:riverpod/screens/home/controller/model_controller.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListViewModel>(() => ProductListViewModel(), fenix: true);
    Get.lazyPut<ApiAddProducts>(() => ApiAddProducts(), fenix: true);
  }
}