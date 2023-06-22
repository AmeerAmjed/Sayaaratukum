import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/notification_model.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    Key? key,
    required this.item,
    required this.onPressedItem,
  }) : super(key: key);

  final NotificationModel item;
  final VoidCallback onPressedItem;

  @override
  Widget build(BuildContext context) {
    String title =
        "${L10n.thisIs.tr} ${item.type.toString().tr} ${item.product?.name} ${L10n.ist.tr} ${item.state.toString().tr}";
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onPressedItem,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(2),
                    width: 100,
                    height: 100,
                    child: Card(
                      color: Get.theme.scaffoldBackgroundColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: ImageLoading(
                        imageUrl: item.imageUrlItem,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.nameStore,
                    style: Get.textTheme.labelMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    color: Colors.white10,
                    child: Text(
                      item.product?.name ?? "",
                      style: Get.textTheme.labelMedium?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    "${L10n.ist.tr} ${item.state.tr}",
                    // style: Get.textTheme.titleMedium,
                    maxLines: 1,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorSystem.arrow,
                size: 14,
              ),
              const HorizontalSpace12(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
