import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Scaffold/AppScaffold.dart';
import 'package:inventory_go/Components/Widgets/Inventory/ControlPanelInventory.dart';
import 'package:inventory_go/Components/Widgets/Inventory/InventoryList.dart';

class InventoryUI extends StatefulWidget {
  const InventoryUI({Key? key}) : super(key: key);

  @override
  State<InventoryUI> createState() => _InventoryUIState();
}

class _InventoryUIState extends State<InventoryUI> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Inventory',
      body: Column(
        children: const [
          ControlPanelInventory(),
          Divider(thickness: 2, height: 2),
          Expanded(child: InventoryList())
        ],
      ),
    );
  }
}
