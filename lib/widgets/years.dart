import 'package:flutter/material.dart';

final List<Widget> yearItems = List<Widget>.generate(50, (int index) {
  final int year = DateTime.now().year - index;
  return Text(
    year.toString(),
    style: const TextStyle(fontSize: 20.0),
  );
});
