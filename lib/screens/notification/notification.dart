import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/notification.dart';
import 'package:sayaaratukum/l10n/lang.dart';

class Notification extends GetView<NotificationController> {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.notification.tr),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
