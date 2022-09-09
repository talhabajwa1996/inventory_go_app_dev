import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';
import 'package:inventory_go/Util/globals.dart';
import 'package:inventory_go/Util/image_constants.dart';
import 'package:inventory_go/Util/route_constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              ImageConstants.appLogo,
              width: 170,
            ),
            const SizedBox(height: 3),
            const Text(
              'InventoryGo',
              style: TextStyle(
                  color: ColorConstants.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 5,
              color: ColorConstants.black,
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: DrawerItem(
                leadingIcon: AppIcons.star,
                title: 'Home',
                color: ColorConstants.lightBlue,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: DrawerItem(
                leadingIcon: AppIcons.edit,
                title: 'Change Password',
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: DrawerItem(
                leadingIcon: AppIcons.cross,
                title: 'Logout',
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteConstants.initialRoute, (route) => false),
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              'Powered by: SolutionDot',
              style: TextStyle(
                  color: ColorConstants.black.withOpacity(0.3),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
            Text(
              'V $APP_VERSION',
              style: TextStyle(
                  color: ColorConstants.black.withOpacity(0.3),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData? leadingIcon;
  final String? title;
  final VoidCallback? onPressed;
  final Color? color;

  const DrawerItem(
      {this.onPressed, this.title, this.leadingIcon, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: 270,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                leadingIcon,
                color: ColorConstants.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
