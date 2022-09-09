import 'package:flutter/material.dart';
import 'package:inventory_go/Util/color_constants.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? dropdownValue;
  final List<String>? items;
  final void Function(String?)? onChanged;

  CustomDropdownButton(
      {this.items, this.dropdownValue, this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.black, width: 1)),
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorConstants.primary,
        ),
        style: const TextStyle(color: Colors.black),
        elevation: 0,
        underline: Container(
          color: Colors.transparent,
        ),
        onChanged: onChanged,
        items: items!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
