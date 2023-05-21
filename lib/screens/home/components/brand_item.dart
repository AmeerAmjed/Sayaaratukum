import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    Key? key,
    required this.item,
    required this.width,
  }) : super(key: key);

  final BrandModel item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: Card(
              child: ImageLoading(
                imageUrl: item.imageUrl,
                fitImage: BoxFit.fill,
              ),
            ),
          ),
          const VerticalSpace4(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacing,
              ),
              child: Text(
                item.title.capitalize ?? "",
                style: Theme.of(context).textTheme.overline?.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
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