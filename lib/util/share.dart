import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

onClickShare(BuildContext context, String text, {String? subject}) async {
  final box = context.findRenderObject() as RenderBox?;
  await Share.share(
    text,
    subject: subject,
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );
}