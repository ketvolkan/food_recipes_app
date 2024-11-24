import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../../models/food_models/food_model.dart';
import '../common/widgets/appbar/default_app_bar.dart';
import '../common/widgets/other/custom_scaffold.dart';
import '../common/widgets/textfield/search_field.dart';
import '../common/widgets/texts/custom_text.dart';
import 'home_controller.dart';
import 'widgets/food_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          searchField(),
          SizedBox(height: Utils.normalPadding),
          Expanded(child: foodListView()),
        ],
      ),
    );
  }

  Obx foodListView() {
    return Obx(() {
      if (controller.isReadingData) return Center(child: CircularProgressIndicator(color: Get.theme.primaryColor));
      return (controller.foodList ?? []).isEmpty
          ? const SizedBox.shrink()
          : ListView.separated(
              itemCount: (controller.foodList ?? []).length,
              separatorBuilder: (context, index) => SizedBox(height: Utils.normalPadding),
              itemBuilder: (context, index) {
                FoodModel food = (controller.foodList ?? [])[index];
                return FoodCard(foodModel: food, onTap: () {});
              },
            );
    });
  }

  SearchField searchField() =>
      SearchField(hintText: "Lezzetli Tarifler Ara!", leadingIcon: Icons.search, onChangeComplete: (val) => controller.searchKey = val ?? "");

  DefaultAppBar buildAppBar() {
    return DefaultAppBar(
      title: Row(
        children: [
          CircleAvatar(radius: Get.width * 0.06, child: Image(image: const AssetImage(AppConstants.logoPath), color: Get.theme.primaryColor)),
          SizedBox(width: Utils.lowPadding),
          CustomText.high("Food Recipes", textColor: Get.theme.primaryColor),
        ],
      ),
      centerTitle: false,
      actions: [settingsIcon(), SizedBox(width: Utils.lowPadding), notificationsIcon()],
    );
  }

  InkWell settingsIcon() => InkWell(
        onTap: () => controller.settingsOnTap(),
        child: CircleAvatar(
          radius: Utils.normalIconSize,
          backgroundColor: ColorTable.getTextColor.withOpacity(0.03),
          child: Icon(Icons.settings_outlined, color: ColorTable.getTextColor, size: Utils.normalIconSize),
        ),
      );
  InkWell notificationsIcon() => InkWell(
        onTap: () => controller.notificationsOnTap(),
        child: CircleAvatar(
          radius: Utils.normalIconSize,
          backgroundColor: ColorTable.getTextColor.withOpacity(0.03),
          child: Icon(Icons.notifications_none_rounded, color: ColorTable.getTextColor, size: Utils.normalIconSize),
        ),
      );
}
