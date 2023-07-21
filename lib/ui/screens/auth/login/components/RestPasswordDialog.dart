import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/auth/login.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets/input.dart';
import 'package:sayaaratukum/ui/widgets/vertical_space.dart';

restPasswordDialog({
  VoidCallback? onPressedAction,
  required LoginController controller,
}) {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.backgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                color: Get.theme.backgroundColor,
                child: Form(
                  key: controller.resetPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            L10n.resetPassword.tr,
                            style: Get.textTheme.labelLarge?.copyWith(
                                // color: isDanger ? ColorSystem.colorDanger : null,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            splashRadius: 24.0,
                            icon: Icon(
                              Icons.close,
                              color: Get.textTheme.labelLarge?.color
                                  ?.withOpacity(0.2),
                            ),
                          )
                        ],
                      ),
                      const VerticalSpace8(),
                      InputAuth(
                        label: L10n.email.tr,
                        hintText: "",
                        margin: EdgeInsets.zero,
                        controller: controller.email,
                        keyboardType: TextInputType.text,
                        validator: (emailOrNumberPhone) =>
                            controller.checkValidateIsRequired(
                          emailOrNumberPhone,
                        ),
                      ),
                      const VerticalSpace32(),
                      GetBuilder<LoginController>(
                        builder: (_) => Buttons(
                          label: L10n.resetPassword.tr,
                          fullBackground: true,
                          padding: const EdgeInsets.all(0),
                          width: double.infinity,
                          onPressed: () {
                            if (controller.resetPasswordFormKey.currentState!
                                .validate()) {
                              controller.resetPassword();
                            }
                          },
                          disableWithShowLoading:
                              controller.disableSubmitResetPassword.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
