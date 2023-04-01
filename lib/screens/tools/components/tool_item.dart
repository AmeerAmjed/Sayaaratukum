import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ToolItem extends StatelessWidget {
  const ToolItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ToolModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            child: ImageLoading(
              imageUrl: item.imageUrl,
            ),
          ),
        ),
        const VerticalSpace4(),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            currency(item.price),
            style: Get.textTheme.titleMedium,
            maxLines: 1,
          ),
        ),
        const VerticalSpace12(),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            item.name,
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

class BrandItemLoading extends StatelessWidget {
  const BrandItemLoading({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: const Loading(),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
