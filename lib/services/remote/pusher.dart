import 'package:get/instance_manager.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/services/remote/pusher_config.dart';
import 'package:sayaaratukum/services/remote/service.dart';

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
      pusherListener();
    }
  }

  pusherListener() {
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
      _pusher.onConnectionStateChange((state) {
        print("PusherServices onConnection ${state?.currentState}");
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
        'Authorization': "$bearer $token",
        'Content -Type': headerAccept,
        'Accept': headerAccept
      }),
    );
  }

  @override
  void dispose() {
    _pusher.disconnect();
    super.dispose();
  }
}
