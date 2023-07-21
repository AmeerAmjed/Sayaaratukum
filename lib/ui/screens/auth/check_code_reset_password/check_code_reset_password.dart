import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/auth/check_code_reset_password.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets/buttons.dart';
import 'package:sayaaratukum/ui/widgets/input.dart';
import 'package:sayaaratukum/ui/widgets/vertical_space.dart';

class CheckCodResetPassword extends GetView<CheckCodResetPasswordController> {
  const CheckCodResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.codeOTP.tr),
      ),
      body: Form(
        key: controller.OTPFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace24(),
              InputAuth(
                label: L10n.code.tr,
                hintText: "",
                prefixIcon: Iconsax.key,
                controller: controller.otp,
                keyboardType: TextInputType.name,
                validator: (codeOTP) => controller.checkValidateIsRequired(
                  codeOTP,
                ),
              ),
              const VerticalSpace24(),
              const VerticalSpace24(),
              GetBuilder<CheckCodResetPasswordController>(
                builder: (_) => Buttons(
                  label: L10n.check.tr,
                  fullBackground: true,
                  width: double.infinity,
                  onPressed: () {
                    if (controller.OTPFormKey.currentState!.validate()) {
                      controller.checkOTP();
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
    ;
  }
}
