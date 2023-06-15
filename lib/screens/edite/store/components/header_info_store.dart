import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/user/update/store.dart';
import 'package:sayaaratukum/screens/edite/store/components/avatar_store.dart';
import 'package:sayaaratukum/screens/edite/store/components/cavor_store.dart';
import 'package:sayaaratukum/widgets/edite_samll_button.dart';

class AvatarWithCoverStore extends GetView<UpdateStoreProfileController> {
  const AvatarWithCoverStore({
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
              Stack(
                children: [
                  GetBuilder<UpdateStoreProfileController>(
                    builder: (co) {
                      return CoverStore(
                        cover: cover,
                        name: name,
                        imageCoverPathFile: co.imageCoverPathFile.value,
                      );
                    },
                  ),
                  EditeSmallButton(
                    icon: Iconsax.gallery_edit,
                    onPressed: controller.onClickChangeImageCover,
                  )
                ],
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: 100.0,
            child: GetBuilder<UpdateStoreProfileController>(
              builder: (co) {
                return AvatarStore(
                  pathFile: co.imageAvatarPathFile.value,
                  name: name,
                  avatar: avatar,
                  onTap: controller.onClickChangeImageAvatar,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
