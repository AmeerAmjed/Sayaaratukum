import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/profile.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/profile/components/avatar_with_coverUser.dart';
import 'package:sayaaratukum/screens/profile/components/contact_user.dart';
import 'package:sayaaratukum/screens/profile/components/full_name_with_bio.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.profile.tr),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: controller.handleClick,
            itemBuilder: (BuildContext context) {
              return [
                L10n.updateProfile,
                L10n.updatePhoneNumber,
                L10n.updateEmail,
                L10n.updatePassword,
              ].map((String choice) {
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
      body: RefreshIndicator(
        onRefresh: () async {
          print("loading");
          await controller.updateProfile();
        },
        child: ListView(
          children: [
            // if(controller.user.value.)
            Container(
              color: ColorSystem.colorDanger,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                L10n.confirmEmail.tr,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const VerticalSpace8(),
            AvatarWithCoverUser(
              name: controller.user.value?.fullName ?? "",
              avatar: controller.user.value?.avatar ?? "",
              cover: Constants.websiteLink,
            ),
            FullNameWithBio(
              fullName: controller.user.value?.fullName ?? "",
              bio: "",
            ),
            ContactUser(
              numberPhone: controller.user.value?.phoneNumber ?? "",
              numberPhoneWhatUp: controller.user.value?.phoneNumber ?? "",
            )
          ],
        ),
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
