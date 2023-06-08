import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/user/update/email.dart';
import 'package:sayaaratukum/controllers/user/update/password.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class UpdateEmail extends GetView<UpdateEmailController> {
  const UpdateEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.updateEmail.tr),
      ),
      body: Form(
        key: controller.formKeyUpdateEmail,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace24(),
              InputAuth(
                label: L10n.email.tr,
                hintText: "example@y.com",
                prefixIcon: Iconsax.sms,
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                validator: (email) => controller.checkValidateEmail(email),
              ),
              const VerticalSpace24(),
              const VerticalSpace24(),
              GetBuilder<UpdateEmailController>(
                builder: (_) => Buttons(
                  label: L10n.save.tr,
                  fullBackground: true,
                  width: double.infinity,
                  onPressed: () {
                    if (controller.formKeyUpdateEmail.currentState!
                        .validate()) {
                      controller.updateEmail();
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
