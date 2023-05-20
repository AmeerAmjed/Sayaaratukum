import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/screens/stores/components/row_item_stores.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class ItemStores extends StatelessWidget {
  const ItemStores({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  final StoreModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      // height: 85,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              width: 85,
              height: 85,
              child: Card(
                color: Get.theme.scaffoldBackgroundColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ImageLoading(
                  imageUrl: item.avatar,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Get.textTheme.labelLarge,
                  ),
                  RowItemStores(
                    text: item.whatsappNumberPhone,
                    style: Get.textTheme.labelMedium!,
                    icon: Iconsax.call,
                    iconSize: 16,
                    fontSize: 13,
                  ),
                  RowItemStores(
                    text: item.address,
                    style: Get.textTheme.labelSmall!,
                    icon: Iconsax.location,
                    iconSize: 12,
                    paddingHIcon: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
