import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/user/profile.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/profile/components/avatar_with_coverUser.dart';
import 'package:sayaaratukum/ui/screens/profile/components/contact_user.dart';
import 'package:sayaaratukum/ui/screens/profile/components/full_name_with_bio.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBars(
        title: L10n.profile.tr,
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
          await controller.updateProfile();
        },
        child: ListView(
          children: [
            GetBuilder<Application>(builder: (state) {
              if (state.user?.value?.isEmailVerified == false ) {
                return Container(
                  color: ColorSystem.colorDanger,
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    L10n.confirmEmail.tr,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              return const Space();
            }),


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
