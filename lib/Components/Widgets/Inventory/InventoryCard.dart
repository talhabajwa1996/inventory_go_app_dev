import 'package:flutter/material.dart';
import 'package:inventory_go/Util/color_constants.dart';

class InventoryCard extends StatelessWidget {
  final String? item;
  final String? id;
  final String? barcodeNo;
  final String? weight;

  const InventoryCard(
      {this.id, this.barcodeNo, this.item, this.weight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        id!,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: ColorConstants.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        "Barcode: " + barcodeNo!,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: ColorConstants.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        weight!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
            color: ColorConstants.black12,
            height: 1.5,
          )
        ],
      ),
    );
  }
}
