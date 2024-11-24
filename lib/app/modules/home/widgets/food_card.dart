import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../models/food_models/food_model.dart';
import '../../common/widgets/buttons/custom_elevated_button.dart';
import '../../common/widgets/texts/custom_text.dart';

class FoodCard extends StatelessWidget {
  final FoodModel foodModel;
  final Function()? onTap;
  const FoodCard({super.key, required this.foodModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageSide(),
          SizedBox(width: Utils.normalPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.high("${foodModel.name}", bold: true),
              SizedBox(height: Utils.extraLowPadding),
              CustomText("Tarifiniz ${foodModel.time} Dakikada Hazır"),
              SizedBox(height: Utils.normalPadding),
              buttonSide(),
            ],
          ),
        ],
      ),
    );
  }

  CustomElevatedButton buttonSide() {
    return CustomElevatedButton(
      backgroundColor: Get.theme.primaryColor,
      onPressed: onTap,
      elevation: 2,
      child: CustomText("Tarif İçin Hemen Tıkla!", textColor: ColorTable.getReversedTextColor),
    );
  }

  CircleAvatar imageSide() {
    return CircleAvatar(
      backgroundColor: Get.theme.primaryColor,
      radius: Get.width * 0.155,
      child: SizedBox.square(
        dimension: Get.width * 0.3,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Utils.extraHighRadius * 3),
            image: DecorationImage(image: NetworkImage(foodModel.imageUrl ?? AppConstants.imagePlaceHolder), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
