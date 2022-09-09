import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Keyboards/NumPad.dart';
import 'package:inventory_go/Components/Textfields/CustomTextFormField.dart';
import 'package:inventory_go/Components/Widgets/Stocktaking/StocktakingCard.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';

class StocktakingList extends StatefulWidget {
  const StocktakingList({Key? key}) : super(key: key);

  @override
  State<StocktakingList> createState() => _StocktakingListState();
}

class _StocktakingListState extends State<StocktakingList> {
  final List<String> unites = ["KG", "G"];
  String selectedUnit = 'KG';
  double amountOfProduct = 6.000;

  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomTextFormField(
            inputType: TextInputType.text,
            inputAction: TextInputAction.done,
            hintText: 'Barcode',
            suffixWidget: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Icon(
                AppIcons.barcode,
                size: 30,
                color: ColorConstants.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => StocktakingCard(
              item: "Water Nova Water Nova Water Nova",
              id: 'SKU 7463',
              barcodeNo: "02154875823",
              weight: "KG 25.000",
              amountOfProduct: amountOfProduct,
              selectedUnit: selectedUnit,
              unites: unites,
              onDropdownValueChanged: (value) =>
                  setState(() => selectedUnit = value!),
                onProductAmountTapped: () {
                  setState(() {
                    _amountController.text = amountOfProduct.toStringAsFixed(3);
                  });
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: SizedBox(
                        height: 480,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                'Enter item quantity',
                                style: TextStyle(
                                    color: ColorConstants.grey.withOpacity(0.5),
                                    fontSize: 12),
                              ),
                            ),
                            TextField(
                              controller: _amountController,
                              textAlign: TextAlign.center,
                              enabled: false,
                              style: const TextStyle(fontSize: 30),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                            NumPad(
                              height: 300,
                              controller: _amountController,
                              delete: () {
                                _amountController.text = _amountController.text
                                    .substring(
                                    0, _amountController.text.length - 1);
                              },
                              // do something with the input numbers
                              onSubmit: () {},
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  amountOfProduct =
                                      double.parse(_amountController.text);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 50,
                                color: ColorConstants.secondary,
                                child: const Center(
                                  child: Text(
                                    'Update Quantity',
                                    style:
                                    TextStyle(color: ColorConstants.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
      ],
    );
  }
}
