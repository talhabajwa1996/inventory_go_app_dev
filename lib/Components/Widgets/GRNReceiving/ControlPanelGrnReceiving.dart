import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Buttons/FilledButton.dart';
import 'package:inventory_go/Components/Textfields/CustomTextFormField.dart';
import 'package:inventory_go/Components/Textfields/DropDownFormField.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';

class ControlPanelGrnReceiving extends StatelessWidget {
  const ControlPanelGrnReceiving({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: ColorConstants.controlPanelBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'GRN ID ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: ColorConstants.black.withOpacity(0.7)),
            ),
            const TextSpan(
              text: '# 3837',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ColorConstants.black),
            ),
          ])),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Order Date: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: ColorConstants.black.withOpacity(0.7)),
            ),
            const TextSpan(
              text: ' 15-02-2022',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ColorConstants.black),
            ),
          ])),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Vendor name: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: ColorConstants.black.withOpacity(0.7)),
            ),
            const TextSpan(
              text: 'AlJawady Trading Est.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ColorConstants.black),
            ),
          ]))
        ],
      ),
    );
  }
}
