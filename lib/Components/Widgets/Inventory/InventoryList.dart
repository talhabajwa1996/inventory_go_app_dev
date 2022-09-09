import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Widgets/Inventory/InventoryCard.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => const InventoryCard(
        item: "Water Nova",
        id: 'SKU 7463',
        barcodeNo: "02154875823",
        weight: "KG 25.000",
      ),
    );
  }
}
