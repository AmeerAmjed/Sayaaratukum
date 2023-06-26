import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/store_type.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';

class FilterStores extends StatelessWidget {
  const FilterStores({
    Key? key,
    required this.typeActive,
    required this.onClickStores,
    required this.onClickShowrooms,
  }) : super(key: key);

  final StoreType typeActive;
  final VoidCallback onClickStores;
  final VoidCallback onClickShowrooms;

  @override
  Widget build(BuildContext context) {
    Color getBackgroundActiveButton(StoreType type) {
      return typeActive == type ? Get.theme.primaryColor : Get.theme.cardColor;
    }

    Color getColorOnActiveButton(StoreType type) {
      return typeActive == type
          ? Get.theme.backgroundColor
          : Get.theme.primaryColor;
    }

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Buttons(
              padding: EdgeInsets.zero,
              background: getBackgroundActiveButton(StoreType.cars),
              colorOnButton: getColorOnActiveButton(StoreType.cars),
              label: L10n.showrooms.tr,
              onPressed: onClickShowrooms,
            ),
          ),
          const HorizontalSpace8(),
          Expanded(
            child: Buttons(
              padding: EdgeInsets.zero,
              background: getBackgroundActiveButton(StoreType.tools),
              colorOnButton: getColorOnActiveButton(StoreType.tools),
              label: L10n.spareParts.tr,
              onPressed: onClickStores,
            ),
          )
        ],
      ),
    );
  }
}
