import 'package:flutter/material.dart';
import 'package:inventory_go/Util/color_constants.dart';

class AmountButton extends StatelessWidget {
  final double? amount;
  final VoidCallback? onTapped;

  const AmountButton({this.amount, this.onTapped, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
          width: 70,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.black, width: 1)),
          child: Center(child: Text(amount!.toStringAsFixed(3)))),
    );
  }
}
