import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/user/update/password.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class UpdatePassword extends GetView<UpdatePasswordController> {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.updatePassword.tr),
      ),
      body: Form(
        key: controller.formKeyUpdatePassword,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace24(),
              Obx(
                () => InputAuth(
                  label: L10n.password.tr,
                  prefixIcon: Iconsax.lock,
                  controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  visibilityPassword: controller.visibilityPassword.value,
                  validator: (password) =>
                      controller.checkValidatePassword(password),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.visibilityPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: controller.toggleShowPassword,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
              ),
              const VerticalSpace8(),
              Obx(
                () => InputAuth(
                  label: L10n.passwordConfirmation.tr,
                  prefixIcon: Iconsax.lock,
                  controller: controller.passwordConfirmation,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  visibilityPassword: controller.visibilityPassword.value,
                  validator: (password) =>
                      controller.checkValidatePassword(password,rePassword: controller.password.text,),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.visibilityPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: controller.toggleShowPassword,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
              ),
              const VerticalSpace24(),
              const VerticalSpace24(),
              GetBuilder<UpdatePasswordController>(
                builder: (_) => Buttons(
                  label: L10n.save.tr,
                  fullBackground: true,
                  width: double.infinity,
                  onPressed: () {
                    if (controller.formKeyUpdatePassword.currentState!
                        .validate()) {
                      controller.updatePassword();
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
