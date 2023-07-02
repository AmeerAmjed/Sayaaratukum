import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/main_tab.dart';
import 'package:sayaaratukum/ui/screens/components/image_user.dart';
import 'package:sayaaratukum/ui/screens/components/my_notification.dart';
import 'package:sayaaratukum/ui/widgets/box.dart';
import 'package:sayaaratukum/ui/widgets/horizontal_space.dart';

class MySliverAppBar extends GetView<MainTabController> {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 200,
      leading: Row(
        children: [
          const HorizontalSpace16(),
          SizedBox(
            height: 50,
            width: 50,
            child: InkWell(
              onTap: () {
                controller.scaffoldKey.currentState?.openDrawer();
              },
              child: const Box(
                size: 48.0,
                child: ImageUser(),
              ),
            ),
          )
        ],
      ),
      actions: const [
        FittedBox(
          child: MyNotification(),
        ),
        HorizontalSpace16(),
      ],
      elevation: .0,
      automaticallyImplyLeading: false,
      expandedHeight: 50,
      floating: true,
      snap: true,
    );
  }
}
