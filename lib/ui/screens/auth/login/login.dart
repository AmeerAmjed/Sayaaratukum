import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/auth/login.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/auth/components/form.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.login.tr),
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
        children: <Widget>[
          Text(
            L10n.welcomeBack.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Expanded(
            flex: 2,
            child: FormLogin(),
          ),
        ],
      ),
    );
  }
}
