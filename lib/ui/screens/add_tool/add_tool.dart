import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/user/add_tool.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/add_tool/components/form_add_tool.dart';
import 'package:sayaaratukum/ui/screens/add_tool/components/puplish_tool.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//error.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';

class AddTool extends GetView<AddToolController> {
  const AddTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appbar = AppBars(title: L10n.addTool.tr);

    return controller.obx(
      onError: (e) => Scaffold(
        appBar: appbar,
        body: ErrorScreen(
          textError: e.toString(),
          onPressed: () {
            controller.init();
          },
        ),
      ),
      onLoading: Scaffold(
        appBar: appbar,
        body: const Center(
          child: Loading(),
        ),
      ),
      (state) {
        return Scaffold(
          appBar: appbar,
          body: const FormAddTool(),
          bottomNavigationBar: const PublishTool(),
        );
      },
    );
  }
}
