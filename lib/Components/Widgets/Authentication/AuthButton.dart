import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Buttons/FilledButton.dart';
import 'package:inventory_go/Util/color_constants.dart';

class AuthButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const AuthButton({this.title, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      height: 50,
      width: MediaQuery.of(context).size.width,
      title: title ?? "",
      btnRadius: 2,
      onPressed: onPressed,
      btnColor: ColorConstants.secondary,
    );
  }
}
