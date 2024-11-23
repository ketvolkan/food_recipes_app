import '../../routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../core/services/storage/custom_storage_service.dart';
import '../../../../core/services/storage/storage_key_enums.dart';
import '../../../../core/utils/utils.dart';

class SplashController extends GetxController {
  String loading = "Loading...";

  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(AppRoutes.home.path);
    super.onReady();
  }
}
