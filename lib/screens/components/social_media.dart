import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/open_link.dart';
import 'package:sayaaratukum/util/social_media.dart';
import 'package:sayaaratukum/widgets/bottom_sheet.dart';
import 'package:sayaaratukum/widgets/button_action_bottom_sheet.dart';

socialMedia() {
  bottomSheet(
    height: 200,
    widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonActionBottomSheet(
          title: L10n.faceBook.tr,
          localIcon: SocialMedia.iconsFacebook,
          onPressed: () {
            Get.back();
            OpenLink.url(SocialMedia.facebook);
          },
          paddingVertical: 4,
        ),
        ButtonActionBottomSheet(
          title: L10n.twitter.tr,
          localIcon: SocialMedia.iconsTwitter,
          onPressed: () {
            Get.back();
            OpenLink.url(SocialMedia.twitter);
          },
          paddingVertical: 4,
        ),
        ButtonActionBottomSheet(
          title: L10n.instagram.tr,
          localIcon: SocialMedia.iconsInstagram,
          onPressed: () {
            Get.back();
            OpenLink.url(SocialMedia.instagram);
          },
          paddingVertical: 4,
        ),
      ],
    ),
  );
}
