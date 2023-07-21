import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/auth/login.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/screens/auth/components/footer_auth.dart';
import 'package:sayaaratukum/ui/screens/auth/login/components/RestPasswordDialog.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//padding_start.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class FormLogin extends GetView<LoginController> {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const VerticalSpace8(),
              Expanded(
                child: Form(
                  key: controller.loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      InputAuth(
                        label: L10n.emailOrNumberPhone.tr,
                        hintText: "",
                        controller: controller.emailOrNumberPhone,
                        keyboardType: TextInputType.text,
                        validator: (emailOrNumberPhone) =>
                            controller.checkValidateIsRequired(
                          emailOrNumberPhone,
                        ),
                      ),
                      const VerticalSpace24(),
                      Obx(
                        () => InputAuth(
                          label: L10n.password.tr,
                          controller: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          visibilityPassword:
                              controller.visibilityPassword.value,
                          validator: (password) =>
                              controller.checkValidatePassword(password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.visibilityPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              controller.toggle();
                            },
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const VerticalSpace8(),
                      Container(
                        width: double.infinity,
                        margin: spacingH16(),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            restPasswordDialog(controller: controller);
                          },
                          child: Text(
                            L10n.forgotPassword.tr,
                            style: Get.textTheme.labelMedium,
                          ),
                        ),
                      ),
                      const VerticalSpace8(),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.06),
                child: Column(
                  children: [
                    GetBuilder<LoginController>(
                      builder: (_) => Buttons(
                        label: L10n.login.tr,
                        fullBackground: true,
                        width: double.infinity,
                        onPressed: () {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            controller.login();
                          }
                        },
                        disableWithShowLoading: controller.disableSubmit.value,
                      ),
                    ),
                    const Space(
                      height: 34,
                    ),
                    Container(
                      margin: spacing32(),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () =>
                            controller.navigateTo(RouteScreen.register),
                        child: AuthFooter(
                          label: L10n.alreadyHaveAccount.tr,
                          action: L10n.createAccount.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
