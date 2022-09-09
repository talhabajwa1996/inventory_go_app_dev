import 'package:flutter/material.dart';
import 'package:inventory_go/Util/image_constants.dart';

class GifLoader extends StatelessWidget {
  final double ? value;
  final double ? strokeWidth;
  final Animation<Color> ? valueColor;

  GifLoader({this.strokeWidth, this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageConstants.loaderGif,
      width: strokeWidth != null?30:46,
      height: strokeWidth != null?30:46,
      gaplessPlayback: true,
      fit: BoxFit.contain,
    );
  }
}
