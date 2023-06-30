import 'package:get/get.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

callNow(String? numberPhone) {
  if (numberPhone != null) {
    OpenLink.dial(phoneNumber: numberPhone!);
  } else {
    customSnackBar(L10n.numberPhoneNotAdd.tr);
  }
}

chatNow(String? whatsappNumberPhone) {
  if (whatsappNumberPhone != null) {
    OpenLink.launchWhatsapp(phoneNumber: whatsappNumberPhone);
  } else {
    customSnackBar(L10n.whatsappNumberPhoneNotAdd.tr);
  }
}

class OpenLink {
  static url(String url) async {
    final Uri urlWebSite = Uri.parse(url);

    try {
      await launchUrl(
        urlWebSite,
        mode: LaunchMode.externalApplication,
      );
    } on Exception catch (_) {
      print('Could not launch $urlWebSite');
    }
  }

  static Future<void> dial({
    required String phoneNumber,
  }) async {
    bool isISDNumber(String number) {
      final regex = RegExp(r'^\+\d{1,3}\s?\d+$');
      return regex.hasMatch(number);
    }

    final Uri dialNumberUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    try {
      await launchUrl(
        dialNumberUri,
      );
    } on Exception catch (_) {
      // snackbarMessage(
      //   title: 'الاتصال',
      //   description: 'حدث مشكله في الاتصال',
      // );
      print('Could not dial Number $phoneNumber');
    }

    return;
  }

  static launchWhatsapp({
    required String phoneNumber,
  }) async {
    String message = "السلام عليكم";
    String url() {
      return 'https://wa.me/$phoneNumber?text=${Uri.parse(message)}';
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      customSnackBar(
        L10n.whatsappNotInstall.tr,
        marginBottom: .0,
        duration: const Duration(seconds: 1),
        backgroundColor: ColorSystem.snackBar,
        mainButton: null,
      );
    }
  }
}
