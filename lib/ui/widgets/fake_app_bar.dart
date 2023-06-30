import 'package:flutter/material.dart';

class FakeAppBar extends StatelessWidget with PreferredSizeWidget {
  const FakeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  Size get preferredSize => const Size(double.infinity, 10);
}
