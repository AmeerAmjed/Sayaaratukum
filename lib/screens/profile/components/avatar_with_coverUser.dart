import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class AvatarWithCoverUser extends StatelessWidget {
  const AvatarWithCoverUser({
    Key? key,
    required this.avatar,
    required this.cover,
  }) : super(key: key);

  final String avatar, cover;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 150.0,
                color: Get.theme.cardColor,
                child: ImageLoading(
                  imageUrl: cover,
                ),
              ),
            ],
          ),
          // Profile image
          Positioned(
            left: 16,
            top: 100.0,
            // (background container size) - (circle height / 2)
            child: Container(
              height: 100.0,
              width: 100.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Get.theme.backgroundColor,
                ),
              ),
              child: Container(
                height: 100.0,
                width: 100.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.theme.cardColor,
                ),
                child: ImageLoading(
                  imageUrl: avatar,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
