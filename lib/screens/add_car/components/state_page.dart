import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sayaaratukum/l10n/lang.dart';

class ProgressState extends StatelessWidget {
  const ProgressState({
    Key? key,
    required this.myOrderState,
  }) : super(key: key);

  final int myOrderState;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      // color: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Container(
            alignment: Alignment.center,
            width: 100,
            child: ticks(
              context: context,
              myOrderState: myOrderState,
              orderState: states[index],
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  Widget ticks({
    required BuildContext context,
    required int myOrderState,
    required OrderState orderState,
    required int index,
  }) {
    List<String> labelState = [
      L10n.informationCar.tr,
      L10n.locationCar.tr,
      L10n.imagesCar.tr,
    ];
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: orderState.id == 1
                  ? line(null)
                  : orderState.id <= myOrderState + 1
                      ? line('#27AE60')
                      : line('#EBEBEB'),
            ),
            Container(
              height: 32.0,
              width: 32.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: orderState.id <= myOrderState + 1
                      ? Colors.green
                      : Colors.grey,
                ),
                color: orderState.id <= myOrderState
                    ? Colors.green
                    : Get.theme.cardColor,
              ),
              child: myOrderState >= orderState.id // isChecked
                  ? Icon(
                      Icons.check,
                      color: Get.theme.cardColor,
                      size: 16,
                    )
                  : Text(
                      orderState.id.toString(),
                      style: TextStyle(
                        color: myOrderState == orderState.id
                            ? Colors.green
                            : (orderState.id > myOrderState + 1
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ),
            ),
            // if (orderState.id != 3)
            Expanded(
              child: orderState.id == 3
                  ? line(null)
                  : orderState.id < myOrderState + 1
                      ? line('#27AE60')
                      : line('#EBEBEB'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            labelState[index],
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: myOrderState >= orderState.id ? Colors.green : Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  Widget line(String? color) {
    return Container(
      color: color != null ? Color(color.getHexValue()) : Colors.transparent,
      height: 2.0,
      width: 30,
    );
  }
}

class OrderState {
  int id;
  String color;

  OrderState({
    required this.id,
    required this.color,
  });
}

List<OrderState> states = [
  OrderState(
    id: 1,
    color: '#27AE60',
  ),
  OrderState(
    id: 2,
    color: '#27AE60',
  ),
  OrderState(
    id: 3,
    color: '#EBEBEB',
  ),
];

extension HexString on String {
  int getHexValue() => int.parse(replaceAll('#', '0xff'));
}
