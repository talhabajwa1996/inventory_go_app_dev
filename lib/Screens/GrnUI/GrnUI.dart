import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Scaffold/AppScaffold.dart';
import 'package:inventory_go/Components/Widgets/GRN/ControlPanelGRN.dart';
import 'package:inventory_go/Components/Widgets/GRN/GrnList.dart';

class GrnUI extends StatefulWidget {
  const GrnUI({Key? key}) : super(key: key);

  @override
  State<GrnUI> createState() => _GrnUIState();
}

class _GrnUIState extends State<GrnUI> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'GRN',
      body: Column(
        children: const [
          ControlPanelGrn(),
          Divider(thickness: 2, height: 2),
          Expanded(child: GrnList())
        ],
      ),
    );
  }
}
