import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/default_image.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class AvatarWithCoverUser extends StatelessWidget {
  const AvatarWithCoverUser({
    Key? key,
    required this.name,
    required this.avatar,
    required this.cover,
  }) : super(key: key);

  final String avatar, cover, name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 150.0,
                color: Get.theme.cardColor,
                child: cover == Constants.websiteLink
                    ? Center(
                        child: Text(
                          name.substring(0, 1),
                          style: Get.textTheme.titleLarge?.copyWith(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : ImageLoading(
                        imageUrl: cover,
                      ),
              ),
            ],
          ),
          // Profile image
          Positioned(
            left: 16,
            top: 100.0,
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
                child: avatar == Constants.websiteLink
                    ? DefaultImage(
                        name: name,
                        sizeAlphabet: 45,
                      )
                    : ImageLoading(
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
