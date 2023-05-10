import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

yearBrand(
  BuildContext context,
  Function(int)? onSelectYearModel,
  List<Widget> yearItems,
) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: onSelectYearModel,
                  itemExtent: 35.0,
                  children: yearItems,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Get.back();
              //   },
              //   child: Text('Close Bottom Sheet'),
              // ),
            ],
          ),
        );
      });
}
