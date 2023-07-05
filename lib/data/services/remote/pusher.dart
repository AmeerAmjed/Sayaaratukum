import 'package:get/instance_manager.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sayaaratukum/data/services/remote/pusher_config.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/user/notification.dart';

class PusherServices extends BaseService with PusherConfig {
  static PusherServices get instance => Get.find();

  late PusherClient _pusher;
  Channel? myChannel;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    if (Application.instance.isLogin) {
      pusherSetup();
    }
  }

  pusherSetup() {
    try {
      var options = optionsPusher();
      _pusher = PusherClient(
        key,
        options,
        autoConnect: true,
        enableLogging: true,
      );
      _pusher.connect();
      myChannel = _pusher.subscribe(channel);
      _pusher.onConnectionStateChange((state) async {
        print("PusherServices onConnection ${state?.currentState}");
        if (state?.currentState == "CONNECTED") {
          await pusherListener();
        }
      });

      _pusher.onConnectionError((error) {
        init();
        print(" PusherServices error: ${error?.message} onConnectionError");
      });
    } catch (error) {
      init();
      print("error PusherServices no connection $error");
    }
  }

  PusherOptions optionsPusher() {
    return PusherOptions(
      wsPort: port,
      encrypted: true,
      host: hostEndPoint,
      cluster: cluster,
      auth: PusherAuth(hostAuthEndPoint, headers: {
        'Authorization': "Bearer $token",
        // 'Accept': headerAccept
      }),
    );
  }

  pusherListener() async {
    await myChannel?.bind(eventName, (event) async {
      try {
        await NotificationController.instance.init();
        print("PusherServices update new update product_created $event");
      } catch (error) {
        print(" PusherServices error product_created $event");
      }
    }).catchError((error) {
      print(" PusherServices error product_created $error");
    });
  }

  @override
  void dispose() {
    _pusher.disconnect();
    super.dispose();
  }
}
