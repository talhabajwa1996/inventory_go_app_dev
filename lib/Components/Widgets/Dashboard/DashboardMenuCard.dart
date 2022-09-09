import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Buttons/FilledButton.dart';
import 'package:inventory_go/Util/color_constants.dart';

class DashboardMenuCard extends StatelessWidget {
  final String? title;
  final String? image;
  final VoidCallback? onPressed;

  const DashboardMenuCard(
      {@required this.title, this.image, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: ColorConstants.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              color: ColorConstants.black,
              height: 40,
            ),
            const SizedBox(height: 10),
            Text(title!,
                style: const TextStyle(
                    color: ColorConstants.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
