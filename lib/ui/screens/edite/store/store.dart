import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/user/update/store.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

import 'components/header_info_store.dart';

class UpdateStoreProfile extends GetView<UpdateStoreProfileController> {
  const UpdateStoreProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.updateProfile.tr),
      ),
      body: controller.obx(
        (state) => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarWithCoverStore(
                  name: state?.name ?? "",
                  cover: state?.cover ?? "",
                  avatar: state?.avatar ?? "",
                ),
                const VerticalSpace24(),
                InputAuth(
                  label: L10n.name.tr,
                  prefixIcon: Iconsax.shop,
                  controller: controller.name,
                  keyboardType: TextInputType.name,
                  validator: (firstName) =>
                      ValidatorInput.checkValidateIsRequired(
                    L10n.isRequired.tr,
                    firstName,
                  ),
                ),
                const VerticalSpace8(),
                InputAuth(
                  label: L10n.emailOrNumberPhone.tr,
                  prefixIcon: Iconsax.mobile,
                  hintText: "07## ### ####",
                  controller: controller.whatsappNumber,
                  keyboardType: TextInputType.number,
                  validator: (whatsappNumber) =>
                      ValidatorInput.checkValidateIsRequired(
                    L10n.isRequired.tr,
                    whatsappNumber,
                  ),
                ),
                const VerticalSpace8(),
                InputAuth(
                  label: L10n.address.tr,
                  prefixIcon: Iconsax.location,
                  controller: controller.location,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  validator: (lastName) =>
                      ValidatorInput.checkValidateIsRequired(
                    L10n.isRequired.tr,
                    lastName,
                  ),
                ),
                const VerticalSpace8(),
                InputAuth(
                  label: L10n.bio.tr,
                  prefixIcon: Iconsax.text,
                  controller: controller.bio,
                  keyboardType: TextInputType.text,
                ),
                const VerticalSpace24(),
                const VerticalSpace24(),
                GetBuilder<UpdateStoreProfileController>(
                  builder: (_) => Buttons(
                    label: L10n.save.tr,
                    fullBackground: true,
                    width: double.infinity,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.updateProfile();
                      }
                    },
                    disableWithShowLoading: controller.disableSubmit.value,
                  ),
                ),
                const VerticalSpace32(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
