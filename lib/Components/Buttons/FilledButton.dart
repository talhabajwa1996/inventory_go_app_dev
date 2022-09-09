import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String? title;
  final Gradient? buttonGradients;
  final double? width;
  final double? height;
  final double? btnRadius;
  final Color? textColor;
  final Color? btnColor, borderColor;
  final VoidCallback? onPressed;
  final double? fontSize;
  final FontWeight ? fontWeight;

  FilledButton(
      {this.title,
      this.onPressed,
      this.width,
      this.fontWeight,
      this.fontSize,
      this.height,
      this.textColor,
      this.btnColor,
      this.borderColor,
      this.btnRadius,
      this.buttonGradients});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(btnRadius ?? 20))),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: btnColor ?? Colors.transparent,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius ?? 20)),
          minimumSize: Size(width!, height!),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          title!,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w500),
          maxLines: 1,
        ),
      ),
    );
  }
}
