import 'package:sayaaratukum/data/services/remote/pusher.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/user/notification.dart';

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
