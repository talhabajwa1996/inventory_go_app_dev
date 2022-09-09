import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Buttons/FilledButton.dart';
import 'package:inventory_go/Components/Textfields/CustomTextFormField.dart';
import 'package:inventory_go/Components/Textfields/DropDownFormField.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';

class ControlPanelStocktaking extends StatelessWidget {
  const ControlPanelStocktaking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.controlPanelBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomDropDownFormField(
            hintText: 'All Sites',
          ),
          const SizedBox(height: 10),
          CustomDropDownFormField(
            hintText: 'All Warehouse',
          ),
          const SizedBox(height: 10),
          CustomDropDownFormField(
            hintText: 'Tags',
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              height: 30,
              width: 100,
              title: 'Search',
              btnColor: ColorConstants.primary,
              textColor: ColorConstants.black,
              btnRadius: 0,
            ),
          ),
        ],
      ),
    );
  }
}
