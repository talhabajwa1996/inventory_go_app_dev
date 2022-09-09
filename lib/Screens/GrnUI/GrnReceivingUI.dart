import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Buttons/FilledButton.dart';
import 'package:inventory_go/Components/Widgets/Drawer/AppDrawer.dart';
import 'package:inventory_go/Components/Widgets/GRNReceiving/ControlPanelGrnReceiving.dart';
import 'package:inventory_go/Components/Widgets/GRNReceiving/GrnReceivingList.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';

class GrnReceivingUI extends StatefulWidget {
  final String grnId;

  const GrnReceivingUI(this.grnId, {Key? key}) : super(key: key);

  @override
  State<GrnReceivingUI> createState() => _GrnReceivingUIState();
}

class _GrnReceivingUIState extends State<GrnReceivingUI> {
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
                const SizedBox(),
                const Text(
                  'GRN Receiving',
                  style: TextStyle(
                      color: ColorConstants.secondary,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FilledButton(
                    width: 100,
                    height: 30,
                    btnRadius: 0,
                    btnColor: ColorConstants.primary,
                    textColor: ColorConstants.black,
                    title: "Save",
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Column(
              children: const [
                ControlPanelGrnReceiving(),
                Divider(thickness: 2, height: 2),
                Expanded(child: GrnReceivingList())
              ],
            ))
          ],
        ),
      ),
    );
  }
}
