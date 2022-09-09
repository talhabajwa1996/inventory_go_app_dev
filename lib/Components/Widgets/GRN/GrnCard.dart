import 'package:flutter/material.dart';
import 'package:inventory_go/Util/color_constants.dart';

class GrnCard extends StatelessWidget {
  final String? item;
  final String? grnId;
  final String? orderDate;
  final String? status;
  final VoidCallback ? onTap;

  const GrnCard({this.grnId, this.status, this.item, this.orderDate, this.onTap ,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ColorConstants.grnItemCardBackgroundColor,
          border: Border.all(color: ColorConstants.black12)
        ),
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GRN ID# " + grnId!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: ColorConstants.grey.withOpacity(0.8)),
                    ),
                    Text(
                      item!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Order Date:  " + orderDate!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: ColorConstants.grey.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1.5,
              color: ColorConstants.black12,
              height: 1.5,
            ),
            Container(
              height: 60,
              width: size.width,
              color: ColorConstants.lightBlue.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: ColorConstants.grey.withOpacity(0.8)),
                  ),
                  const Text(
                    "Pending",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorConstants.secondary),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
