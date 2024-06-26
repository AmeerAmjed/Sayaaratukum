import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/stores/components/row_item_stores.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/open_link.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//default_image.dart';
import 'package:sayaaratukum/ui/widgets//horizontal_space.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';

class BottomInfoStore extends StatelessWidget {
  const BottomInfoStore({
    Key? key,
    required this.nameStore,
    required this.imageUrl,
    required this.address,
    this.numberPhone,
    this.whatsappNumberPhone,
  }) : super(key: key);

  final String nameStore;
  final String imageUrl;
  final String address;
  final String? whatsappNumberPhone;
  final String? numberPhone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 38.0,
            width: 38.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.cardColor,
            ),
            child: imageUrl == Constants.websiteLink
                ? DefaultImage(name: nameStore, sizeAlphabet: 20)
                : ImageLoading(
                    imageUrl: imageUrl,
                  ),
          ),
          const HorizontalSpace8(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nameStore,
                  style: Get.textTheme.displayMedium,
                ),
                Container(
                  color: Colors.transparent,
                  child: RowItemStores(
                    text: address,
                    style: Get.textTheme.labelSmall!,
                    icon: Iconsax.location,
                    color: Get.textTheme.displayMedium?.color?.withOpacity(0.5),
                    iconSize: 12,
                    paddingHIcon: 2,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buttons(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.zero,
                  background: Get.theme.scaffoldBackgroundColor,
                  icon: Iconsax.call,
                  colorOnButton: Get.theme.primaryColor,
                  onPressed: () {
                    callNow(numberPhone);
                  },
                ),
                const HorizontalSpace4(),
                Expanded(
                  child: Buttons(
                    width: 150,
                    height: 40,
                    padding: EdgeInsets.zero,
                    background: ColorSystem.whatsApp,
                    iconRow: Icons.whatsapp,
                    label: L10n.chatToBuy.tr,
                    onPressed: () {
                      chatNow(numberPhone);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
