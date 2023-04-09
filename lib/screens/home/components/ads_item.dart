import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sayaaratukum/models/ads.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/loading.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({
    Key? key,
    required this.item,
    required this.width,
  }) : super(key: key);

  final AdsModel item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 150,
      child: item.text == null
          ? Card(
              child: ImageLoading(
                imageUrl: item.imageUrl,
              ),
            )
          : Stack(
              children: [
                Card(
                  child: ClipRRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: ImageLoading(
                        imageUrl: item.imageUrl,
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    item.text ?? "",
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                )),
              ],
            ),
    );
  }
}

class AdsLoading extends StatelessWidget {
  const AdsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 150,
      child: Center(
        child: Loading(),
      ),
    );
  }
}
