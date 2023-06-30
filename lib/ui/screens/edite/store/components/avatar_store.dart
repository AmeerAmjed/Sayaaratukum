import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//default_image.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';

class AvatarStore extends StatelessWidget {
  const AvatarStore({
    Key? key,
    this.onTap,
    required this.pathFile,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String name;
  final String? pathFile;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
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
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: ClipOval(
                  child: pathFile == ""
                      ? avatar == Constants.websiteLink
                          ? DefaultImage(
                              name: name,
                              sizeAlphabet: 45,
                            )
                          : CircleAvatar(
                              radius: 50.0,
                              child: ImageLoading(
                                imageUrl: avatar,
                              ),
                            )
                      : CircleAvatar(
                          radius: 48.0,
                          backgroundColor: const Color(0xffd4d4d4),
                          backgroundImage: FileImage(File(pathFile!)),
                        ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onTap,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(
                  Iconsax.gallery_edit,
                  size: 20.0,
                  color: Color(0xFF404040),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
