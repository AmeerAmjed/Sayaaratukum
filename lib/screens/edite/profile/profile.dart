import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/user/update/profile.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/edite/profile/components/avatar_user.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class UpdateProfile extends GetView<UpdateProfileController> {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.updateProfile.tr),
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace24(),
              const AvatarUser(
                path: "",
              ),
              const VerticalSpace16(),
              InputAuth(
                label: L10n.firstName.tr,
                hintText: "",
                prefixIcon: Iconsax.user,
                controller: controller.firstName,
                keyboardType: TextInputType.name,
                validator: (firstName) =>
                    ValidatorInput.checkValidateIsRequired(
                  L10n.isRequired.tr,
                  firstName,
                ),
              ),
              const VerticalSpace8(),
              InputAuth(
                label: L10n.lastName.tr,
                hintText: "",
                prefixIcon: Iconsax.user,
                controller: controller.lastName,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                validator: (lastName) => ValidatorInput.checkValidateIsRequired(
                  L10n.isRequired.tr,
                  lastName,
                ),
              ),
              const VerticalSpace24(),
              const VerticalSpace24(),
              GetBuilder<UpdateProfileController>(
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
    );
  }
}
