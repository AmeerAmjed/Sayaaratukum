import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/models/favorite.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ItemFavorite extends StatelessWidget {
  const ItemFavorite({
    Key? key,
    required this.item,
    required this.buttonFavorite,
  }) : super(key: key);
  final FavoriteModel item;
  final Widget buttonFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Card(
                child: ImageLoading(
                  imageUrl: item.product!.images.first.imageUrl,
                ),
              ),
              buttonFavorite
            ],
          ),
        ),
        const VerticalSpace4(),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            currency(item.product!.price),
            style: Get.textTheme.titleMedium,
            maxLines: 1,
          ),
        ),
        const VerticalSpace12(),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            item.product!.name,
            style: Get.textTheme.labelMedium?.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
