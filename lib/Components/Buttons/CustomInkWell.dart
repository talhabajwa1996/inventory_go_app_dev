import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final Widget ? child;
  final VoidCallback ? onTap;

  CustomInkWell({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child!,
        Material(
          color: Colors.transparent,
          child: InkWell(onTap: onTap),
        )
      ],
    );
  }
}
