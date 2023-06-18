import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/auth/register.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/screens/auth/components/footer_auth.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/padding_start.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class FormRegister extends GetView<RegisterController> {
  const FormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const VerticalSpace8(),
              Expanded(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Spacer(),
                      RowTwoWidget(
                        leftWidget: InputAuth(
                          label: L10n.firstName.tr,
                          hintText: "Ameer",
                          prefixIcon: Iconsax.user,
                          controller: controller.firstName,
                          keyboardType: TextInputType.name,
                          validator: (name) =>
                              controller.checkValidateIsRequired(name),
                          margin: const EdgeInsets.only(
                            left: 2,
                          ),
                        ),
                        rightWidget: InputAuth(
                          label: L10n.lastName.tr,
                          hintText: "",
                          prefixIcon: Iconsax.user,
                          controller: controller.lastName,
                          keyboardType: TextInputType.name,
                          validator: (lastName) =>
                              controller.checkValidateIsRequired(lastName),
                          margin: const EdgeInsets.only(
                            right: 2,
                          ),
                        ),
                      ),
                      const VerticalSpace8(),
                      InputAuth(
                        label: L10n.phoneNumber.tr,
                        hintText: "07## ### ####",
                        prefixIcon: Iconsax.mobile,
                        controller: controller.phoneNumber,
                        keyboardType: TextInputType.number,
                        // validator: (phoneNumber) =>
                        //     controller.checkValidateEmailAndPhoneNumber(
                        //   controller.email.text,
                        //   phoneNumber,
                        // ),
                      ),
                      const VerticalSpace8(),
                      InputAuth(
                        label: L10n.email.tr,
                        hintText: "example@y.com",
                        prefixIcon: Iconsax.sms,
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        // validator: (email) =>
                        //     controller.checkValidateEmailAndPhoneNumber(
                        //         email, controller.phoneNumber.text),
                      ),
                      const VerticalSpace8(),
                      Obx(
                        () => InputAuth(
                          label: L10n.password.tr,
                          prefixIcon: Iconsax.lock,
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
                      const VerticalSpace24(),

                      GetBuilder<RegisterController>(
                        builder: (_) => Buttons(
                          label: L10n.createAccount.tr,
                          fullBackground: true,
                          width: double.infinity,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              var checkValidate =
                                  controller.checkValidateEmailAndPhoneNumber(
                                controller.email.text,
                                controller.phoneNumber.text,
                              );
                              if (checkValidate != null) {
                                controller.showMessage(checkValidate);
                              } else {
                                controller.register();
                              }
                            }
                          },
                          disableWithShowLoading: controller.disableSubmit.value,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: spacing32(),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => controller.navigateTo(RouteScreen.register),
                  child: AuthFooter(
                    label: L10n.alreadyHaveAccount.tr,
                    action: L10n.login.tr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
