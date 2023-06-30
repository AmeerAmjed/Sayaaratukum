import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/user/notification.dart';
import 'package:sayaaratukum/services/remote/pusher.dart';

pusherListener() async {
  if (Application.instance.isLogin) {
    await PusherServices.instance.myChannel
        ?.bind(PusherServices.instance.channel, (event) async {
      try {
        await NotificationController.instance.init();
        print("Pusher update new update product_created $event");
      } catch (error) {
        print("error product_created $event");
      }
    });
  }
}
