import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/auth/register.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/auth/register/components/form.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class Register extends GetView<RegisterController> {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.register.tr),
        actions: [
          TextButton(
            onPressed: () => controller.skipAuth(),
            child: Text(
              L10n.skip.tr,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.color
                        ?.withOpacity(0.6),
                  ),
            ),
          ),
        ],
      ),
      body: Column(
        children: const <Widget>[
          VerticalSpace24(),
          // AvatarUser(
          //   onTap: controller.imageAvatar,
          //   path: controller.imagePath.value,
          // ),
          Expanded(
            flex: 1,
            child: FormRegister(),
          ),
        ],
      ),
    );
  }
}
