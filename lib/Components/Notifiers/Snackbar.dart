import 'package:flutter/material.dart';
import 'package:inventory_go/Util/color_constants.dart';
import 'package:overlay_support/overlay_support.dart';

showSnackBar(String ? message) {
  showSimpleNotification(
      Text(
        message!,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
      position: NotificationPosition.bottom,
      background: ColorConstants.primary,
      duration: const Duration(seconds: 2));
}
