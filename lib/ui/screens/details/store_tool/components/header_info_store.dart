import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/public/store/store_tool_info_details.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//store_tool.dart';
import 'package:sayaaratukum/ui/screens/profile/components/avatar_with_coverUser.dart';
import 'package:sayaaratukum/ui/screens/profile/components/contact_user.dart';
import 'package:sayaaratukum/ui/screens/profile/components/full_name_with_bio.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//empty.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';

class HeaderInfoToolStore extends GetView<InfoStoreToolDetails> {
  const HeaderInfoToolStore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return controller.obx(
        onError: (e) {
          return Container(
            color: ColorSystem.colorDanger,
            alignment: Alignment.center,
            height: 50,
            child: Text(
              e.toString(),
            ),
          );
        },
        onLoading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Loading(),
        ),
        onEmpty: Empty(
          title: L10n.empty.tr,
          icon: Iconsax.clipboard_close,
          height: height - 300,
        ),
        (state) {
          return _InfoHeader(
            store: state!,
          );
        });
  }
}

class _InfoHeader extends StatelessWidget {
  const _InfoHeader({
    Key? key,
    required this.store,
  }) : super(key: key);

  final StoreToolModel store;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AvatarWithCoverUser(
          name: store.name,
          avatar: store.avatar,
          cover: store.cover,
        ),
        FullNameWithBio(
          fullName: store.name,
          bio: store.description ?? "",
        ),
        ContactUser(
          numberPhone: store.whatsappNumberPhone,
          numberPhoneWhatUp: store.whatsappNumberPhone,
        ),
        // GetBuilder<InfoStoreToolDetails>(builder: (controller) {
        //   return Buttons(
        //     height: 40,
        //     colorLoading: controller.disableSubmit.value == true
        //         ? Get.theme.primaryColor
        //         : Get.theme.backgroundColor,
        //     disable: controller.disableSubmit.value,
        //     disableWithShowLoading: controller.disableSubmit.value,
        //     fullBackground: store.isSubscribed,
        //     colorOnButton: store.isSubscribed
        //         ? Get.theme.backgroundColor
        //         : Get.theme.primaryColor,
        //     width: double.maxFinite,
        //     label: store.isSubscribed
        //         ? L10n.subscribed.tr
        //         : "${L10n.subscribe.tr} ${L10n.now.tr}",
        //     onPressed: () {
        //       // controller.subscriptionStore(store);
        //     },
        //   );
        // }),
      ],
    );
  }
}
