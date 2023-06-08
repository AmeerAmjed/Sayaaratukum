import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/profile/components/avatar_with_coverUser.dart';
import 'package:sayaaratukum/screens/profile/components/contact_user.dart';
import 'package:sayaaratukum/screens/profile/components/full_name_with_bio.dart';
import 'package:sayaaratukum/util/constant.dart';

class Profile extends GetView<Application> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    void handleClick(String value) {
      switch (value) {
        case L10n.updateProfile:
          controller.navigateTo(RouteScreen.updateProfile);
          break;
        case L10n.updatePassword:
          controller.navigateTo(RouteScreen.updatePassword);
          break;
        case L10n.updateEmail:
          controller.navigateTo(RouteScreen.updateEmail);
          break;
        case L10n.updatePhoneNumber:
          controller.navigateTo(RouteScreen.updatePhoneNumber);
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.profile.tr),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {
                L10n.updateProfile,
                L10n.updatePhoneNumber,
                L10n.updateEmail,
                L10n.updatePassword,
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice.tr,
                    style: Get.textTheme.labelMedium,
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          AvatarWithCoverUser(
            name: controller.user?.value?.fullName ?? "",
            avatar: controller.user?.value?.avatar ?? "",
            cover: Constants.websiteLink,
          ),
          FullNameWithBio(
            fullName: controller.user?.value?.fullName ?? "",
            bio: "",
          ),
          ContactUser(
            numberPhone: controller.user?.value?.phoneNumber ?? "",
            numberPhoneWhatUp: controller.user?.value?.phoneNumber ?? "",
          )
        ],
      ),
      // floatingActionButton: AddButton(
      //   onPressed: () {
      //     bottomSheet(
      //       widget: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           ButtonActionBottomSheet(
      //             title: 'اضافة عرض',
      //             icon: Icons.local_offer_rounded,
      //             onPressed: () {
      //               Get.back();
      //               // Get.toNamed('/addOffer');
      //             },
      //           ),
      //         ],
      //       ),
        //     );
        //   },
        // )
    );
  }
}
