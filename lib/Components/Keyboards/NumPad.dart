import 'package:flutter/material.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;
  final double height;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    this.height = 300,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // implement the number keys (from 0 to 9) with the NumberButton widget
              // the NumberButton widget is defined in the bottom of this file
              children: [
                NumberButton(
                  number: 1,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 2,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 3,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 4,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 5,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 6,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 7,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 8,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 9,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this button is used to delete the last number
              SymbolButton(
                symbol: '.',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 0,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () => delete(),
                  icon: const Icon(
                    Icons.backspace_outlined,
                  ),
                  iconSize: 20,
                ),
              ),
              // this button is used to submit the entered value
            ],
          ),
        ],
      ),
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: InkWell(
          onTap: () {
            controller.text += number.toString();
          },
          child: Center(
            child: Text(
              number.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class SymbolButton extends StatelessWidget {
  final String symbol;
  final double size;
  final Color color;
  final TextEditingController controller;

  const SymbolButton({
    Key? key,
    required this.symbol,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: InkWell(
          onTap: () {
            controller.text += symbol.toString();
          },
          child: Center(
            child: Text(
              symbol.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
