import 'dart:convert';

import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/models/notification_model.dart';
import 'package:sayaaratukum/services/remote/pusher.dart';

pusherListener() async {
  if (Application.instance.isLogin) {
    await PusherServices.instance.myChannel
        ?.bind(PusherServices.instance.channel, (event) {
      try {
        dynamic dataProduct = event?.data;
        if (dataProduct != null) {
          var data = jsonDecode(dataProduct);
          NotificationModel notification =
              NotificationModel.fromJson(data['product']);
          print("aS$notification");
          // DataBase.insert(notification).then((value) {
          //   try {
          //     if (Application.to.isNotificationActive.value) {
          //       var lang = Platform.localeName.split('_')[0];
          //       var message = "";
          //       if (lang == "ar") {
          //         message = "تم اضافة منتج جديد";
          //       } else {
          //         message = "New product added";
          //       }
          //
          //       NotificationService.show(
          //         id: notification.idProduct,
          //         title: notification.title,
          //         body: message,
          //       );
          //
          //     }
          //
          //     NotificationController.to.init();
          //   } catch (error) {
          //     print("error NotificationService $notification");
          //   }
          // });
        }
      } catch (error) {
        print("error product_created $event");
      }
    });
  }
}
