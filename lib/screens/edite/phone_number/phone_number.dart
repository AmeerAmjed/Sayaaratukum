import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/user/update/phone_number.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class UpdatePhoneNumber extends GetView<UpdatePhoneNumberController> {
  const UpdatePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.updatePhoneNumber.tr),
      ),
      body: Form(
        key: controller.formKeyUpdatePhoneNumber,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace24(),
              InputAuth(
                label: L10n.phoneNumber.tr,
                hintText: "07## ### ####",
                prefixIcon: Iconsax.mobile,
                controller: controller.phoneNumber,
                keyboardType: TextInputType.number,
                validator: (phoneNumber) => controller.checkValidateIsRequired(
                  phoneNumber,
                ),
              ),
              const VerticalSpace24(),
              const VerticalSpace24(),
              GetBuilder<UpdatePhoneNumberController>(
                builder: (_) => Buttons(
                  label: L10n.save.tr,
                  fullBackground: true,
                  width: double.infinity,
                  onPressed: () {
                    if (controller.formKeyUpdatePhoneNumber.currentState!
                        .validate()) {
                      controller.updatePhoneNumber();
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
