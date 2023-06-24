import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/notification_model.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

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
    return Container(
      padding: const EdgeInsets.all(4),
      margin: EdgeInsets.zero,
      color: item.isRead
          ? Colors.transparent
          : Get.theme.primaryColor.withOpacity(0.15),
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
                const VerticalSpace4(),
                // Container(
                //   color: Colors.white10,
                //   child: Text(
                //    ,
                //     style: Get.textTheme.labelMedium?.copyWith(
                //       overflow: TextOverflow.ellipsis,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     maxLines: 1,
                //   ),
                // ),
                RichText(
                  text: TextSpan(
                    style: Get.textTheme.labelMedium,
                    children: <TextSpan>[
                      TextSpan(text: "${item.type.toString().tr} "),
                      TextSpan(
                        text: item.product?.name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " ${L10n.ist.tr} ${item.state.tr}",
                      ),
                    ],
                  ),
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
    );
    ;
  }
}
