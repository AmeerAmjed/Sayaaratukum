import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';

class CoverStore extends StatelessWidget {
  const CoverStore({
    super.key,
    this.imageCoverPathFile,
    required this.cover,
    required this.name,
  });

  final String? imageCoverPathFile;
  final String cover, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Get.theme.cardColor,
      child: imageCoverPathFile != ""
          ? Image(
              width: double.maxFinite,
              height: 150.0,
              fit: BoxFit.cover,
              image: FileImage(
                File(imageCoverPathFile!),
              ),
            )
          : (cover == Constants.websiteLink
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
                )),
    );
  }
}
