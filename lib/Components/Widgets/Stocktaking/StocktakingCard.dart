import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Buttons/AmountButton.dart';
import 'package:inventory_go/Components/Buttons/CustomDropdownButton.dart';
import 'package:inventory_go/Util/color_constants.dart';

class StocktakingCard extends StatelessWidget {
  final String? item;
  final String? id;
  final String? barcodeNo;
  final String? weight;
  final List<String>? unites;
  final String? selectedUnit;
  final double? amountOfProduct;
  final VoidCallback? onProductAmountTapped;
  final void Function(String?)? onDropdownValueChanged;

  const StocktakingCard(
      {this.id,
      this.barcodeNo,
      this.item,
      this.weight,
      this.amountOfProduct,
      this.onProductAmountTapped,
      this.selectedUnit,
      this.unites,
      this.onDropdownValueChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            id!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: ColorConstants.grey.withOpacity(0.8)),
                          ),
                          Text(
                            "Barcode: " + barcodeNo!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: ColorConstants.grey.withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CustomDropdownButton(
                          items: unites,
                          dropdownValue: selectedUnit,
                          onChanged: onDropdownValueChanged,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AmountButton(amount: amountOfProduct, onTapped: onProductAmountTapped),
                      )
                    ],
                  )
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
