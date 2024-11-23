import 'package:flutter/material.dart';

import '../common/widgets/appbar/home_app_bar.dart';
import '../common/widgets/other/custom_scaffold.dart';
import '../common/widgets/texts/custom_text.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Utils.normalPadding),
            CustomText("Selamın ALEYKÜMM"),
          ],
        ),
      ),
    );
  }

  HomeAppBar buildAppBar() {
    return HomeAppBar(
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
