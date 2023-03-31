import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

class ContactUser extends StatelessWidget {
  const ContactUser({
    Key? key,
    required this.numberPhone,
    required this.numberPhoneWhatUp,
  }) : super(key: key);

  final String numberPhone;
  final String numberPhoneWhatUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.spacing12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Buttons(
              height: 40,
              label: numberPhone,
              iconRow: Icons.call,
              onPressed: () {},
              background: Get.theme.cardColor,
              colorOnButton: Get.textTheme.labelLarge?.color,
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacing4,
              ),
            ),
          ),
          Expanded(
            child: Buttons(
              height: 40,
              label: numberPhoneWhatUp,
              iconRow: Icons.whatsapp,
              onPressed: () {},
              background: const Color(0xFF2ABD6E),
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacing4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
