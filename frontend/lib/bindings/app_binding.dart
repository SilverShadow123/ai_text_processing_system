import 'package:get/get.dart';

import '../controllers/process_controllers.dart';
import '../services/api_services.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<ProcessController>(() => ProcessController());
  }
}