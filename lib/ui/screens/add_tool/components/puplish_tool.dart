import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/user/add_tool.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';

class PublishTool extends GetView<AddToolController> {
  const PublishTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GetBuilder<AddToolController>(
        builder: (_) {
          return Buttons(
            label: L10n.publish.tr,
            fullBackground: true,
            width: double.infinity,
            onPressed: () {
              if (controller.isUpdate.value) {
                if (controller.checkValidationForm()) {
                  controller.updateTool();
                }
              } else {
                if (controller.formKey.currentState!.validate()) {
                  if (controller.checkValidationFormAddTool()) {
                    controller.addTool();
                  }
                }
              }
            },
            disableWithShowLoading: controller.disableSubmit.value,
          );
        },
      ),
    );
  }
}
