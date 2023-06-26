import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/vin_check.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/hard_code.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class VinCheck extends GetView<VinCheckController> {
  const VinCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.vinCheck.tr,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const VerticalSpace8(),
            InputAuth(
              controller: controller.fullName,
              label: L10n.name.tr,
              keyboardType: TextInputType.name,
              validator: (fullName) => ValidatorInput.checkValidateIsRequired(
                L10n.isRequired.tr,
                fullName,
              ),
            ),
            const VerticalSpace8(),
            InputAuth(
              label: L10n.phoneNumber.tr,
              hintText: "",
              controller: controller.phoneNumber,
              keyboardType: TextInputType.number,
              validator: (emailOrNumberPhone) =>
                  ValidatorInput.checkValidateIsRequired(
                L10n.isRequired.tr,
                emailOrNumberPhone,
              ),
            ),
            const VerticalSpace8(),
            DropdownList(
              label: L10n.creditType.tr,
              onChanged: controller.onChangeCreditType,
              items:
                  HardCode.creditTypes.map((map) => map.values.first).toList(),
              validator: (creditType) => ValidatorInput.checkValidateIsRequired(
                  L10n.isRequired.tr, creditType),
            ),
            const VerticalSpace8(),
            InputAuth(
              label: L10n.creditCard.tr,
              hintText: "",
              controller: controller.creditNumber,
              keyboardType: TextInputType.number,
              validator: (creditCard) => ValidatorInput.checkValidateIsRequired(
                L10n.isRequired.tr,
                creditCard,
              ),
            ),
            const VerticalSpace8(),
            InputAuth(
              label: L10n.vinNumber.tr,
              hintText: "",
              controller: controller.vinNumber,
              keyboardType: TextInputType.number,
              validator: (emailOrNumberPhone) =>
                  ValidatorInput.checkValidateIsRequired(
                L10n.isRequired.tr,
                emailOrNumberPhone,
              ),
            ),
            const VerticalSpace8(),
            DropdownList(
              label: L10n.madeTo.tr,
              onChanged: controller.onChangeMadeTo,
              validator: (madeTo) => ValidatorInput.checkValidateIsRequired(
                  L10n.isRequired.tr, madeTo),
              items: HardCode.madeTo.map((map) => map.values.first).toList(),
            ),
            const VerticalSpace8(),
            InputAuth(
              controller: controller.notes,
              label: L10n.description.tr,
              keyboardType: TextInputType.text,
              maxLines: 3,
            ),
            const VerticalSpace8(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: GetBuilder<VinCheckController>(
          builder: (_) => Buttons(
            label: L10n.publish.tr,
            fullBackground: true,
            width: double.infinity,
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                controller.createCheck();
              }
            },
            disableWithShowLoading: controller.disableSubmit.value,
          ),
        ),
      ),
    );
  }
}
