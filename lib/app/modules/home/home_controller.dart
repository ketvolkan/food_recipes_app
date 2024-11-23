import 'package:get/get.dart';
import '../../routes/app_routes.dart';

import '../../../../core/utils/getx_extensions.dart';

enum HomeState { Initial, Busy, Loaded, Error }

class HomeController extends GetxController {
  final Rx<HomeState> _state = HomeState.Initial.obs;
  HomeState get state => _state.value;
  set state(HomeState value) => _state.value = value;

  String searchKey = "";

  @override
  void onInit() {
    ever(_state, (HomeState value) {
      switch (value) {
        case HomeState.Busy:
          Get.showProgressDialog();
          break;
        case HomeState.Loaded:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        case HomeState.Error:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        default:
      }
    });
    super.onInit();
  }

  void settingsOnTap() async => Get.toNamed(AppRoutes.settings.path);

  void notificationsOnTap() async => Get.toNamed(AppRoutes.notif.path);
}
