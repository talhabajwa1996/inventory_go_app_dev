import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Widgets/Drawer/AppDrawer.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget? body;

  AppScaffold({this.title, this.body, Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                      icon: const Icon(AppIcons.menu)),
                ),
                Text(
                  title!,
                  style: const TextStyle(
                      color: ColorConstants.secondary,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 70),
              ],
            ),
            Expanded(child: body!)
          ],
        ),
      ),
    );
  }
}
