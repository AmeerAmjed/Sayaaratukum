import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/screens/profile/components/add_button.dart';
import 'package:sayaaratukum/screens/profile/components/avatar_with_coverUser.dart';
import 'package:sayaaratukum/screens/profile/components/contact_user.dart';
import 'package:sayaaratukum/screens/profile/components/full_name_with_bio.dart';
import 'package:sayaaratukum/widgets/bottom_sheet.dart';
import 'package:sayaaratukum/widgets/button_action_bottom_sheet.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("Proilfe"),
        ),
        body: ListView(
          children: [
            const AvatarWithCoverUser(
              name: "Ameer",
              avatar: "https://avatars.githubusercontent.com/u/45900975?v=4",
              cover: "https://avatars.githubusercontent.com/u/45900975?v=4",
            ),
            const FullNameWithBio(
              fullName: 'Ameer',
              bio: "ASdasd",
            ),
            ContactUser(
              numberPhone: '0456456456456',
              numberPhoneWhatUp: '345345345345345',
            )
          ],
        ),
        floatingActionButton: AddButton(
          onPressed: () {
            bottomSheet(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonActionBottomSheet(
                    title: 'اضافة عرض',
                    icon: Icons.local_offer_rounded,
                    onPressed: () {
                      Get.back();
                      // Get.toNamed('/addOffer');
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
