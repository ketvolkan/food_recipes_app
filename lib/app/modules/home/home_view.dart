import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../common/widgets/appbar/default_app_bar.dart';
import '../common/widgets/other/custom_scaffold.dart';
import '../common/widgets/textfield/search_field.dart';
import '../common/widgets/texts/custom_text.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchField(hintText: "Lezzetli Tarifler Ara!", leadingIcon: Icons.search),
          ],
        ),
      ),
    );
  }

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
