import 'package:get/get.dart';

import '../../../../core/utils/getx_extensions.dart';
import '../../models/food_models/food_model.dart';
import '../../routes/app_routes.dart';

enum HomeState { Initial, Busy, Loaded, Error }

class HomeController extends GetxController {
  final Rx<HomeState> _state = HomeState.Initial.obs;
  HomeState get state => _state.value;
  set state(HomeState value) => _state.value = value;

  String searchKey = "";

  final Rx<List<FoodModel>?> _foodList = Rx(null);
  List<FoodModel>? get foodList => _foodList.value;
  set foodList(List<FoodModel>? val) => _foodList.value = val;

  final Rx<bool> _isReadingData = false.obs; //Listview'in o an veri çekip çekmediğini tutar
  bool get isReadingData => _isReadingData.value;
  set isReadingData(bool val) => _isReadingData.value = val;

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

  @override
  void onReady() async {
    await getAllFood();
    super.onReady();
  }

  Future<void> getAllFood() async {
    foodList?.clear();
    isReadingData = true;
    await Future.delayed(const Duration(seconds: 2));
    foodList = List.generate(
      20,
      (index) => FoodModel(
        id: index,
        name: "Yemek Adı",
        time: index + 30,
        imageUrl:
            "https://media.istockphoto.com/id/1349381997/tr/foto%C4%9Fraf/female-hands-with-bowl-of-pumpkin-soup.jpg?s=612x612&w=0&k=20&c=kas1OpAa2jskOq4V74YcV_gU_I3hc2keWqzjB3G3lZA=",
      ),
    );
    isReadingData = false;
  }

  void settingsOnTap() async => Get.toNamed(AppRoutes.settings.path);

  void notificationsOnTap() async => Get.toNamed(AppRoutes.notif.path);
}
